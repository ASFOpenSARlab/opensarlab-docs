[Return to Table of Contents](../user.md)

# Restarting the OpenSARlab Server and Notebook Kernel

## Restarting the OpenSARlab Server
### Why?
---
Restarting the server triggers the `nbgitpuller` to run.

Consider a case where:

- You have deleted or altered a notebook in the ASF notebook library and want to retrieve the original. 
- You know that a notebook update was just made and you would like to immediately pull in changes from the [asf-jupyter-notebook repo](https://github.com/asfadmin/asf-jupyter-notebooks). 

A quick solution in either of those cases is to restart your server to run the `nbgitpuller`. 


*Note:* If you are comfortable with git, you could do a git pull from 
[the terminal](OpenSARlab_terminal.md) or in a notebook instead. 

### How?
---
### Click The Control Panel Button

![Click the Control Panel button](../assets/control_panel.png)

*Click the `Control Panel` button located at the top right corner of the file manager or in an open notebook*

---

### Click The Stop My Server Button

![Click the Stop My Server button](../assets/stop_my_server.png)

*Click the `Stop My Server` button that appears*

---

### Click The Start My Server Button

![Click the Start My Server button](../assets/start_my_server.png)

*Click the `Start My Server` button, which may take a few seconds to appear*

---

### Click The Launch Server Button

![Click the Launch Server button](../assets/launch_server.png)

*Click the `Launch Server` button that appears*

---

### Select a Server Option and Click Start

![Select a server option and click the start button](../assets/server_options.png)

*Select a `server option` and click the `Start` button*

---

### Wait For the Server To Start

| ![Wait for the server to start](../assets/server_status.png) | 
|:-------------:|
| *Wait for the server to start* |

### Optional: Click The Event Log Arrow For Detailed Startup Status Information

![Click the event log arrow](../assets/event_log.png)

*Click the `Event log` arrow to view logs documenting the status of the startup process*

---

## Changing a Notebook Kernel

### Why?
---
Notebooks in OpenSARlab run in a variety of [conda](https://docs.conda.io/en/latest/) environments. If a notebook is set to the kernel of the wrong environment, it may not have all the software packages it requires.

### How?
---
From the `Kernel` menu, click `Change kernel` and select the desired kernel.

![From the `Kernel` menu, click `Change kernel` and select the desired kernel](../assets/change_kernel.png)

---

## Restarting a Jupyter Notebook Kernel
### Why?
---
As you run code cells in a notebook, initialized variables and their assigned values are stored in memory. If you decide to start over and re-run a previously ran notebook without restarting the kernel, you may encounter some issues. 

The issues are caused by previously defined variables that persist in your memory. This is problematic for various reasons, such as:

<!-- html incompatibility -->
 - They use up instance's limited memory resources.
 - Increase file size of notebook.
 - Previously defined values may cause unintended results when re-runing the code.

*Example of unintended results:* Consider a notebook that builds a string, which starts empty and appends substrings systematically. When re-running this notebook, the string will no longer start empty and the resultant string will contain an unintended substring at its start.

The solution for this is to restart the kernel to clear notebook data that are stored in memory.

### How?
---
### Select `Restart`, `Restart & Clear Output`, or `Restart & Run All` From The Kernel Menu

![Select restart and clear all from the kernel menu](../assets/restart_clear_all.png)

*For most use cases, select `Restart & Clear Output`*

---

- `Restart` will restart the kernel but leave old code cell output in place.
- `Restart & Clear Output` restarts the kernel and removes old code cell output. **This is generally the preferred option.**
- `Restart & Run All` restarts the kernel and runs all the code cells. **This only works if the notebook does not require input from user.**