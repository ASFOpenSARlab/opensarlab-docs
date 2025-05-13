# Welcome to the June 2021 OpenSARlab Upgrade!

### Changes:
- conda environments **(BREAKING CHANGE ALERT: please read details below)**
- nbgitpuller patch
- installed jupyter-resource-usage
- profile identifier

## Conda Environments

### What is conda and what are conda environments?
[Conda](https://docs.conda.io/en/latest/) is an open-source package and environment manager. It identifies and attempts to handle dependency related issues when installing multiple software packages. Users create conda environments, in which multiple software packages may be installed. This allows a user to setup a variety of environments, each containing an assortment of software suited to a particular use-case. If a user needs to install software that would conflict with a previously installed package, they can create a new environment in which to install it and avoid the conflict. They can then switch between environments to handle various use-cases.

### How did OpenSARlab use conda previously?
OpenSARlab previously had conda installed but it was only used as a package manager. Conda was not initialized.

### What problems did this cause?
- Not initializing conda made it difficult for users to create and use conda environments effectively
- All notebooks ran in the same environment, which involved a delicate balance of software installations, making the OpenSARlab docker image very brittle
- All user accounts had every package installed regardless of individual need, making the OpenSARlab docker image unnecessarily large and slow to build
- Changes to the conda environment made by users did not persist after server shutdowns
- Packages such as ISCE, MintPY, TRAIN, and ARIA-Tools were installed in an area to which users lacked access, making updates and development of those packages difficult


### What has changed?
- All notebooks now run in one of 5 conda environments, each suited different use-cases
    - rtc_analysis
    - insar_analysis
    - machine_learning
    - hydrosar
    - Python 3 (the base conda environment containing minimal software)
- Conda environments are stored in /home/jovyan/.local/envs
    - this location is on the user volume, so changes persist after server restarts
- New OpenSARlab users are prompted to select the environments they would like pre-built for them when signing up for an account
    - unselected environments may always be added later
- Current users must build their own environments using the provided [notebook](https://github.com/ASFOpenSARlab/opensarlab-envs/blob/main/Create_OSL_Conda_Environments.ipynb) and accompanying environment.yml files
- Python kernels from the appropriate environments have been pre-selected for all notebooks and saved in their metadata
    - if the needed environment doesn't yet exist, users will be prompted to change the kernel to one that does
    - Note that an incorrect environment will likely be missing needed software and be incapable of running a notebook for which it was not intended
        - Instead, create the needed environment using this [notebook](https://github.com/ASFOpenSARlab/opensarlab-envs/blob/main/Create_OSL_Conda_Environments.ipynb)
- Code has been added to each notebook to check that it is running in the correct environment
    - Warnings explain how to change to the correct environment if it has been created but the notebook isn't using it
    - Warnings direct users to a [notebook](https://github.com/ASFOpenSARlab/opensarlab-envs/blob/main/Create_OSL_Conda_Environments.ipynb) to create the environment if it does not yet exist
- There is also a minimal environment called "scratch" that is intended for user adaptation and experimentation
    - This has been added for quick and easy access but users may add as many custom environments as they like
    

### What will happen if I don't create any new environments?
You will encounter environment warnings in the notebooks. You will not have access to the software needed to run the notebooks, which will trigger errors (ModuleNotFoundError).

### I don't want to wait for the notebooks to yell at me and give me environment warnings. How can I create the environments I'd like right now?
Good choice! Head over to [Create_OSL_Conda_Environments.ipynb](https://github.com/ASFOpenSARlab/opensarlab-envs/blob/main/Create_OSL_Conda_Environments.ipynb) and run the notebook. You will be prompted to select an environment from a list of options. Rerun the notebook for every environment you wish to add.

## nbgitpuller Patch

### What is nbgitpuller?

[nbgitpuller](https://github.com/jupyterhub/nbgitpuller) performs automatic merging of git repositories in a class-like setting. It handles merging in situations where instructor provided files may be edited both by students and/or the instructor. Its goal is to pull in an instructor's changes while preserving any edits a student has made. Where a conflict exists, it saves the student altered file with a timestamp appended to the filename and pulls in the instructor update.

### What was wrong with nbgitpuller?
nbgitpuller did not successfully handle all scenarios encountered in OpenSARlab. When it failed, users were locked out of their accounts. They had to login using a purpose-built profile that would skip the nbgitpuller. They could then identify and manually rectify the git state that caused the nbgitpuller to fail.

### How was this issue addressed?
We have populated user accounts with an altered version of nbgitpuller/pull.py
 - The nbgitpuller will no longer attempt to checkout files that have been removed from a remote branch
 - If the user has changed to a branch other than main in the [opensarlab-notebooks](https://github.com/ASFOpenSARlab) git repository, the merge will be aborted
 - Users can still merge other branches from the command line
 
## Installed jupyter-resource-usage

### What is jupyter-resource-usage?
[jupyter-resource-usage](https://github.com/jupyter-server/jupyter-resource-usage) is an extension that displays how much memory a notebook server is using. The information is displayed at the top-right of every running Jupyter Notebook. It indicates the total memory used by all running notebooks, kernels, terminals, etc.

## Added profile identifier

The name of the current profile now appears to the left of the "Logout" button on the home page.