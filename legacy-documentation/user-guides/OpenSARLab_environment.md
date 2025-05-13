[Return to Table of Contents](../user.md)

# **The OpenScienceLab Environment and the Account Lifecycle**

## **Account Lifecycle**
- Accounts will be deactivated on the **46th** day of inactivity.
- Warning emails are sent to inactive users after **30**, **35**, **40**, **44**, and **45** days.
- The user volume and snapshot are **permanently destroyed** upon account deactivation.

**NB**: _While the above is valid for the **OpenSARLab** deployment, each deployment's lifecycle period may differ. Since the **OpenSARLab** is the most commonly used deployment, the information listed on this page will mainly focus on the **OpenSARLab** deployment._

---

## **OpenSARLab Environment**
Every OpenSARLab user has access to an Amazon AWS EC2 instance. Depending on demand, the individual user shares their resources with up to 3 users.

### **Operating System**

- Ubuntu 20.04.3 LTS

### **Volume (storage)**

- *500GB of EBS volume storage per user. 

*_Volume size subject to change_.

OpenSARLab uses [Amazon AWS EBS volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volumes.html) mounted on user servers' home directories for storage. Since volumes are costly to maintain, any inactive accounts will have their volumes destroyed and replaced with the latest [snapshot](#snapshot-backup) as a backup within a few days.

#### _**Important Notes about Volume**_

- **If your volume has been destroyed, the latest snapshot will regenerate a new EBS volume upon the next login. Upon successful login, your account should be identical from your previous session.**
- When regenerating the volume from the snapshot, it can take some time (10+ minutes) to restore all the data. Notebooks may load slower than usual during this period.
- If users occupy more space than allocated, it will trigger the `out-of-storage exception` that will prevent users from logging in.
    - It is the users' responsibility to manage their storage. Please contact an [OpenScienceLab administrator](mailto:uaf-jupyterhub-asf@alaska.edu) if you need help logging in.

### **Snapshot (Backup)**

A [snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html) is a backup copy of users' volume. The snapshot of each volume is taken every day at 10:00 UTC. Only the most recent snapshot is retained. 

**The user storage is persistent; you will only lose saved work if your account is inactive for 46 days.**

### **Memory (RAM)**

- RAM allocated per user: 6GB - 16GB 

The amount of memory available to each user depends on the overall instance and may vary from 6 GB to 16 GB. The number of users on the same instance determines the amount of usable memory.

### **Privileges**
- Users do not have `root` (i.e., `sudo`) privileges.