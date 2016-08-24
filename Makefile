ELM_MAKE=./node_modules/.bin/elm-make


help: ## Prints help for targets with comments
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

clean: ## Remove compiled files
	rm -r dist

run: dist/elm-main.js ## Run the app
	node main.js

dist/elm-main.js: ## Compile Elm app
	$(ELM_MAKE) Main.elm --output dist/elm-main.js
