[Return to Table of Contents](../user.md)

# Creating and Using Conda Environments in OpenSARlab

OpenSARlab comes with a default base conda environment with a minimum amount of software installed. Users must create their own conda environments to run Jupyter Notebooks or Python scripts.

The following 5 conda environments are provided by ASF to run the notebooks in our library:

1. rtc_analysis
1. insar_analysis
1. train
1. hydrosar
1. machine learning

However, these environments are not pre-built and must be created by each user. We have provided a notebook to help install conda environments located at the following path: `/home/jovyan/conda_environments/Create_OSL_Conda_Environments.ipynb`

Users can also create their own custom conda environments in OpenSARlab and use them to run Jupyter Notebooks. Use the notebook located here to complete the process: `home/jovyan/notebooks/OpenSARlab_supplements/Custom_Conda_Environments.ipynb`