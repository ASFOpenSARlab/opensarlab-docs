.PHONY := install-deps
install-deps:
	python3 -m pip install -r requirements.txt

.PHONY := build
build:
	myst build --html

.PHONY := local-deploy
local-deploy: build
	-python3 -m http.server -d _build/html
