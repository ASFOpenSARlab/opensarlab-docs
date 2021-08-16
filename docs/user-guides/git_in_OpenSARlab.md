[Return to Table of Contents](../user.md)

# Git in OpenSARlab

### ASF's Jupyter Notebook Library
ASF's OpenSARlab Jupyter Notebook library lives in the 
[asf-jupyter-notebooks GitHub repository](https://github.com/asfadmin/asf-jupyter-notebooks).

### Gitpuller

A [smart git puller](https://jupyterhub.github.io/nbgitpuller/) pulls any changes to the <!--which repo?--> repo each time a user's OpenSARlab server starts up. 

If a user has made changes to a notebook and the same notebook has been updated by ASF in the `asf-jupyter-notebooks` repo following will occur:
 * User will end up with two copies of that notebook.
 * User's version of the notebook will have a timestamp appended to its name. 
 * The notebook with the original, unaltered name will contain the new changes made by ASF.

<!-- e.g. user's version: example_file_08132021:13:25:45
          original: example_file
    note: this example may not be necessary
-->

<!-- If a user has made changes to a notebook and the same notebook has been updated by ASF in the asf-jupyter-notebooks repo, user will end up with two copies of that notebook. The user's version of the notebook will have a timestamp appended to its name. The notebook with the original, unaltered name will contain the new changes made by ASF. -->

Please note that the gitpuller will __not__ run if:

1. You are not in the master branch of the asf-jupyter-notebook repo
1. A file has been removed from the remote repo but still exists in your local repo

### What do I do if my git state is broken beyond my ability to repair it?

1. Download or move any files you wish to preserve out of the ```/home/jovyan/notebooks``` directory (or its subdirectories).
1. Delete the entire `/home/jovyan/notebooks` directory by:
    1. Opening a terminal.
    1. Use `rm -rf /home/jovyan/notebooks` to remove everything.
1. Restart your server.
1. A fresh copy of the repo will be cloned into your account.



### Using Other Git Repositories in OpenSARlab
Users can use any repo they wish in OpenSARlab. It is best to clone any additional repos alongside or above the "notebooks" directory, which is where the asf-jupyter-notebooks repo is stored. This avoids issues that will arise from nesting repositories inside each other. **Clone your repos to /home/jovyan**, which is easily done [in the terminal](OpenSARlab_terminal.md)