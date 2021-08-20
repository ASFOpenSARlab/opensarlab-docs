[Return to Table of Contents](../user.md)

# The OpenSARlab Environment and Account Lifecycle
## Account Lifecycle
- Accounts will be deactivated on the **46th** day of inactivity.
- Warning emails are sent to inactive users after **30**, **37**, **41**, **43**, and **45** days.
- The user volume and snapshot are **permanently destroyed** upon account deactivation.



## OpenSARlab Environment
Every OpenSARlab user has access to an Amazon AWS EC2 instance. Individual instances are shared among groups of 1 - 3 users, depending on demand.

### Operating System
- Ubuntu 18.04

<!--  should we include EBS snapshot -->
### Volume (storage)
OpenSARlab uses [Amazon AWS EBS volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volumes.html), which are mounted on user servers' home directories for storage. A [snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html) of each volume is taken everyday at 10:00 UTC. Only the most recent snapshot is retained. Any volumes unused for two days are destroyed, with the latest snapshot retained as a backup. 

**If a volume has been destroyed, a new EBS volume is created upon the next login, and it is populated with data from the snapshot.** While the volume is created and becomes usable very quickly, populating it with data from the snapshot can take some time (tens of minutes) and users may notice that notebooks load slowly during this period. 

The important takeaway is that user storage is persistent; you will not lose saved work unless your account is deactivated after 46 days of non-use.

It is users' responsibility to manage their storage. Using up all your storage space will prevent you from logging into OpenSARlab. Please contact an [OpenSARlab administrator](mailto:uaf-jupyterhub-asf@alaska.edu) if this occurs. 

- 500GB Amazon AWS EBS volume (volume size subject to change) allocated to each user. 

### Memory (RAM)
EC2 instances are shared among users. This happens behind the scenes and is generally not noticeable when using OpenSARlab, with the exception of memory availability. The amount of memory available to each user depends on overall use of an instance, and may vary from 6GB to 16GB.

- RAM allocated per user: 6GB - 16GB 

### Privileges
- Users do not have root privileges (*i.e.* no `sudo`).
