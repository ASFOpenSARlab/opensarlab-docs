[Return to Table of Contents](../user.md)

# Installing Software in OpenSARlab

<!--  Bullet point should match with other format. Reference best practice guide. -->
## pip
### You can install pip packages to your `/home/jovyan/.local/lib/python3.7/site-packages` directory
1. Open a terminal and use the following command:

```bash
python -m pip install --user <package_name>
```
<!-- 1. `python -m pip install --user <package_name>` -->
    
### To install a pip package inside of a conda environment
<!--  code snippet not compatible with web version -->
1. Open a terminal and use the following command:

```bash
    conda activate <environment_name>
    python -m pip install --user <package_name>
```   
<!-- 1. Open a terminal and use the following command:
    1. ```
        conda activate <environment_name>
        python -m pip install --user <package_name>
       ```    -->

## apt and apt-get
At this time, users cannot install software in OpenSARlab using `apt` or `apt-get`.

## conda
Users can install additional software with conda in OpenSARlab, but it will not persist after the sever shuts down. It will need to be reinstalled during subsequent OpenSARlab sessions. 

<!--  Consider putting bullet points instead of number -->
### Install conda packages from within a notebook running in an environment
1. Edit a notebook code cell
    - Use following command: `%conda install <package_name>`
1. Run the code cell

### Install conda packages from the terminal
1. Open a terminal and use following command:

```bash
conda activate <environment_name>
conda install <package_name>
```

<!-- 1. ```
    conda activate <environment_name>
    conda install <package_name>
    ``` -->