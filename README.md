# OpenScienceLab Docs

## Deployment

This repo is configured to deploy to GitHub Pages via the
[`.github/workflows/deploy_pages.yml`](.github/workflows/deploy_pages.yml) Action, and
includes a custom domain in the Pages settings in the repo.

## Development

### Local Development

Create a virtual environment with the tool of your choice, then you can install the
dependencies (from `requirements.txt`) with `make install-deps`.

`make serve` will start a Jupyter Book server, which includes hot reload on file save,
so after you open the local server page in your browser, saving a file will
automatically update the page without requiring a refresh.

### Verifying Format

To test the format and output of the book for a webpage, `make local-deploy` will build
the Jupyter Book to HTML and start the built-in python HTTP server on the build
directory.

Links between pages will be broken, but adding `.html` to the end of the url should
render the page.
