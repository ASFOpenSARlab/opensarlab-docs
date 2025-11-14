# Troubleshooting Guide
<br>

- [Why don't any labs appear on the OpenScienceLab home page?](#Why-dont-any-labs-appear-on-the-OpenScienceLab-home-page)
- [Why did the kernel die while running a notebook?](#Why-did-the-kernel-die-while-running-a-notebook)
- [I successfully ran a notebook earlier on the same data but now it is killing the kernel.](#I-successfully-ran-a-notebook-earlier-on-the-same-data-but-now-it-is-killing-the-kernel)
- [I receive a `Kernel not found` message when I open a notebook.](#I-receive-a-Kernel-not-found-message-when-I-open-a-notebook)
- [My notebook won't open, opens slowly, or won't save.](#My-notebook-wont-open-opens-slowly-or-wont-save)
- [I am receiving a `No space left on device` error.](#I-am-receiving-a-No-space-left-on-device-error)
- [My server won't start and I cannot access OpenScienceLab.](#My-server-wont-start-and-I-cannot-access-OpenScienceLab)
- [The edits I made to an ASF notebook have disappeared since the last time I used OpenSARlab.](#The-edits-I-made-to-an-ASF-notebook-have-disappeared-since-the-last-time-I-used-OpenSARlab)
- [One of my notebooks looks like it has a mix of code from various versions of the notebook.](#One-of-my-notebooks-looks-like-it-has-a-mix-of-code-from-various-versions-of-the-notebook)
- [I am having trouble setting up a web server and developing my web app in OpenScienceLab.](#I-am-having-trouble-setting-up-a-web-server-and-developing-my-web-app-in-OpenScienceLab)
- [A notebook won't load. A new browser tab opens and shows the JupyterHub header, but no notebook appears.](#A-notebook-wont-load-A-new-browser-tab-opens-and-shows-the-JupyterHub-header-but-no-notebook-appears)
- [My issue is not on this list](#My-issue-is-not-on-this-list)


(Why-dont-any-labs-appear-on-the-OpenScienceLab-home-page)=
## Why don't any labs appear on the OpenScienceLab home page?

You most likely have not yet configured Multi-Factor Authentication (MFA). While
any user can log in without MFA, until a user has configured their MFA device,
they will be unable to access any OpenScienceLab resources.

See [Configuring Multi-Factor Authentication](mfa.md) for more information and
a detailed walkthrough.

(Why-did-the-kernel-die-while-running-a-notebook)=
## Why did the kernel die while running a notebook?

:::{figure} ../assets/kernel_death.png

The message that appears when a notebook kernel dies
:::


- The kernel will die if you run out of available memory to complete a running process. This occurs frequently when running a time-series or change detection algorithm on data stack that is either too deep or covers too large of an area-of-interest (AOI) for OpenSARLab to handle.
 
- Try running the notebook on some combination of a shallower data stack and/or a smaller AOI. This may take some experimentation because memory is shared among users, *i.e.* amount of available memory fluctuates. 

- To work with a deep stack covering an extensive AOI, you may need to tile up your data for the analysis and mosaic them later. 

*Summary:* If you are running a resource hungry program, your kernel might die. Try subsetting your data, processing it in batches, and mosaicing your results.

--- 

(I-successfully-ran-a-notebook-earlier-on-the-same-data-but-now-it-is-killing-the-kernel)=
## I successfully ran a notebook earlier on the same data but now it is killing the kernel.

- OpenSARLab EC2 instances are shared among 1~3 users. The memory available to each user depends on overall activity on the EC2. It is likely that there was enough memory available for your process before, but not enough memory during later attempt(s). More details on the OpenSARLab user environment can be found [here](opensarlab.md).

---

(I-receive-a-Kernel-not-found-message-when-I-open-a-notebook)=
## I receive a `Kernel not found` message when I open a notebook.

:::{figure} ../assets/kernel_not_found.png

The message that appears when an expected notebook kernel cannot be found
:::

 
- You either have:
  - Not created the required conda environment yet
  - A mix-up between the environment name and prefix

- If you think you already installed the environment, select it from the pull-down menu that appears and click the `Set Kernel` button. 
 
- If you have not created the environment yet:
  -  In OpenSARLab, you can find a selection of environments and a notebook to build them here: [```/home/jovyan/conda_environments/Create_OSL_Conda_Environments.ipynb```](https://opensciencelab.asf.alaska.edu/lab/smce-prod-opensarlab/hub/user-redirect/lab/tree/conda_environments/Create_OSL_Conda_Environments.ipynb)
  -  If you are working in an ASF-supplied Jupyter Book, it should include a notebook to build the required environment/s

---

(My-notebook-wont-open-opens-slowly-or-wont-save)=
## My notebook won't open, opens slowly, or won't save.

- These are all signs that the notebook contains a lot of output and is too large to easily open or save over the internet in OpenSARLab.
    - If the notebook won't open or opens very slowly, remove its output by running the following command from a terminal:
        - `jupyter nbconvert --clear-output --inplace my_notebook.ipynb`
    - If the notebook is open and you can't save it, try clearing its output first.

:::{figure} ../assets/restart_clear_all_jlab.png

Select `Restart Kernel and Clear All Outputs` from the `Kernel` menu and try saving it again.
:::

---

(I-am-receiving-a-No-space-left-on-device-error)=
## I am receiving a `No space left on device` error.

OpenScienceLab users have access to a finite amount of storage space ([details here](opensarlab.md)). 

**It is up to users to manage their storage**. 

- If you receive a storage space warning while logged into OpenScienceLab, it is highly recommended to free up your space immediately by deleting unnecessary files. If your server shuts down without any available space, it will not have enough space on your volume to restart again and you will be locked out of your account.

- If you do get locked out from your account, contact an [OpenScienceLab administrator](mailto:uaf-jupyterhub-asf@alaska.edu) for help.

---

(My-server-wont-start-and-I-cannot-access-OpenScienceLab)=
## My server won't start and I cannot access OpenScienceLab.

This issue is typically due either to an unexpected behavior of [nbgitpuller](https://nbgitpuller.readthedocs.io/en/latest/) or to having used up all space on your storage volume.

Please contact an [OpenScienceLab Administrator](mailto:uaf-jupyterhub-asf@alaska.edu) for help.


---

(The-edits-I-made-to-an-ASF-notebook-have-disappeared-since-the-last-time-I-used-OpenSARlab)=
## The edits I made to an ASF notebook have disappeared since the last time I used OpenSARlab.

- When your OpenSARlab server starts up, `nbgitpuller` runs and pulls in any updates made to the [asf-jupyter-notebooks](https://github.com/ASFOpenSARlab/opensarlab-notebooks) and other Jupyter Book GitHub repositories provided in OpenSARLab. If a change has been made to a notebook by both the user and the author, both changes will be saved. The author's updated version will retain its original name while the user's version will have a timestamp appended to its name. 

:::{tip} Example file naming format for updated notebooks synched with `nbgitpuller`

Notebook containing new updates: `sample_notebook.ipynb`

Notebook previously edited by user, now with a timestamp appended to the name: `sample_notebook_20240616165846.ipynb`
:::


- If you think your notebook is missing, it is likely in its original location with a recent timestamp appended to its name.

---

(One-of-my-notebooks-looks-like-it-has-a-mix-of-code-from-various-versions-of-the-notebook)=
## One of my notebooks looks like it has a mix of code from various versions of the notebook.

- We have seen this happen occasionally and it is caused by [nbgitpuller](https://nbgitpuller.readthedocs.io/en/latest/). The best option is to delete the notebook and restart your OpenSARlab server. The notebook will be replaced with a fresh copy from its nbgitpuller-managed repository. 

---

(I-am-having-trouble-setting-up-a-web-server-and-developing-my-web-app-in-OpenScienceLab)=
## I am having trouble setting up a web server and developing my web app in OpenScienceLab.

- This cannot be done in OpenScienceLab. You will need to do this elsewhere.

---

(A-notebook-wont-load-A-new-browser-tab-opens-and-shows-the-JupyterHub-header-but-no-notebook-appears)=
## A notebook won't load. A new browser tab opens and shows the JupyterHub header, but no notebook appears. 

- This is due to slow loading time caused by a large notebook. 

- If you run a notebook and close it without clearing all output from the code cells, the file size will increase. This may cause it to load very slowly, depending on a user's network bandwidth.

  - *A 40KB notebook can grow to over 60MB if you don't clear its output.* 

- Try clearing the notebook's output before opening it by running the following command in the terminal:
  - `jupyter nbconvert --clear-output --inplace my_notebook.ipynb`

---

(My-issue-is-not-on-this-list)=
## My issue is not on this list

- Try asking our LLM chatbot available on the [OpenScienceLab portal page](https://opensciencelab.asf.alaska.edu/).
    - We are training it on SAR domain knowledge.
    - When questioned on a topic for which it lacks knowledge, it defaults to saying it doesn't know over generating hallucinations and providing inaccurate information
    - It is not yet available inside individual labs, only on the OpenScienceLab portal.
- If the chatbot is unable to answer to your questions, please contact an [OpenScienceLab administrator](mailto:uaf-jupyterhub-asf@alaska.edu) for help.

<!-- TODO: add documentation in regards to server timeouts -->
