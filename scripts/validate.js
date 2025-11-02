import { readFileSync } from 'node:fs'
import { globSync } from 'glob'
import { registerSchema, validate } from '@hyperjump/json-schema/draft-2020-12'
import { BASIC } from '@hyperjump/json-schema/experimental'
import yaml from 'js-yaml'

const config = yaml.load(
  readFileSync('schemas.config.yaml', { encoding: 'utf-8' })
)

const load = file => {
  const content = readFileSync(file, { encoding: 'utf-8' })
  return yaml.load(content)
}

const merge = data => {
  const resolve = data => {
    for (let key in data) {
      if (typeof data[key] === 'string' && data[key].startsWith(config.uri)) {
        const target = data[key].split('#')[0]
        const index = data[key].split('#')[1] ?? null
        let referencedData = examples.find(item => item.schema === target)
        referencedData = referencedData.examples
        referencedData = referencedData[index] ?? referencedData

        data[key] = resolve(referencedData)
      } else if (typeof data[key] === 'object' && data[key] !== null) {
        data[key] = resolve(data[key])
      }
    }
    return data
  }

  return resolve(data)
}

const schemas = globSync(`${config.source}/**/*.yaml`).map(file => load(file))
const examples = globSync(`${config.examples}/**/*.yaml`).map(file =>
  load(file)
)

for (const schema of schemas) {
  registerSchema(schema, schema.$id)
}

for (const schema of schemas) {
  const example = examples.find(item => item.schema === schema.$id)

  if (!example) {
    console.warn(`No example found for schema: ${schema.$id}`)
    continue
  }

  let dataset = merge(example.examples)

  console.log(`Validating schema: ${schema.$id}`)

  for (const data of dataset) {
    try {
      const { valid, errors } = await validate(schema.$id, data, BASIC)

      if (!valid) {
        console.warn(errors.length ? errors : 'Unknown error')
      }
    } catch (error) {
      console.error(error)
    }
  }
}
