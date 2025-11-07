# Installing Software in a Lab

- [Conda Environments](#Conda-Environments)
    - [Use an ASF-provided notebook and `environment.yml` to create a Conda environment](#Use-an-ASF-provided-notebook-and-environment-yml-to-create-a-Conda-environment)
    - [Install Conda packages within a running notebook's environment](#Install-Conda-packages-within-a-running-notebooks-environment)
    - [Install Conda packages in an existing environment from the terminal](#Install-Conda-packages-in-an-existing-environment-from-the-terminal)
- [pip](#pip)
    - [Install `pip` packages inside of a Conda environment from the terminal](#install-pip-packages-inside-of-a-Conda-environment-from-the-terminal)
    - [Include pip packages in a Conda `environment.yml`](#Include-pip-packages-in-a-Conda-environment-yml)
- [apt and apt-get](#apt-and-apt-get)

---

(Conda-Environments)=
## Conda Environments

Users can install additional software in isolated Conda environments on their persistent storage volumes with [conda](https://conda.io/projects/conda/en/latest/index.html) or [mamba](https://github.com/mamba-org/mamba) (conda's faster reimplementation).

OpenScienceLab user images include a default `base` conda environment with a minimal amount of software installed. Users may create additional conda environments on their persistent user volumes to support workflows in Jupyter Notebooks or Python scripts.

:::{note} ASF-provided Conda Environments

The following conda environment config files are provided by ASF:

- `ARIA-tools`
- `autorift`
- `earthscope_insar`
- `isce3_rtc`
- `machine learning`
- `rtc_analysis`
- `minimal_notebook`
- `nisar_se`



These environments are not pre-built; users must create their conda environments and register their kernels with `ipykernel` to make them accessible in notebooks. We provide a notebook to help install conda environments and register their kernels. **This can be done from the terminal if you are comfortable with Conda** or you can use an ASF-provided notebook to walk through the process.
:::

(Use-an-ASF-provided-notebook-and-environment-yml-to-create-a-Conda-environment)=
### Use an ASF-provided notebook and `environment.yml` to create a Conda environment

1. Open the following notebook: [`/home/jovyan/conda_environments/Create_OSL_Conda_Environments.ipynb`](https://opensciencelab.asf.alaska.edu/lab/smce-prod-opensarlab/hub/user-redirect/lab/tree/conda_environments/Create_OSL_Conda_Environments.ipynb)
2. Run the notebook to select and build one of the available environments.
    - Alternatively, the notebook allows you to point to a custom `environment.yml` that you provide.
  
:::{note}

- Once an environment is created and its kernel is registered, it may take another couple of minutes for Jupyter to recognize it and display it as an available kernel option.
- ASF has started migrating data recipes into Jupyter Books, which are organized collections of Jupyter Notebooks with an interactive table of contents. Each Jupyter Book includes a notebook to build any required conda environments. This can be run directly from the Jupyter Book, in which case there is no need to build an environment using the `/home/jovyan/conda_environments/Create_OSL_Conda_Environments.ipynb` described above.
:::

(Install-Conda-packages-within-a-running-notebooks-environment)=
### Install Conda packages within a running notebook's environment
1. Run the following command in a code cell:
   
```bash
%mamba install -c conda-forge <package_name> --yes
```

(Install-Conda-packages-in-an-existing-environment-from-the-terminal)=
### Install Conda packages in an existing environment from the terminal
1. Open a terminal and run the following commands:

```bash
mamba activate <environment_name>
mamba install <package_name>
```

:::{warning} Avoid installing software in the `base` Conda environment

Packages installed in the [base conda environment](https://conda.io/projects/conda/en/latest/user-guide/getting-started.html#managing-envs) will not persist after an OpenScienceLab server shuts down. The `base` environment is located in a Docker container that will be replaced with a container using a freshly pulled copy of its image on server startup. 

We recommend installing Conda packages in non-base environments rather than in `base`. These environments are stored in the `~/.local/env` directory on persistent storage volumes and they will remain after the server restarts.
:::



---

(pip)=
## pip

[_pip_](https://pip.pypa.io/en/stable/) is a package installer for Python.

You can install `pip` packages onto your persistent volume in the following manner:

(install-pip-packages-inside-of-a-Conda-environment-from-the-terminal)=
### Install `pip` packages inside of a Conda environment from the terminal
1. Open a terminal and use the following commands:

```bash
conda activate <environment_name>
python -m pip install <package_name>
```

(Include-pip-packages-in-a-Conda-environment-yml)=
### Include pip packages in a Conda `environment.yml`
1. Include `pip` in the dependency list
2. Add a `pip` section to the bottom of the dependency list in an `environment.yaml`
```yaml
name: environment name
channels:
  - conda-forge
dependencies:
  - package_1
  - package_2
  - package_3
  - pip
  - pip:
    - pip_package_1
    - pip_package_2
```

:::{warning} We recommend against pip installations with the `--user` argument in OpenSARLab

This will install the package in your `/home/jovyan/.local/lib/python3.x/site-packages` directory and will supersede any installations of the same package in a Conda environment. This can cause issues and confusion when a user installs a specific required package version in a Conda environment, but a previously installed version in an unexpected location is used instead. 
:::

--- 

(apt-and-apt-get)=
## apt and apt-get

Users cannot install software in OpenScienceLab using `apt` or `apt-get`. 



