.PHONY := install-deps
install-deps:
	python3 -m pip install -r requirements.txt
	# install nvm & node
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
	\. "$HOME/.nvm/nvm.sh"
	nvm install 24

.PHONY := serve
serve:
	jupyter book start

.PHONY := build
build:
	myst build --html

.PHONY := local-deploy
local-deploy: build
	-python3 -m http.server -d _build/html
