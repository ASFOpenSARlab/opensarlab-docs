# Installing Software in a Lab

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
At this time, users cannot install software in OpenScienceLab using `apt` or `apt-get


# Conda Environments

OpenSARLab user images include a default `base` conda environment with a minimal amount of software installed. Users may create additional conda environments on their persistent user volumes to support workflows in Jupyter Notebooks or Python scripts.

The following conda environment config files are provided by ASF:

- `ARIA-tools`
- `autorift`
- `earthscope_insar`
- `isce3_rtc`
- `machine learning`
- `rtc_analysis`
- `minimal_notebook`
- `nisar_se`

These environments are not pre-built; users must create their conda environments and register their kernels with `ipykernel` to make them accessible in notebooks. We provide a notebook to help install conda environments and register their kernels here:
[`/home/jovyan/conda_environments/Create_OSL_Conda_Environments.ipynb`](https://opensciencelab.asf.alaska.edu/lab/smce-prod-opensarlab/hub/user-redirect/lab/tree/conda_environments/Create_OSL_Conda_Environments.ipynb)

The notebook can be used to build ASF-supplied Conda environments, but it also allows you to select a custom `environment.yaml` to build user-defined environments.

Here is a live demonstration on how to build the conda environment.

![Create Conda Env](../assets/create_conda_env.gif)

Your environment will be ready after running the last cell, which may take several minutes.

***Note:*** 
- *Once an environment is created and its kernel registered, it may take an additional couple of minutes for Jupyter to recognize it and display it as an available kernel option.*
- *ASF has started migrating data recipes into Jupyter Books, which are organized collections of Jupyter Notebooks with an interactive table of contents. Each Jupyter Book includes a notebook to build any required conda environments. This can be run directly from the Jupyter Book so there is no need to build an environment using the `/home/jovyan/conda_environments/Create_OSL_Conda_Environments.ipynb` described above.*

