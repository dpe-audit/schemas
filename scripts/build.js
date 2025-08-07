import { readFileSync, writeFileSync } from 'node:fs'
import { globSync } from 'glob'
import { registerSchema } from '@hyperjump/json-schema/draft-2020-12'
import { bundle } from '@hyperjump/json-schema/bundle'
import yaml from 'js-yaml'

const schemas = globSync('lib/**/*.yaml')

for (const schema of schemas) {
  console.log(schema)
  const schemaObject = yaml.load(readFileSync(schema, { encoding: 'utf-8' }))
  registerSchema(schemaObject, schemaObject.$id)
}

const bundledSchema = await bundle('https://schemas.dpe-audit.fr/ressource')
const JSONOutput = JSON.stringify(bundledSchema, null, 2)
const YAMLOutput = yaml.dump(bundledSchema)

writeFileSync(`./schema.json`, JSONOutput, { encoding: 'utf-8' })
writeFileSync(`./schema.yaml`, YAMLOutput, { encoding: 'utf-8' })
