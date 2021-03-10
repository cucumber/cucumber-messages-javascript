include default.mk

JSONSCHEMAS = $(shell find ../jsonschema -name "*.jsonschema")
TS_TYPE_FILES = $(patsubst ../jsonschema/%.jsonschema,src/types/%.ts,$(JSONSCHEMAS))

.codegen: $(TS_TYPE_FILES)

src/types/%.ts: ../jsonschema/%.jsonschema
	ruby scripts/codegen.rb $<
#	node_modules/.bin/json2ts --no-declareExternallyReferenced --cwd ../jsonschema --input $< --output $@

clean:
	rm -rf dist src/types/*.ts
