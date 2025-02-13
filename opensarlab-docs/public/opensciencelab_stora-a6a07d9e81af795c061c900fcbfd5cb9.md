# Storage in OpenScienceLab
<br>

In OpenScienceLab, users have access to both ephemeral and persistent storage.

## Ephemeral Storage

OpenScienceLab servers run in a [Docker container](https://www.docker.com/resources/what-container/) that uses a pre-built [Docker image](https://docs.docker.com/get-started/docker-concepts/the-basics/what-is-an-image/). Each user container comes with ephemeral storage containing the user's root directory.

Much of this ephemeral storage is locked down, and users cannot write to it. 

:::{warning} 

Nothing written to directories above the user `home` directory (`/home/jovyan`) will persist across server restarts.
:::

---

## Persistent Storage

OpenScienceLab users typically have access to persistent storage in all their labs, but individual lab owners determine this.

Assuming a lab has persistent storage, it occupies the user's `home` directory (`/home/jovyan`).

:::{note} Storage in OpenSARLab

- OpenSARLab users have access to 500GB of persistent storage
- Persistent storage is permanently deleted after 30 days of inactivity. Warning emails are sent to inactive users after 29, 27, and 24 days.
:::

:::{tip} Keep track of available persistent storage space with the storage monitor
:::{figure} ../assets/storage_monitor.png

:::

