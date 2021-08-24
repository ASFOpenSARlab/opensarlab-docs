[Return to Table of Contents](../user.md)

# Installing Software in OpenSARlab

## pip
### You can install pip packages to your `/home/jovyan/.local/lib/python3.7/site-packages` directory
1. Open a terminal and use the following command:

```bash
python -m pip install --user <package_name>
```
    
### To install a pip package inside of a conda environment
1. Open a terminal and use the following command:

```bash
    conda activate <environment_name>
    python -m pip install --user <package_name>
```  

--- 

## apt and apt-get
At this time, users cannot install software in OpenSARlab using `apt` or `apt-get`.

---

## conda
<!--  The overall sentiment of the paragraph is wrong. You can add software to the conda env that will persist. What will not persist is adding software to the system base env - which users shouldn't really care about anyway. So why even mention that?  -->

Users can install additional software with conda in OpenSARlab. 
Packages installed in the [base conda environment](https://conda.io/projects/conda/en/latest/user-guide/getting-started.html#managing-envs) will not persist after the server shuts down. They will need to be reinstalled during subsequent OpenSARlab sessions. However, changes to non-base environments will persist. Therefore, it is recommended to install new packages in your non-base environments instead of in base. 

### Install conda packages from within a notebook running in an environment
1. Edit a notebook code cell
    - Then use the following command: `%conda install <package_name>`
1. Run the code cell

### Install conda packages from the terminal
1. Open a terminal and use following command:

```bash
conda activate <environment_name>
conda install <package_name>
```