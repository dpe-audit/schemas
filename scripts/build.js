import { readFileSync, writeFileSync } from 'node:fs'
import { globSync } from 'glob'
import { registerSchema } from '@hyperjump/json-schema/draft-2020-12'
import { bundle } from '@hyperjump/json-schema/bundle'
import yaml from 'js-yaml'

const config = yaml.load(
  readFileSync('schemas.config.yaml', { encoding: 'utf-8' })
)

globSync(`${config.source}/**/*.yaml`)
  .map(schema => yaml.load(readFileSync(schema, { encoding: 'utf-8' })))
  .forEach(schema => registerSchema(schema, schema.$id))

config.bundle.forEach(async schema => {
  const bundledSchema = await bundle(schema.$id)
  if (schema.formats.includes('json')) {
    const JSONOutput = JSON.stringify(bundledSchema, null, 2)
    writeFileSync(`${schema.target}.json`, JSONOutput, { encoding: 'utf-8' })
  }
  if (schema.formats.includes('yaml')) {
    const YAMLOutput = yaml.dump(bundledSchema)
    writeFileSync(`${schema.target}.yaml`, YAMLOutput, { encoding: 'utf-8' })
  }
})
