[![OpenSARlab Header](../assets/OSL_user_guide_header.png)](../OpenSARlab_user_guide.md)

[Return to Table of Contents](OpenSARlab_user_guide.md)

# Creating and Using Conda Environments in OpenSARlab

Users can create and use conda environments in OpenSARlab, but they will not persist after the sever shuts down. They will need to be recreated during subsequent OpenSARlab sessions.



## Creating a New Conda Environment

### Create a conda environment with a package argument list

**From the terminal**
- conda create -n environment_name -c channel_name python=version_number package_1 package_2 ... package_n

**From within a notebook**
- %conda create -n environment_name -c channel_name python=version_number package_1 package_2 ... package_n --yes

### Create a conda environment with an environment.yml

**From the terminal**

- conda env create -f path/to/environment.yml

**From within a notebook**

- %conda env create -f path/to/environment.yml

## Run a Python Script in a Conda Environment

**From the Terminal**
1. conda init bash
1. exec bash
1. conda activate environment_name
1. Call a python script or code in a Python interpreter

**From within a notebook**

*In Python 2*
- %conda run -n environment_name python2 path/to/script.py

*In Python 3*
- %conda run -n environment_name python3 path/to/script.py


