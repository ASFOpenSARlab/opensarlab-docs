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
