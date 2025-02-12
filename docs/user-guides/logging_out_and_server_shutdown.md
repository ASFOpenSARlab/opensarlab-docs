# Server Logout/Shutdown Best Practices
<br>

Please shutdown your server after each work session to help reduce cloud costs.

:::{tip} Logging out of OpenScienceLab does not shutdown your lab servers.

While it is wise to logout of your account for reasons related to security, it will not stop any lab servers you may have left running. They will continue to run in the background, accruing costs. Please shutdown all running servers before logging out. 
:::

- [Why Shut Down the Server?](#Why-Shut-Down-the-Server)
- [How to Shut Down The Server and Logout in Jupyter Lab](#How-to-Shut-Down-The-Server-and-Logout-in-Jupyter-Lab)
- [How to Log Out of OpenScienceLab](#How-to-Log-Out-of-OpenScienceLab)

---

(Why-Shut-Down-the-Server)=
## Why Shut Down the Server?

Cloud computing is expensive.

Please help us keep OpenSARLab available to as many users as possible and reduce costs for custom lab owners by shutting down servers when they are not in use.

**In some instances, you may need to leave your server running. For example, you
have a notebook performing a very time intensive analysis and wish to let it run
overnight. It is acceptable for you to keep your server running in cases like this.**


---

(How-to-Shut-Down-The-Server-and-Logout-in-Jupyter-Lab)=
## How to Shut Down The Server and Logout in Jupyter Lab

See the [Jupyter Server Documentation](jupyter_servers.md)

---

(How-to-Log-Out-of-OpenScienceLab)=
## How to Log Out of OpenScienceLab

1. Select `Hub Control Panel` from the `File` menu.
:::{figure} ../assets/jupyterhub_control_panel.png

:::

<p style="font-size: 28px; text-align: center;">
or
</p>

Click the `Shutdown and Logout Page` button at the top right of the JupyterLab desktop.
:::{figure} ../assets/shutdown_logout_button.png

:::

2. Click the `Logout` button.
:::{figure} ../assets/logout.png

:::