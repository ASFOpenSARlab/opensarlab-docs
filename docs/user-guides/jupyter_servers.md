# JupyterLab Servers
<br>

OpenSciencLabs are JupyterHubs running on Kubernetes clusters in the cloud. When a user starts a server, they are assigned a compute pod running JupyterLab on the cluster, their perisitent storage volume is mounted, and a script runs to help prepare their environment.

Depending on the lab, users typically have access to multiple server profiles, designed to suit the needs of a given workflow. Cloud computing is expensive, so it important to select a server that is powerful enough while avoiding an oversized, wasteful configuration.

:::{note} OpenSARLab offers 2 default server profiles
**m6a.large Server:**
- RAM Guarantee: 5G
- RAM limit: 8G
- CPU limit: 2

**m6a.xlarge Server:**
- RAM Guarantee: 10G
- RAM limit: 16G
- CPU limit: 4
:::

- [What happens when a server is started?](#What-happens-when-a-server-is-started)
- [How to Start and Stop a Server](#How-to-Start-and-Stop-a-Server)

---

(What-happens-when-a-server-is-started)=
## What happens when a server is started?

When a user starts a server, they are assigned a compute pod on a node in the lab's Kubernetes cluster. A Docker container runs JupyterLab on the pod and the user's volume is mounted. Next, a shell script runs making some final adjustments to the environment and updating any lab-provided Jupyter Notebook repositories with the notebook repository synching tool, `nbgitpuller`. Finally, the user accesses their server and Jupyter Lab instance via a web browser.


:::{tip} Reasons you may wish to restart a running lab server

- Your workflows require additional resources, so you shut down the current server and select a more robust server profile.
- You accidentally delete or change a notebook and wish to retrieve a fresh copy.
  - You can also run `nbgitpuller` from the terminal if you wish, but restarting the server is any easy way to pull in updates.
:::


---

(How-to-Start-and-Stop-a-Server)=
## How to Start and Stop a Server

:::{important} Please shut down you server after use 

Cloud computing is expensive. Keeping a dormant server running impacts the budget, reducing available funding for a lab and its users. Please act as a steward for you labs' resources by shutting down your servers when not in use. 
:::

### Starting a Server

1. Sign into  <a href="https://opensciencelab.asf.alaska.edu/" target="_blank">OpenScienceLab</a> and click the "Go to lab" button on the card of the lab you wish to start.
:::{figure} ../assets/opensciencelab_goto_lab.png


The OpenScienceLab Portal provides access to users' labs. In this example, there is only one lab available, but users will see lab cards for any labs to which they have access.
:::

2. Click the `Start My Server` button.
:::{figure} ../assets/start_server.png

:::

3. On the Server Options page, select the radio button of the server profile you wish to use and click the `Start` button.
:::{figure} ../assets/server_profile_select.png


:::

4. A status screen will load while your server starts.
:::{figure} ../assets/server_status.png
 
:::

5. You can click on "Event Log" to display the system logs as your server starts.
:::{figure} ../assets/event_log.png

:::

6. It may take several minutes for a server to start. When it has started, you will have access to a JupyterLab desktop.
:::{figure} ../assets/jupyter_lab.png

The JupyterLab desktop loads when your server has started. Depending on the specific lab, you may have access to varying notebook kernels and JupyterLab extensions.
:::

### Stopping a Server

1. Select `Hub Control Panel` from the `File` menu
:::{figure} ../assets/jupyterhub_control_panel.png

:::

<p style="font-size: 28px; text-align: center;">
or
</p>

Click the `Shutdown and Logout Page` button at the top right of the JupyterLab desktop
:::{figure} ../assets/shutdown_logout_button.png

:::

2. Click the `Stop My Server` Button

:::{figure} ../assets/stop_my_server.png

:::
