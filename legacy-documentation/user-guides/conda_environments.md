[Return to Table of Contents](../user.md)

# Creating and Using Conda Environments in OpenSARLab

OpenScienceLab comes with a default `base` conda environment with a minimum amount of software installed. Users must create their own conda environments to run Jupyter Notebooks or Python scripts.

The following conda environments are by ASF to run the notebooks in our library:

- `rtc_analysis`
- `insar_analysis`
- `train`
- `hydrosar`
- `machine learning`
- `autorift`
- `nisar_se`
- `unavco`

However, these environments are not pre-built; users must create the desired conda environments. We have provided a notebook to help install conda environments located at the following path:
`/home/jovyan/conda_environments/Create_OSL_Conda_Environments.ipynb`

Here is a live demonstration on how to build the conda environment.

![Create Conda Env](../assets/create_conda_env.gif)

Your environment will be ready after running the last cell.

**NB**: It may take a while to generate your conda environment.

<!-- Users can also create their own custom conda environments in OpenSARLab and use them to run Jupyter Notebooks. Use the notebook located here to complete the process: `/home/jovyan/opensarlab_docs/OpenSARLab_supplements/Jupyter_Conda_Environments.ipynb` -->

<!-- conda env create -f environment.yml

cond create -n <env_name>  -->