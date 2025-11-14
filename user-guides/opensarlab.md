# OpenSARLab
<br>

OpenSARLab is a cloud-hosted JupyterHub configured for working with SAR data. It is deployed next to NASA data in AWS region us-west-2 for low-latency access to large SAR datasets.


- [Access to OpenSARLab](#Access-to-OpenSARLab)
- [Storage Lifecycle](#Storage-Lifecycle)
- [OpenSARLab Environment](#OpenSARLab-Environment)

---

(Access-to-OpenSARLab)=
## Access to OpenSARLab

ASF provides limited access to OpenSARLab. 
- NASA-affiliates are granted access upon [request](mailto:uso@asf.alaska.edu?subject=NASA-affiliate%20OSL%20access%20request).
- All others may apply for access by completing the [OpenSARLab Access Application](https://forms.gle/LNBCwe8JohYitvfy6).

:::{dropdown} [OpenSARLab Access Application](https://forms.gle/LNBCwe8JohYitvfy6)
:::{iframe} https://forms.gle/LNBCwe8JohYitvfy6
:::

---
(Storage-Lifecycle)=
## Storage Lifecycle
- User storage will be deleted on the **30th** day of inactivity.
- Warning emails are sent to inactive users after **24**, **27**, and **29** days.
- The user volume and snapshot are **permanently destroyed** after the final day of inactivity in the lifecycle window.

*Lifecycle periods for custom labs may differ.*

---

(OpenSARLab-Environment)=
## OpenSARLab Environment

### Operating System

- Ubuntu 22.04.4 LTS

### Server Profiles
Every OpenSARLab user has access to a JupyterHub server running on an AWS EC2 instance. Users may select from two server profiles offering varying amounts of compute resources to support different workloads. 
> **m6a.large:**
> - RAM Guarantee: 5G
> - RAM limit: 8G
> - CPU limit: 2
>
> **m6a.xlarge:**
> - RAM Guarantee: 10G
> - RAM limit: 16G
> - CPU limit: 4

### Volume (storage)

- *500GB of EBS volume storage per user. 

OpenSARLab uses [Amazon AWS EBS volumes](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-volumes.html) mounted on user servers' home directories for persistent storage. 

- If a volume is full when a user shuts down their server, it will trigger an `out-of-storage exception` that will prevent users from starting a server again.
  - Please contact an [OpenScienceLab administrator](mailto:uaf-jupyterhub-asf@alaska.edu) if this occurs.

### **Privileges**
- Users do not have `root` (i.e., `sudo`) privileges.
- Users have read/write access in their local directories on their EBS volumes, but limited write access in their root directories. 

