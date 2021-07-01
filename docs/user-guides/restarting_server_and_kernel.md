[Return to Table of Contents](../user.md)

# Restarting the OpenSARlab Server and Notebook Kernel

## Restarting the OpenSARlab Server
### Why?
Restarting the server triggers the git puller to run. Perhaps you have deleted or altered a notebook in the ASF notebook library and want to retrieve the original. Maybe you know that a notebook update was just made and you would like to immediately pull in changes from the [asf-jupyter-notebook repo](https://github.com/asfadmin/asf-jupyter-notebooks). A quick solution in either of those cases is to restart your server.

Note: If you are comfortable with git, you could instead do a git pull from 
[the terminal](OpenSARlab_terminal.md) or in a notebook. 

### How?
#### Click The Control Panel Button

![Click the Control Panel button](../assets/control_panel.png)

*Click the Control Panel button at the top right of the file manager or in an open notebook*

---

#### Click The Stop My Server Button

![Click the Stop My Server button](../assets/stop_my_server.png)

*Click the Stop My Server button that appears*

---

#### Click The Start My Server Button

![Click the Start My Server button](../assets/start_my_server.png)

*Click the Start My Server button, which may take a few seconds to appear*

---

#### Click The Launch Server Button

![Click the Launch Server button](../assets/launch_server.png)

*Click the Launch Server button appears*

---

#### Select a Server Option and Click Start

![Select a server option and click the start button](../assets/server_options.png)

*Select a server option and click the start button*

---

#### Wait For the Server To Start

| ![Wait for the server to start](../assets/server_status.png) | 
|:-------------:|
| *Wait for the server to start* |

#### Optional: Click The Event Log Arrow For Detailed Startup Status Information

![Click the event log arrow](../assets/event_log.png)

*Click the event log arrow to view logs documenting the status of the startup process*

---

## Restarting a Jupyter Notebook Kernel
### Why?
As you run code cells in a notebook, initialized variables and their assigned values are stored in memory. If you decide to start over and re-run a previously run notebook, without first restarting the kernel, all of the previously defined variables and values will still persist in memory. Not only are they using up some of an instance's limited memory allotment, but previously defined values may cause unintended results when re-running the code. The solution is to restart the kernel, clearing notebook data stored in memory.

Example: Imagine a notebook that builds a string, which starts empty and then has substrings systematically appended to it. When re-running this notebook, the string will no longer start empty and the resultant string will contain an unintended substring at its start.

### How?
#### Select "Restart", "Restart & Clear Output", or "Restart & Run All" From The Kernel Menu

![Select restart and clear all from the kernel menu](../assets/restart_clear_all.png)

*For most use cases, select "Restart & Clear Output"*

---

- "Restart" will restart the kernel but leave old code cell output in place.
- "Restart & Clear Output" restarts the kernel and removes old code cell output. **This is generally the preferred option.**
- "Restart & Run All" restarts the kernel and runs all the code cells. **This only works if the notebook takes no user input.**