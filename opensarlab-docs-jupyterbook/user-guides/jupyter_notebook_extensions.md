# Managing Jupyter Lab Extensions
As an OpenSARLab Jupyter Lab user, you have limited access to third-party extensions.

- Server extensions must be installed in the OpenSARLab Docker container and cannot be installed by users.
- Lab extensions can be installed, enabled, and disabled from the terminal but they will not persist across server restarts and will need to be reinstalled. 
- If you feel that OpenSARLab is lacking an important Jupyter Lab extension, please contact us to request it at <uaf-jupyterhub-asf@alaska.edu>

---

# Managing Jupyter Notebook Extensions
As an OpenSARLab Jupyter Notebook user, you have access to all of the notebook extensions available in the `nbextensions` package. A detailed list of extensions is available [here](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions.html).

## Enabling and Disabling Extensions

- The easiest way to manage notebook extensions is via the `nbextensions` tab.

![Selecting the nbextensions tab.](../assets/nbextensions.png)

*Click the `nbextensions` tab from the file manager*

- Once the `nbextensions` tab is open, you can select individual extensions to learn how they function. You can also choose to enable or disable each extension.

![Selecting an extension and enabling it.](../assets/manage_extensions.png)

*Select an extension to learn more about them and click the "Enable" or "Disable" buttons to manage its use*
