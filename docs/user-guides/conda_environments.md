[Return to Table of Contents](../user.md)

# Creating and Using Conda Environments in OpenSARlab

OpenSARlab comes with a default base conda environment with minimum amount of software installed. Users must create their own conda environments to run Jupyter Notebooks or Python scripts.

<!-- OpenSARlab comes with a default base conda environment in which very little software is installed. Users must create conda environments in which to run Jupyter Notebooks or Python scripts. -->

Following 5 conda environments are provided by ASF to run the notebooks in our library:

1. rtc_analysis
1. insar_analysis
1. train
1. hydrosar
1. machine learning

<!-- note: Not sure what "This is easily accomplished by running a notebook written for the purpose" is trying to impley -->
However, these environments are not pre-built and must be created by each user. This is easily accomplished by running a notebook written for the purpose. The notebook can be found in your OpenSARlab account under following path: `/home/jovyan/conda_environments/Create_OSL_Conda_Environments.ipynb`

Users can also create their own custom conda environments in OpenSARlab and use them to run Jupyter Notebooks. Use notebook under `home/jovyan/notebooks/OpenSARlab_supplements/Custom_Conda_Environments.ipynb` in your OpenSARlab account and follow the process. 
