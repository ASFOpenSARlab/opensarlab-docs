# Build latest mintpy and push to custom OpenSARlab conda channel

Sometimes the latest version of MintPy is desired within a notebook but the official release is not current. These instructions will show how to build MintPy and push to a custom conda channel.

_This assumes that the user has an Anaconda.org account and that this account is attached to a `opensarlab` conda channel. Instructions on how to do this are not provided here._


1. Create working directory

```bash
mkdir conda-mintpy
cd conda-mintpy
```


2. Create conda environment

```bash
conda create -n conda-build python=3.10 anaconda-client
conda activate conda-build
```


3. Clone conda feedstock of mintpy. https://github.com/conda-forge/mintpy-feedstock

```bash
git clone git@github.com:conda-forge/mintpy-feedstock.git
```


4. Clone mintpy code repo. https://github.com/insarlab/mintpy. Only the latest commit is included to speed up download. Drop the `--depth 1` to get the whole history.

```bash
git clone --depth 1 git@github.com:insarlab/MintPy.git
```


5. Assuming mintpy main is used and is also the latest, we won't make any changes to mintpy

    The feedstock is a framework for building. It does not have the source code to build within it. Copy Mintpy source to feedstock recipes.

```bash
cp -r MintPy mintpy-feedstock/recipe/MintPy
```


6. Make versioning clear and build MintPy from local. The VERSION here is a working example. The actual version is subject to change.

```text
VERSION=1.3.3.dev.COMMIT_SHORT_HASH
```


7. Edit `mintpy-feedstock/recipe/meta.yaml` 

```diff

-{% set version = "1.3.2" %}
+{% set version = 1.3.3.dev.COMMIT_SHORT_HASH %}

source:
-    url: https://github.com/insarlab/{{ name }}/archive/refs/tags/v{{ version }}.tar.gz
-    sha256: 6c1242dee74f13b96aa4b1f8d50c45ec486397796e4bd4bf3f67849f921bfe7f
+    path: MintPy
```


8. Build
    This may take a while.

```bash
cd mintpy-feedstock
python3.10 build-locally.py
cd ..
```


9. After a successful build, check for artifacts in `mintpy-feedstock/build_artifacts/`


10. Push changes to OpenSARlab conda channel.

```bash
# Login to individual account where you are an owner of OpenSARlab org
anaconda login

# Upload artifacts
anaconda upload --user opensarlab mintpy-feedstock/build_artifacts/noarch/mintpy-*.tar.bz2
```


11. Download and check version

```bash
mamba install -c opensarlab -c conda-forge mintpy=VERSION
conda list | grep -i mintpy
```


12. Cleanup as desired

```bash
cd ../
ls

rm -rf conda-mintpy

conda deactivate
conda env remove -n conda-build
conda env list
```
