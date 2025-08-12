import { readFileSync } from 'node:fs'
import { globSync } from 'glob'
import { registerSchema, validate } from '@hyperjump/json-schema/draft-2020-12'
import { BASIC } from '@hyperjump/json-schema/experimental'
import yaml from 'js-yaml'

const load = file => {
  const content = readFileSync(file, { encoding: 'utf-8' })
  return yaml.load(content)
}

const merge = file => {
  let data = load(file)

  const resolve = data => {
    for (let key in data) {
      if (typeof data[key] === 'string' && data[key].endsWith('.yaml')) {
        const referencedData = load(data[key])
        data[key] = resolve(referencedData)
      } else if (typeof data[key] === 'object' && data[key] !== null) {
        data[key] = resolve(data[key])
      }
    }
    return data
  }

  return resolve(data)
}

const schemas = globSync('schemas/**/*.yaml')
const examples = globSync('examples/**/*.yaml')

for (const schema of schemas) {
  const schemaObject = yaml.load(readFileSync(schema, { encoding: 'utf-8' }))
  registerSchema(schemaObject, schemaObject.$id)
}

for (const schema of schemas) {
  const schemaObject = load(schema)
  const exampleFile = examples.find(
    item => item.replace('examples', 'schemas') === schema
  )

  if (!exampleFile) {
    console.warn(`No example found for schema: ${schema}`)
    continue
  }

  let examplesData = merge(exampleFile)

  console.log(`Validating schema: ${schemaObject.$id}`)

  examplesData = Array.isArray(examplesData) ? examplesData : [examplesData]

  for (const data of examplesData) {
    const { valid, errors } = await validate(schemaObject.$id, data, BASIC)

    if (false === valid) {
      console.error(errors.length ? errors : 'Unknown error')
    }
  }
}
