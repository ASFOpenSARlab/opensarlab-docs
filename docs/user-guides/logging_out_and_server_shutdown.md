[Return to Table of Contents](../user.md)

# Logging Out of OpenSARlab and Shutting Down the Server

<!-- definitive statement > suggestion  -->
When you are ready to stop working in OpenSARlab, it is important to shut down your server and also logout.

<!-- Should we still include potential auto shutdown? -->
## Why Shut Down the Server?
<!--prev
 If the server is inactive for an hour, it will shut down automatically, but users should not rely upon this feature.  -->

Always assume that logging out will not shut down the server on its own. While server may shut down automatically after an hour of inactivity, user should not rely on this feature. 

If there are any process running in your account, your server will be kept alive. Furthermore, we cannot always determine that there is a process running.

*Example* Consider a case where you ran some process, logged out, and decied to log back in for the first time in few days. Upon logging in, you noticed that the Jupyter Notebook from previous session is still running. This implies that your server was running for the past few days, which used up unnecessary resources.

<!-- prev
 If there are any process running in your account, they will keep your server alive, and it is not always apparent that there is a process running. If you login for the first time in a day or two and notice that a Jupyter Notebook is still running, your server ran that whole time.  -->

Do your part to reduce resource use and ease the burden on the environment by shutting down your server when you are finished working for the day. 

**In some instances, you may need to leave your server running. For instance, you have a notebook performing a very time intensive analysis and wish to let it run overnight. It is acceptable for you to keep your server running in cases like this.**

*Summary: Unless you intend to run your server for a long period of time, make sure to shut them down before your leave.* 

## How to Shut Down The Server and Logout

#### Click The Control Panel Button

![Click the Control Panel button](../assets/control_panel.png)

*Click the Control Panel button at the top right of the file manager or in an open notebook*

---

### Click The Stop My Server Button

![Click the Stop My Server button](../assets/stop_my_server.png)

*Click the Stop My Server button that appears*

---

### Click The Logout Button

![Click the Logout button](../assets/logout_2.png)

*Click the Logout button*

---


 