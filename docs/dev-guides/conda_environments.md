[Return to Developer Guide](../dev.md)

# There are a few options for creating conda environments in OpenSARlab. 
Each option come with benefits and drawbacks.

---
## Create Conda Environments, Register Their Kernels, and Run Any Setup Scripts in the Docker Image/s

### Benefits 
- Users don't have to create conda environments, which saves them time
- Users don't need to know much about conda; they can just start running notebooks

### Drawbacks
- Users cannot install additional packages into their conda environments
- Changes to environments on the docker image involve rebuilding the container and pipeline CodePipelines
- Large environments may overrun the default 20GB volume that comes with each EC2 instance (compute type: BUILD_GENERAL1_SMALL), requiring that larger, more expensive compute types be used.

---
## Create Conda Environments in the Docker Image/s. Then, in the Hook Script, Sync Them to `$Home/.local`, Register Their Kernels, and Run Any Setup Scripts

### Benefits 
- Users don't have to create conda environments, which saves them time
- Users don't need to know much about conda at all; they can just start running notebooks
- The environments are stored in `$HOME/.local`, so users have permissions to install, update, remove, and debug packages
  - Environments are synced, not copied, so changes made by users will persist across server restarts

### Drawbacks
- Increases the time it takes to start an OpenSARlab server
  - Syncing environments from the docker image to `$HOME/.local`, registering their kernels, and running any needed setup scripts all happens at server startup
- Large environments may overrun the default 20GB volume that comes with each EC2 instance (compute type: BUILD_GENERAL1_SMALL), requiring that larger, more expensive compute types be used.
  - By storing the environment on both user volumes and EC2 node volumes, you effectively double pay for that storage.

---
## Leave Conda Environment Creation up to the Users

### Benefits 
- Docker images remain small, avoiding potential storage overruns on the EC2 nodes' 20GB volumes.
- Servers start ups do not require copying syncing environments, and so require less time. 
- Users have full control over their conda environments and their changes will persist across server restarts.

### Drawbacks
- Users have to create their own conda environments
  - Note: There is an [ASF notebook repo](https://github.com/ASFOpenSARlab/opensarlab-envs) to aid users in building their own environments.