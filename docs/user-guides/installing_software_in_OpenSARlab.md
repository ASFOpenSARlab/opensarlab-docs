[Return to Table of Contents](../user.md)

# Installing Software in OpenSARlab

## pip
### You can install pip packages to your `/home/jovyan/.local/lib/python3.7/site-packages` directory
- Open a terminal and use following command:
    - `python -m pip install --user <package_name>`
    
### To install a pip package inside of a conda environment
- Open a terminal and use following command:
    -  ```
        conda activate <environment_name>
        python -m pip install --user <package_name>
       ```   

## apt and apt-get
At this time, users cannot install software in OpenSARlab using `apt` or `apt-get`.

## conda
Users can install additional software with conda in OpenSARlab, but it will not persist after the sever shuts down. It will need to be reinstalled during subsequent OpenSARlab sessions. 

### Install conda packages from within a notebook running in an environment
1. Edit a notebook code cell
    1. `%conda install <package_name>`
1. Run the code cell

### Install conda packages from the terminal
1. Open a terminal
    1. ```
       conda activate <environment_name>
       conda install <package_name>
       ```
1. `conda install <package_name>`



