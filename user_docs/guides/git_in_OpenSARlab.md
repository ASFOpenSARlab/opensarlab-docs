[![OpenSARlab Header](../assets/OSL_user_guide_header.png)](../OpenSARlab_user_guide.md)

# Git in OpenSARlab

### ASF's Jupyter Notebook Library
ASF's OpenSARlab Jupyter Notebook library lives in the 
[asf-jupyter-notebooks GitHub repository](https://github.com/asfadmin/asf-jupyter-notebooks).

A [smart git puller](https://jupyterhub.github.io/nbgitpuller/) pulls in any changes to the repo each time a user's OpenSARlab server starts up. If a user has made changes to a notebook and the same notebook has been updated by ASF in the asf-jupyter-notebooks repo, the user will end up with two copies of that notebook. The user's version of the notebook will have a timestamp appended to its name and the notebook with the original, unaltered name will contain the changes made by ASF.

Please note that we have noticed an occasional bug with the git puller. If a notebook has been updated by ASF but you do not receive an updated version after restarting your server, try deleting the notebook in question and [manually restart the server](restarting_server_and_kernel.md). 

### Using Other Git Repositories in OpenSARlab
Users can use any repo they wish in OpenSARlab. It is best to clone any additional repos alongside or above the "notebooks" directory, which is where the asf-jupyter-notebooks repo is stored. This avoids issues that will arise from nesting repositories inside each other. **Clone your repos to /home/jovyan**, which is easily done [in the terminal](OpenSARlab_terminal.md)