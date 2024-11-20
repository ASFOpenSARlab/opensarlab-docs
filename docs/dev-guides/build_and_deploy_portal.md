# Build and Deploy the Portal


# Enable Under Construction page

Sometimes the Portal must be taken down for updates. For instance, the EC2 the Portal runs on needs to be respawned for updates. 

To help facilitate communication with users, an Under Construction page can be enabled. All traffic to the Portal will be redirected to this page. 

1. To enable the page, log into the AWS account and go to EC2 console.

1. Go to the Portal load balancer, select the `HTTPS:443` listener, and _check_ the Default rule. 

1. In the dropdown Actions menu, select Edit Rule.

1. Set the instance target group weight to **0**. Set the lambda target group weight to **1**. 

1. At the bottom of the page Save Changes. 

1. Changes should take affect almost immediately.

To revert changes after updating, repeat the above steps except change the target group weights so that the instance gets **1** and the lambda gets **0**. 


# ----------

The following documentation is older and must be used with caution.

# Prerequsites

1. AWS SES: Store SES secrets

These secrets will be used to communicate with SES to send emails. "SMTP credentials consist of a username and a password. When you click the Create button below, SMTP credentials will be generated for you." The credentials are AWS access keys, like as used in local aws configs. They are valid for the whole region. https://us-west-2.console.aws.amazon.com/ses/home

- Create a verified email and take out of sandbox.

- Create SES serets

Go to `Account Dashboard`.
    `Create SMTP credentials`. The IAM User Name should be unique and easy to find within IAM. On user creation, SMTP credentials will be created.

- Store SES secrets

https://us-west-2.console.aws.amazon.com/secretsmanager/home

Click on `Store New Secret`
`Other type of secret`
`Plaintext`
Delete all empty json content.
Add username and password as given previously in the following format: `USERNAME PASSWORD`.
Click `Next`
Secret Name: `portal/ses-creds`
Tags: `osl-billing: osl-portal`
Click `Next`
Click `Next`
Click `Store`


1. AWS Secrets Manager: Create SSO token

This token will be used by the labs to communicate and authenticate with the portal. All labs and the portal share this token. It is imperative that this remains secret. The form of the token is very specific. Use the following process to create the token.

- Create secret

```bash
pip install cryptography
python3
```

```python3
from cryptography.fernet import Fernet

api_token = Fernet.generate_key()
api_token
```

- Add to AWS Secret Manager

https://us-west-2.console.aws.amazon.com/secretsmanager/home

Click on `Store New Secret`
`Other type of secret`
`Plaintext`
Delete all empty json content.
Add value of _api_token_
Click `Next`
Secret Name: `$CONTAINER_NAMESPACE/sso-token`
Tags: `osl-billing: osl-portal`
Click `Next`
Click `Next`
Click `Store`


1. Docker registry

For local dev development, one can use a local docker registry.
`docker run -d -p 5000:5000 --restart=always --name registry registry:2`

Otherwise, the remote docker images will be stored in AWS ECR, as setup by CloudFormation

1. Docker repo

Clone the portal code.
If production, push to CodeCommit the portal code.


# Setup

If production, upload the Cloudformation template `cf-portal-setup.yaml` and build.

Once the cloudformation is done, go to EC2 Connect, log onto the server and `cd /home/ec2-user/code`. 
Then setup prerequisites via `make setup-ec2`. 
Note that you will be warned about reformatting the DB volume. If this is the first time running (as it should be), do so.

If locally, go to the root up the docker repo.
The setup prerequisites via `make setup-ubuntu`.


# Build

`cp labs.example.yaml labs.maturity.yaml`. The name of the config doesn't matter (except it cannot be labs.run.yaml)
Update labs.maturity.yaml as needed

`make config=labs.maturity.yaml`


# Destroy

If production, clear out the registry images, delete the CloudFormation setup, delete snapshots, and delete logs. 

If locally, `make clean` and then stop the localhost registry (if being used).

# Other less used procedures

1. Logs

In production, normally the logs will show up in CloudWatch.

For both, `docker compose logs -f`.

1. Replace Portal DB from snapshot

If the Portal DB needs to be replaced by a snapshot backup, do the following.

All of these steps take place within EC2 Connect. 

Elevated permissions will be needed via `sudo` or `sudo su -`.

- Restore snapshot to volume

This procedure assumes that the usual DB volume is present and being used. We only want to update the DB file.

Within `cf-portal-setup.yaml`, the AZ of the EC2's subnet is set as us-west-2a. 

From the EC2 Connect console, select the snapshot that will be restored. Get the SNAPSHOT_ID, e.g. snap-0c0dbee2e7c9f0c12

From the EC2 Connect console, select the portal EC2. Get the EC2_INSTANCE_ID, e.g. i-0ca96843e97d9bd29

First run a dry run to make sure permissions are available.
```
aws ec2 create-volume \
    --dry-run \
    --availability-zone us-west-2a \
    --snapshot-id $SNAPSHOT_ID \
    --tag-specifications 'ResourceType=volume,Tags=[{Key=Name,Value=portal-db-backup}]'
```

Then actually run it.
```
aws ec2 create-volume \
    --availability-zone us-west-2a \
    --snapshot-id $SNAPSHOT_ID \
    --tag-specifications 'ResourceType=volume,Tags=[{Key=Name,Value=portal-db-backup}]'
```

From response output, get VOLUME_ID, e.g. vol-0a0869b5ab9f77090

- Attach volume to EC2

First run a dry run to make sure permissions are available.
```
aws ec2 attach-volume \
    --dry-run \
    --device /dev/sdm \
    --instance-id $EC2_INSTANCE_ID \
    --volume-id $VOLUME_ID
```

Then actually run it.
```
aws ec2 attach-volume \
    --device /dev/sdm \
    --instance-id $EC2_INSTANCE_ID \
    --volume-id $VOLUME_ID
```

- Mount device to filesystem

`sudo mkdir -p /tmp/portal-db-from-snapshot/`
`sudo mount /dev/sdm /tmp/portal-db-from-snapshot/`

If you get an error message something like

> /wrong fs type, bad option, bad superblock

then you cannot mount the filesystem. AWS's way of handling volumes makes things difficult. https://serverfault.com/questions/948408/mount-wrong-fs-type-bad-option-bad-superblock-on-dev-xvdf1-missing-codepage

Since we are working with a temporay mount, run the following instead:

`sudo mount -t xfs -o nouuid /dev/sdm /tmp/portal-db-from-snapshot/`.

- Check for mounted directories

`df` 

Look for something like

```
/dev/xvdj        1038336   34224   1004112   4% /srv/jupyterhub
/dev/xvdm        1038336   34224   1004112   4% /tmp/portal-db-from-snapshot
```

- Create a backup of the old DB file

`sudo cp ./srv/portal/jupyterhub/jupyterhub.sqlite ./srv/portal/jupyterhub/jupyterhub.sqlite.$(date +"%F-%H-%M-%S")`

- Copy over DB file

`sudo cp /tmp/portal-db-from-snapshot/jupyterhub.sqlite ./srv/portal/jupyterhub/jupyterhub.sqlite`

- Unmount and detach volume from EC2

`sudo umount /tmp/portal-db-from-snapshot/`
`sudo aws ec2 detach-volume --volume-id VOLUME_ID`

- Delete volume

`sudo aws ec2 delete-volume --volume-id VOLUME_ID`
