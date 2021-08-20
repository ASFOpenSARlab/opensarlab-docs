[Return to Table of Contents](../user.md)

# Git in OpenSARlab

### ASF's Jupyter Notebook Library
ASF's OpenSARlab Jupyter Notebook library lives in the 
[asf-jupyter-notebooks GitHub repository](https://github.com/asfadmin/asf-jupyter-notebooks).

### Gitpuller

A [nbgitpuller](https://jupyterhub.github.io/nbgitpuller/) pulls any changes to the [notebook repo](https://github.com/ASFOpenSARlab/opensarlab-notebooks) each time a user's OpenSARlab server starts up. 

If a user has made changes to a notebook and the same notebook has been updated by ASF in the `asf-jupyter-notebooks` repo, the following will occur:

- User will end up with two copies of that notebook.
- User's version of the notebook will have a timestamp appended to its name. 
- The notebook with the original, unaltered name will contain the new changes made by ASF.

*Example:*    

- Original version: `sample_notebook.ipynb`
- Updated by user: `sample_notebook__20210616165846.ipynb`
- Updated by ASF: `sample_notebook.ipynb`

__Please note that the `nbgitpuller` will not run if you are not in the master branch of the asf-jupyter-notebook repo.__

<!--  So is this saying that if one file is missing from remote then none of the files from remote will be pulled? Thus removing one remote file will sabotage the whole thing? -->

### What do I do if my git state is broken beyond my ability to repair it?

1. Download or move any files you wish to preserve out of the ```/home/jovyan/notebooks``` directory (or its subdirectories).
1. Delete the entire `/home/jovyan/notebooks` directory by:
    1. Opening a terminal.
    1. Use `rm -rf /home/jovyan/notebooks` to remove everything.
1. Restart your server.
1. A fresh copy of the repo will be cloned into your account.

### Using Other Git Repositories in OpenSARlab
Users can use any repo they wish in OpenSARlab. It is best to clone any additional repos alongside or above the `notebooks` directory, where the `asf-jupyter-notebooks` repo is also stored. This prevents issues that may arise from nesting repositories inside each other. **Clone your repos to `/home/jovyan`**, which can be done [in the terminal](OpenSARlab_terminal.md).