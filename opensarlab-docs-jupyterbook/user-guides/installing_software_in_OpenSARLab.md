# Installing Software

- [`pip`](#pip)
    - [Install `pip` package inside conda environment](#install-pip-package-inside-of-a-conda-environment)
- [`mamba`](#mamba)
    - [Install `conda` packages within a running notebook](#install-conda-packages-within-a-running-notebook)
    - [Install `conda` packages from the terminal](#install-conda-packages-from-the-terminal)
- [`apt` and `apt-get`](#apt-and-apt-get)

---

## **pip**

What is _pip_?

[_pip_](https://pip.pypa.io/en/stable/) is a package installer for Python.

You can install `pip` packages onto your account in the following manner:

**NB**: Your installed `pip` packages are in the `/home/jovyan/.local/lib/python3.x/site-packages` directory. 


1. Open a terminal and use the following command:

```bash
python -m pip install --user <package_name>
```
    
### **Install `pip` package inside of a conda environment**
1. Open a terminal and use the following commands:

```bash
conda activate <environment_name>
python -m pip install --user <package_name>
```  

--- 

## **mamba**

Users can install additional software with `mamba` in OpenScienceLab. 

**NB:** _OpenScienceLab began using `mamba` instead of `conda` to install conda packages in 2022. Since the syntax for `mamba` is identical to `conda` syntax, users who used `conda` previously should be familiar with the `mamba` workflow. Nonetheless, it is still worthwhile to reference [`conda` documentation](https://conda.io/projects/conda/en/latest/index.html) due to its similarity._

Packages installed in the [base conda environment](https://conda.io/projects/conda/en/latest/user-guide/getting-started.html#managing-envs) will not stay after the server shuts down. You will need to reinstall it during subsequent OpenScienceLab sessions. However, changes to _`non-base`_ will persist. Therefore, we recommend installing new packages in your _`non-base`_ environments rather than in the `base`.

### **Install conda packages within a running notebook**
1. Edit a notebook code cell
    - Then use the following command: `%mamba install <package_name>`
1. Run the code cell

### **Install conda packages from the terminal**
1. Open a terminal and use following command:

```bash
mamba activate <environment_name>
mamba install <package_name>
```

---

## **`apt` and `apt-get`**
At this time, users cannot install software in OpenScienceLab using `apt` or `apt-get`.
