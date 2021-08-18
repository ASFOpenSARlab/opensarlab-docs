[Return to Table of Contents](../user.md)

# Troubleshooting Guide

## Why did the kernel die while running a notebook?
---
![A dead notebok kernel notification.](../assets/kernel_death.png)

*The message that appears when a notebook kernel dies*

---
<!-- need clearification on time-series  -->
 The kernel will die if you run out of available memory to complete a running process. This frequently occurs when running a time-series/change detection algorithm on data stack that is either too deep or covers too large of an area-of-interest (AOI) for OpenSARlab to handle.
 
Try running the notebook on some combination of a shallower data stack and/or a smaller area-of-interest (AOI). This may take some experimentation because memory is shared among users, *i.e.* amount available memory fluctuates. 

To work with a deep stack covering an extensive AOI, you may need to tile up your data for the analysis and mosaic them later. 

## I successfully ran a notebook earlier on the same data but now it is killing the kernel.
---

OpenSARlab EC2 instances are shared among 1~3 users. The memory available to each user on an instance varies with overall activity on the EC2. It is likely that there was enough memory available for your process during your first attempt, but there was not enough memory during subsequent attempt. More details on the OpenSARlab user environment can be found [here](OpenSARlab_environment.md).

## When I open a notebook, I receive "Kernel not found" message.
---
![A kernel not found notification.](../assets/kernel_not_found.png)

*The message that appears when a notebook kernel cannot be found*

---
 
You either have:
 - Not created the required conda environment yet
 - A mix-up between the environment name and prefix

 <!-- You have either not yet created the required conda environment or there is a mix-up between the environment name and prefix.  -->
 
<!--  need more description on pull-down menu -->
 If you think you already installed the environment, select it from the pull-down menu and click the `Set Kernel` button. 
 
 If you have not yet created it, use the notebook located in following directory: ```/home/jovyan/conda_environments/Create_OSL_Conda_Environments.ipynb```

## I am receiving a "No space left on device" error.
---
OpenSARlab users have access to a finite amount of storage space ([details here](OpenSARlab_environment.md)). It is up to users to manage their storage. If you receive a storage space warning while logged into OpenSARlab, it is highly recommended that you immediately free up space by deleting un-needed files. If your server shuts down while there is no available space, it will not have the space needed to restart again and you will be locked out of your account. 

If you you become locked out of your account, contact an [OpenSARlab administrator](mailto:uaf-jupyterhub-asf@alaska.edu) for help. They will assign just enough extra storage to allow you to login and delete files.

If you do not have any extraneous files to delete and feel that you really do need additional space to do your work, contact an [OpenSARlab administrator](mailto:uaf-jupyterhub-asf@alaska.edu) and request an increased storage limit. Limits will only be increased if there is a demonstrable need.


## My server won't start and I cannot access OpenSARlab.
---
This issue typically stems from unexpected behavior on the part of the [smart git puller](https://jupyterhub.github.io/nbgitpuller/).

Click the event log arrow beneath the server startup progress bar to view the details of any git puller conflicts.

![The event log can be viewed on the server startup screen.](../assets/event_log.png)

*Click the event log arrow beneath the server startup progress bar.*

---
 
 If the problem is related to the git puller, you will find details regarding which file or files are causing the conflict in the event log. If the problem is not related to the git puller, contact an [OpenSARlab Administrator](mailto:uaf-jupyterhub-asf@alaska.edu).
 
 If the problem is git puller related, note the names and locations of the offending files and logout of OpenSARlab.
 
 ![The logout button is located at the top right of the screen.](../assets/logout_server_screen.png)
 
 *Click the logout button at the top of the screen*
 
 ---
 
 After logging out, the startup screen will reload. Select the "General SAR processing (without git puller)" server option and click the start button. 
 
 ![The "General SAR processing (without git puller)" server option is below the "General SAR processing" option.](../assets/server_options_no_git_puller.png)

 *Select the "General SAR processing (without git puller)" server option and click the start button*
 
 ---
 
 The server should now load and you will have access to your account. Navigate to the locations of the conflicting files. There are three options for dealing with each of the offending files:
 
 1. Delete the file if there are no changes from the original that you wish to save. 
 1. Rename the file if there are changes you wish to save.
 1. From the [terminal](OpenSARlab_terminal.md), run "touch /path/to/your.file" if you wish to try updating the file's timestamp and give the git puller another opportunity to handle the git pull correctly.
 
 Logout of OpenSARlab.
 
 ![The logout button is located at the top right of the screen.](../assets/logout.png)

 *Click the logout button at the top right of the screen*
 
 ---
 
 Log back in, using the "General SAR processing" server option.
 
 ![The "General SAR processing" server option is the first option on the server option screen.](../assets/server_options.png)

 *Select the "General SAR processing" option and click start*
 
 ---
 
 The git puller should now run successfully, the server should startup, and you should have restored access to OpenSARlab, receiving any updates to the [ASF notebook library](https://github.com/asfadmin/asf-jupyter-notebooks).

## The edits I made to an ASF notebook have disappeared since the last time I used OpenSARlab.
---

When your OpenSARlab server starts up, a git puller runs, bringing in any updates made to the [ASF notebook library](https://github.com/asfadmin/asf-jupyter-notebooks). If a change has been made to a notebook by both the user and by ASF, both will be saved. The ASF version will retain its original name. The user edited version will have a timestamp appended to its name. The edited notebook you are missing is likely in the location where you expect it but has a recent timestamp appended to its name.  

## One of my notebooks looks like it has a mix of code from various versions of the notebook.
---

We have seen this happen occasionally and it stems from issues with the [smart git puller](https://jupyterhub.github.io/nbgitpuller/). The best option is to delete the notebook and [restart your OpenSARlab server](restarting_server_and_kernel.md). The notebook will be replaced with a fresh copy from the [ASF notebook library](https://github.com/asfadmin/asf-jupyter-notebooks).

## I know there was an update made to an ASF notebook but I still have the old version.
---

We have seen this happen occasionally and it stems from issues with the [smart git puller](https://jupyterhub.github.io/nbgitpuller/). The best option is to delete the outdated version of the notebook and [restart your OpenSARlab server](restarting_server_and_kernel.md). The notebook will be replaced with a fresh copy from the [ASF notebook library](https://github.com/asfadmin/asf-jupyter-notebooks).

## I am having trouble setting up a web server and developing my web app in OpenSARlab.
---

This cannot be done in OpenSARlab. You will need to develop your app in an environment where you can run your web server.

## A notebook won't load. A new browser tab opens and shows the JupyterHub header, but no notebook appears. 
---

This is caused by the slow loading of a large notebook. If you run a notebook and close it without first clearing all code cell output, the file size can increase substantially. A 40KB notebook can grow to 60MB+ file if its output is left in place. The notebook will eventually load. You may need to reload your browser window if it times out. 

## My issue is not on this list
---

If you have encountered an issue not covered in this document, please contact an [OpenSARlab administrator](mailto:uaf-jupyterhub-asf@alaska.edu) for help.



<!-- TODO: add documentation in regards to server timeouts -->