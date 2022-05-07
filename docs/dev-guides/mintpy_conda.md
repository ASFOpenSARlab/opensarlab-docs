# Build latest mintpy and push to custom OpenSARlab conda channel

Sometimes the latest version of MintPy is desired within a notebook but the official release is not current. These instructions will show how to build MintPy and push to a custom conda channel.

_This assumes that the user has an Anaconda.org account and that this account is attached to a `opensarlab` conda channel. Instructions on how to do this are not provided here._

Create working directory

```
mkdir conda-mintpy
cd conda-mintpy
```

Create conda environment

```
conda create -n conda-build python=3.10 anaconda-client
conda activate conda-build
```

Clone conda feedstock of mintpy. https://github.com/conda-forge/mintpy-feedstock

```
git clone git@github.com:conda-forge/mintpy-feedstock.git
```

Clone mintpy code repo. https://github.com/insarlab/mintpy. Only the latest commit is included to speed up download. Drop the `--depth 1` to get the whole history.

```
git clone --depth 1 git@github.com:insarlab/MintPy.git
```

Assuming mintpy main is used and is also the latest, we won't make any changes to mintpy

The feedstock is a framework for building. It does not have the source code to build within it. Copy Mintpy source to feedstock recipes.

```
cp -r MintPy mintpy-feedstock/recipe/MintPy
```

Make versioning clear and build MintPy from local. The VERSION here is a working example. The actual version is subject to change.

```
VERSION=1.3.3.dev.COMMIT_SHORT_HASH
```

Edit `mintpy-feedstock/recipe/meta.yaml` 

```
-{% set version = "1.3.2" %}
+{% set version = 1.3.3.dev.COMMIT_SHORT_HASH %}

 source:
-    url: https://github.com/insarlab/{{ name }}/archive/refs/tags/v{{ version }}.tar.gz
-    sha256: 6c1242dee74f13b96aa4b1f8d50c45ec486397796e4bd4bf3f67849f921bfe7f
+    path: MintPy
```

Build. This may take a while.

```
cd mintpy-feedstock
python3.10 build-locally.py
cd ..
```

After a successful build, check for artifacts in `mintpy-feedstock/build_artifacts/`

Push changes to OpenSARlab conda channel.

```
# Login to individual account where you are an owner of OpenSARlab org
anaconda login

# Upload artifacts
anaconda upload --user opensarlab mintpy-feedstock/build_artifacts/noarch/mintpy-*.tar.bz2
```

Download and check version

```
mamba install -c opensarlab -c conda-forge mintpy=VERSION
conda list | grep -i mintpy
```

Cleanup as desired

```
cd ../
ls

rm -rf conda-mintpy

conda deactivate
conda env remove -n conda-build
conda env list
```
