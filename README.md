[![Check Links](https://github.com/ASFOpenSARlab/opensarlab-docs/actions/workflows/links.yml/badge.svg)](https://github.com/ASFOpenSARlab/opensarlab-docs/actions/workflows/check-links.yml)

# OpenScienceLab Docs

## Deployment

This repo is configured to deploy to GitHub Pages via the
[`.github/workflows/deploy_jupyter_book.yaml`](.github/workflows/deploy_jupyter_book.yaml)
Action, and includes a custom domain in the Pages settings in the repo.

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

The intention of `make local-deploy` is to precisely mimic the behaviour of the
deployment action in case there's something broken that doesn't show up with `make serve`.

### Development Workflow

While developing locally, run `make serve` in the background and watch the local Jupyter
Book server for updates as you work (the Book will update when you save!). Once you've
completed the work, run `make local-deploy` to check that the actual content that will
be served on the Pages site looks as you expect, then open your PR to be reviewed and
merged.
