import { readFileSync } from 'node:fs'
import { globSync } from 'glob'
import { registerSchema, validate } from '@hyperjump/json-schema/draft-2020-12'
import { BASIC } from '@hyperjump/json-schema/experimental'
import yaml from 'js-yaml'

const schemas = globSync('schemas/**/*.yaml')
const examples = globSync('examples/**/*.yaml')

for (const schema of schemas) {
  const schemaObject = yaml.load(readFileSync(schema, { encoding: 'utf-8' }))
  registerSchema(schemaObject, schemaObject.$id)
}

for (const schema of schemas) {
  const schemaObject = yaml.load(readFileSync(schema, { encoding: 'utf-8' }))
  const exampleFile = examples.find(
    item => item.replace('examples', 'schemas') === schema
  )

  if (!exampleFile) {
    console.warn(`No example found for schema: ${schema}`)
    continue
  }

  const examplesData = yaml.load(
    readFileSync(exampleFile, { encoding: 'utf-8' })
  )

  console.log(`Validating schema: ${schemaObject.$id}`)

  for (const data of examplesData) {
    const { valid, errors } = await validate(schemaObject.$id, data, BASIC)

    if (false === valid) {
      console.error(errors.length ? errors : 'Unknown error')
    }
  }
}
