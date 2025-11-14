# Git

## **Prerequisite** 

---

- [Git](https://git-scm.com/about) - Version control systems that allow you to track changes to your files.
- [ASF's Jupyter Notebook](https://github.com/ASFOpenSARlab/opensarlab-notebooks) - A collection of Jupyter Notebooks used in OpenScienceLab.
- [Terminal](./opensarlab_terminal.md) - A built-in terminal within OpenScienceLab. The user should also have a basic understanding of Bash commands.

---

## **Gitpuller**

---

A [nbgitpuller](https://nbgitpuller.readthedocs.io/en/latest/) pulls any changes to the [notebook repo](https://github.com/ASFOpenSARlab/opensarlab-notebooks) each time an OpenScienceLab deployment server starts up. 

In short words, `nbgitpuller` will automatically update the notebooks to the latest version. 

If a user has made changes to a notebook and the same notebook has been updated by ASF in the `asf-jupyter-notebooks` repo, the following will occur:

Users will retain two copies of the same notebook.
- The user-edited notebook will have a timestamp appended to its name. 
- The notebook with the original name will contain the new changes made by ASF.

*Example:*    

_Before Edit_
- Original version: `sample_notebook.ipynb`

_After Edit_
- Updated by user: `sample_notebook__20210616165846.ipynb`
- Updated by ASF: `sample_notebook.ipynb`

__NB: The `nbgitpuller` will only run if you are in the `main` branch of the `asf-jupyter-notebook` repo.__

<!--  So is this saying that if one file is missing from remote then none of the files from remote will be pulled? Thus removing one remote file will sabotage the whole thing? -->

---

## **In the case of a broken Git state**

---

Due to its complexity, it is common for users to break Git workflow. A broken Git state can lead to unexpected results, such as notebooks not being updated.

Below are the steps users can take if the Git workflow is in a state beyond their ability to repair.

_Repair Process:_

1. Preserve any files/directories you wish to keep under the `/home/jovyan/notebooks` directory.
    - Either *_download_ or _move out_ items you wish to keep.
1. Delete the entire `/home/jovyan/notebooks` directory.
    - Use `rm -rf /home/jovyan/notebooks` on the terminal to delete all.
1. Restart your server.
1. Gitpuller will automatically clone a clean repository into your account.


*__NB__: When downloading a directory, users may compress them first to optimize downloading. The below commands will allow users to (de)compress files/directories:

- Compress: `zip -r <name>.zip <directory>`
- Decompress: `unzip <name>.zip`

Where `<name>` can be anything you wish.


--- 

## **Using Other Git Repos in OpenScienceLab**

---

If you wish to utilize repositories other than those hosted by ASF, you can clone them into your OpenScienceLab account. However, users will need to manage the repos that they clone to prevent any issues.

When cloning a repository from elsewhere, users must ensure not to nest git repositories, i.e., do not clone a repository within another repository.

To avoid complications, **clone your repos to `/home/jovyan`**. 
