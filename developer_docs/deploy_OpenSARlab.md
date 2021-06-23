
Deploying OpenSARlab to an AWS account
=====================

1. [Take AWS SES out of sandbox](#Take AWS SES out of sandbox)
1. [Create an AWS Cost Allocation Tag](#Create an AWS Cost Allocation Tag)
1. [Add dockerhub credentials to AWS Secrets Manager](#Add dockerhub credentials to AWS Secrets Manager)
1. [Setup an iCal calendar for notifications](#Setup an iCal calendar for notifications)
1. [Store your CA certificate](#Store your CA certificate)
1. [Prepare CodeCommit Repos](#Prepre CodeCommit repos)
1. [Create an S3 bucket to hold the lambda handler script](#Create an S3 bucket to hold the lambda handler script)
1. [Customize opensarlab_container code for deployment](#Customize opensarlab_container code for deployment)
1. [Customize opensarlab_cluster code for deployment](#Customize opensarlab_cluster code for deployment)
1. [Build the Cognito CloudFormation stack](#Build the Cognito CloudFormation stack)
1. [Build the container CloudFormation stack](#Build the container CloudFormation stack)
1. [Build the cluster CloudFormation stack](#Build the cluster CloudFormation stack)
1. [Take care of odds and ends](#Take care of odds and ends)
1. [Destroy Deployments](#Destroy Deployments)

**A note about deployments:** A deployment of OpenSARlab refers to a standalone instance of OpenSARlab.
If you are setting up OpenSARlab for several classes and/or collaborative groups with disparate needs or funding sources,
it may be useful to give them each their own standalone deployment. This separates user group authentication, 
simplifies billing for each group, and allows for easy cleanup at the end of a project or class (just delete the deployment).
In the following instructions, replace any occurrence of "<deployment_name>" with the deployment name you have chosen.

**Make your deployment name lowercase and use no special characters other than dashes (-). It will be used to
generate part of the Cognito callback URL**    

Take AWS SES out of sandbox
--------------------

**The AWS Simple Email Service is used by OpenSARlab to send emails to users and administrators. These include
authentication related notifications and storage lifecycle management messages.**

While SES is in sandbox, you are limited to sending 1 email per second with no more than 200 in a 24 hour period, and they
may only be sent from an SES verified address to other SES verified addresses.

Note: Provide a detailed explanation of your SES use and email policies when applying to exit the sandbox or you will be denied.

**Approval can take 24-48 hours** 

1. Follow these [instructions](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/request-production-access.html) to 
take your SES out of sandbox.


Create an AWS Cost Allocation Tag
--------------------
**Note: only management accounts can create cost allocation tags**

1. Create a cost allocation tag or have one created by someone with access
    1. Give it an available name that makes sense for tracking deployment names associated with AWS resources
        1. i.e. "deployment_name"
        
Add dockerhub credentials to AWS Secrets Manager    
--------------------        
**This deployment uses a few publicly available docker images. Due to dockerhub rate limits ([https://www.docker.com/increase-rate-limits](https://www.docker.com/increase-rate-limits)), 
you will need to set up a dockerhub account. A free-tier account will suffice. CodePipeline's ip address is shared by many
users and you will likely hit the rate limit as an anonymous user 
([details here](https://aws.amazon.com/blogs/containers/advice-for-customers-dealing-with-docker-hub-rate-limits-and-a-coming-soon-announcement/)).**

Note: By default this secret will be used for multiple deployments. Optionally, you could edit the codebuild section in the cf-cluster.yml to 
point to a different secret.

1. If you don't have a dockerhub account, create one [here](https://hub.docker.com/signup)
1. Open the AWS Secrets Manager console
1. Click the "Store a new secret" button
    1. Page 1:
        1. Select "Other type of secrets"
        1. Select the "Plaintext" tab
        1. Delete the default content
        1. Add your username and password, separated by a space
            1. Example: `username password`
        1. Click the "Next" button
    1. Page 2:
        1. Secret name
            1. `dockerhub/creds`
            1. Click the "Next" button
    1. Page 3:
        1. Click the "Next" button
    1. Page 4:
        1. Click the "Store" button
        
Setup an iCal calendar for notifications
--------------------
**Notifications are generated from iCal calendar events. ASF uses Google Calendar but any publicly accessible iCal 
formatted calendar should work as well**

1. Create a public iCal formatted calendar
1. The iCal formatted url will be needed in later
1. Notification calendar events must be properly formatted.
    1. Formatting details available [here](TODO)

Store your CA certificate
--------------------
**OpenSARlab will lack full functionality if not using https (SSL certification)**

1. Follow these [instructions](https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html) to import your CA certificate into the AWS Certificate Manager

Prepare CodeCommit Repos
--------------------
TODO Do this differently 

**All the public OpenSARlab repos are in the [ASFOpenSARlab](https://github.com/ASFOpenSARlab) Github Org**

1. Create a <deployment_name>-container CodeCommit repo in your AWS account
1. Create a <deployment_name>-cluster CodeCommit repo
1. Clone the <deployment_name>-container and <deployment_name>-cluster repos to your local computer using ssh
1. cd into your local <deployment_name>-container repo
    1. add ASFOpenSARlab/opensarlab-container as a remote on your local <deployment_name>-container repo
        1. `git remote add github https://github.com/ASFOpenSARlab/opensarlab-container.git`
    1. Pull the remote  opensarlab-container repo into your local <deployment_name>-container repo
        1. `git pull github main`
    1. Create a main branch in the <deployment_name>-container repo
        1. `git checkout -b main`
    1. Push to the remote <deployment_name>-container repo
        1. `git push origin main`
1. cd into your local <deployment_name>-cluster repo
    1. add ASFOpenSARlab/opensarlab-cluster as a remote on your local <deployment_name>-cluster repo
        1. `git remote add github https://github.com/ASFOpenSARlab/opensarlab-cluster.git`
    1. Pull the remote  opensarlab-cluster repo into your local <deployment_name>-cluster repo
        1. `git pull github main`
    1. Create a main branch in the <deployment_name>-cluster repo
        1. `git checkout -b main`
    1. Push to the remote <deployment_name>-cluster repo
        1. `git push origin main`
        
**You should now have container and cluster repos in CodeCommit that are duplicates of those found in ASFOpenSARlab** 

Create an S3 bucket to hold the lambda handler script
--------------------

1. Create an S3 bucket in your AWS account called <deployment_name>-lambda
    1. Alternatively, you could use the same bucket to hold lambdas for multiple deployments

Customize opensarlab_container code for deployment
--------------------
**The opensarlab-container repo contains one example image named "sar", which you can reference when creating new images.
Images can be used by multiple profiles**

Note: It is easiest to work in your local repo and push your changes when you're done.

1. Duplicate the images/sar directory and rename it, using your chosen image name
1. Create and add any additional custom jupyter magic commands to the jupyter-hooks/custom_magics directory
1. Add any additional scripts you may have created for use in your image to the scripts directory
1. Add any image test scripts to tests directory
1. rename images/sar to images/<new_image_name> or create a new renamed duplicate of that directory
    1. Edit images/<new_image_name>/jupyter-hooks/sar.sh
        1. Rename sar.sh to <new_image_name>.sh
        1. Copy any additional custom Jupyter magic scripts to $HOME/.ipython/image_default/startup/ (alongside 00-df.py)
        1. Edit the repos being pulled to suit your deployment and image needs
    1. Edit images/<new_image_name>/build.sh
        1. Change 6 $DOCKER_REGISTRY namespaces from "sar" to your image namespace
1. Repeat the previous step, adding scripts for any additional images
1. Edit cf-container.yaml
    1. SARRepository 
        1. Change the resource name (SARRepository) so it makes sense given the image that will use it
        1. Change the "/sar" portion of RepositoryName to use a namespace matching your image name
    1. Pipeline
        1. - Name: !Sub ${AWS::StackName}-Build-Images
            1. Change "- Name: images-sar" to "- Name: images-<image_namespace>"
            1. EnvironmentVariables
                1. Change the IMAGE_NAME value from "sar" to "<image_namespace">
        1. Add stages for any additional images
1. Edit 
1. Edit dockerfile
    1. Adjust the packages in the 2nd apt install command to suit your image needs
    1. Add any pip packages you wish installed in the base conda environment
    1. Add any conda packages you wish installed in the base conda environment
    1. Create any conda environments you would like pre-installed before "USER jovyan"
        1. If using environment.yml files, store them in an "envs" directory in <image_name>/jupyter-hooks, and they will be copied into the container
            1. RUN conda env create -f /etc/jupyter-hooks/envs/<environment_name>_env.yml --prefix /etc/jupyter-hooks/envs/<environment_name>
    1. Run any tests for this image that you added to the tests directory
1. Remove the images/sar directory and sar.sh test script, unless you plan to use the sar image
1. Add a test script for your image
    1. use sar,sh as an example
    1. name it <image_namespace>.sh
1. Edit tests/finale.sh
    1. Delete "bash sar.sh" if not using it
    1. Add  "bash <image_namespace>.sh"
1. Add, commit, and push changes to the remote CodeCommit repo

Customize opensarlab_cluster code for deployment
--------------------
**The opensarlab-cluster repo contains TODO comments everywhere deployment specific edits should be made**

Note: Most IDEs have functionality to easily locate and organize TODOs. Searching the code for "TODO" will also work.

1. hub/dockerfile
    1. Add your organization's name as MAINTAINER
    1. Adjust the images (jpgs, pngs, etc...) and templates being copied to the docker image
1. hub/etc/jupyterhub/custom/delete_snapshot.py
    1. Edit admin email addresses (2 locations)
1. hub/usr/local/share/jupyterhub/templates/login.html
    1. Edit the images and messages that appear on the login page
1. hub/usr/local/share/jupyterhub/templates/pending.html
    1. Edit the message to users that their account is pending approval
1. notifications/dock
    1. Add the ICAL_URL of your notification calendar
1. notifications/dockerfile
    1. Add your organization's name as MAINTAINER
1. cloudformation.yaml
    1. Add a NodeInstanceType parameter for every EC2 type
        1. must be alphanumeric
    1. Remove the example NodeInstanceTypePROFILE1 resource
    1. Add a LaunchConfiguration for every NodeInstanceType
        1. must be alphanumeric
        1. InstanceType should match the NodeInstanceType created above
        1. The server_type in UserData must match profile's server_type that you will use in helm_config.yaml
    1. Add an AutoScalingGroup resource for every NodeInstanceType
        1. must be alphanumeric
        1. LaunchConfigurationName should match new LaunchConfiguration created above
    1. Remove the example AutoScalingGroupPROFILE1 resource
    1. Remove the example LaunchConfigurationPROFILE1 resource
1. helm_config.yaml
    1. Add new profiles, using the example PROFILE_1 as a template
        1. Reference the [kubespawner docs](https://jupyterhub-kubespawner.readthedocs.io/en/latest/spawner.html) for more options and details
        1. Change the name of the profile being search for in group_list
        1. Change the display_name
        1. Change the profile description
        1. Change the extra_labels and node_selector server_types to match the server_type used in the profiles LaunchConfiguration in cloudformation.yaml
        1. Adjust the path to the postStart lifecycle hook
        1. Adjust the kubespawner_override args --NotebookApp.jinja_template_vars PROFILE_NAME to the correct profile name
        1. Adjust the mem_limit
            1. The maximum amount of memory available to each user
            1. <= memory available for EC2 type
        1. Adjust the mem_guarantee (or cpu_guarantee)
            1. The minimum amount of memory guaranteed to each user
            1. If there is not enough memory on any existing node, the autoscaler will spin up a new node
            1. Use the mem_guarantee to determine how nodes should be shared among users
            1. Even if not sharing nodes, do not guarantee all available memory
                1. The node requires some memory for setup (varies and may take some trial and error to figure out how much to reserve)
        1. Adjust the cpu_guarantee (or mem_guarantee)
            1. The minimum EC2 cpu units guaranteed to each user
            1. If there aren't enough cpu units left on a node for the next user, the autoscaler will spin up a new node
            1. Use the cpu_guarantee to determine how nodes should be shared among users
            1. Even if not sharing nodes, do not guarantee all available cpus
                1. The node requires some memory for setup
        1. Adjust the storage capacity
            1. This should match the storage capacity used for all profiles
            1. You can increase volume sizes at a later date
            1. Reducing volume sizes is not advised due to a high likelihood of data loss
    1. Remove the example PROFILE_1
1. lambda_handler.py
    1. Lambdas are used by Cognito event triggers for logging and emailing notifications to users and administrators
    1. Create a lambda_handler.py file based on lambda_handler.py.example
    1. Adjust email messages to suit the needs of the deployment
    1. zip the file, creating lambda_handler.py.zip
        1. be sure to keep the ".py" as part of the filename
    1. Upload the zip to the <deployment_name>-lambda S3 bucket
        1. After setting up Cognito for the first time, anytime you make changes to this file you will need to:
            1. Change the name of the zip file
                1. **Do not change the name of the lambda_handler.py file it contains**
            1. Upload it to the lambda S3 bucket
            1. Update the EmailLambdaKeyName parameter in the cognito CloudFormation template to match the new filename
            1. After updating the pipeline, set all Cognito triggers to 'None', save them, set them back to the correct lambdas, and save them again
1. Add, commit, and push changes to the remote CodeCommit repo

Build the Cognito CloudFormation stack
--------------------

1. Open CloudFormation in the AWS console
    1. Click the "Create stack" button and select "With new resources (standard)"
        1. Page 1 : **Create stack**
            1. Under "Specify template", check "Upload a template file"
            1. Use the file chooser to select **cf-cognito.py** from your local branch of the <deployment_name>-cluster repo 
            1. Click the "Next" button
        1. Page 2: **Specify stack details**
            1. Stack name:
                1. <deployment_name>-auth
                    1. dashes (-) are the only allowed special characters
                    1. lowercase only
            1. AdminEmailAddress:
                1. SES verified email address of the primary administrator
                    1. This is the sender address users will see on confirmation, verification, and volume lifecycle emails
            1. AdminEmailSNSArn:
                1. Arn of the above admin email address
                    1. Must be AWS SES verified (easy to do in the Amazon Simple Email Service console)
            1. DeploymentURL
                1. Enter the deployment domain, if known (i.e. https://deployment_name.your_domain.tdl)
                    1. The placeholder domain can be left in place temporarily if the actual domain is not yet known
            1. CostTagValue
                1. <deployment_name>
            1. EmailLambdaBucketName
                1. <deployment_name>-lambda
            1. EmailLambdaKeyName
                1. lambda_handler.py.zip (or whatever you named it)
            1. Click the "Next" button
        1. Page 3: **Configure stack options**
            1. Tags:
                1. Key: 
                    1. Cost allocation tag
                1. Value:
                    1. <deployment_name>
            1. Click the "Next" button
        1. Page 4: **Review <deployment_name>-auth**
            1. Review and confirm correctness
            1. Check the box next to "I acknowledge that AWS CloudFormation might create IAM resources"
            1. Click the "Create Stack Button"
1. Monitor the stack build for errors and rollbacks
    1. The screen does not self-update
        1. Use the refresh buttons
    1. If the build fails and rolls back
        1. goto the CloudFormation stacks page 
            1. select and delete the failed stack before correcting any errors and trying again
       

Build the container CloudFormation stack
--------------------
**This will create the hub image, images for each profile, and store them in namespaced ECR repos**

1. Open CloudFormation in the AWS console
    1. Click the "Create stack" button and select "With new resources (standard)"
        1. Page 1 : **Create stack**
            1. Under "Specify template", check "Upload a template file"
            1. Use the file chooser to select **cf-container.py** from your local branch of the <deployment_name>-container repo 
            1. Click the "Next" button
        1. Page 2: **Specify stack details**
            1. Stack name:
                1. <deployment_name>-container
            1. CodeCommitSourceBranch:
                1. The name of the production branch of the <deployment_name>-container CodeCommit repo
            1. CodeCommitSourceRepo:
                1. <deployment_name>-container
            1. CostTagValue
                1. <deployment_name>
        1. Page 3: **Configure stack options**
            1. Tags:
                1. Key: Cost allocation tag
                1. Value: <deployment_name>
            1. Click the "Next" button
        1. Page 4: **Review <deployment_name>-auth**
            1. Review and confirm correctness
            1. Check the box next to "I acknowledge that AWS CloudFormation might create IAM resources"
            1. Click the "Create Stack Button"
    1. Monitor the stack build for errors and rollbacks
        1. The screen does not self-update
            1. Use the refresh buttons
        1. If the build fails and rolls back
            1. goto the CloudFormation stacks page 
                1. select and delete the failed stack before correcting any errors and trying again
    1. When stack creation is complete, open CodePipeline in the AWS console
        1. Open the <deployment_name>-container-Container-Pipeline pipeline and monitor it as it runs
            1. Click the "details" link under each stage action for a closer inspection
            1. If part of the pipeline fails
                1. Identify the issue from the "details" output
                1. Correct the code
                1. Update the <deployment_name>-container repo
                1. Go to the pipeline
                    1. Click the "Release change" button
                
       


Build the cluster CloudFormation stack
--------------------
**This CloudFormation stack dynamically creates a second CloudFormation stack. You will end up with a <deployment_name> stack and
 a <deployment_name>-cluster stack.**

1. Open CloudFormation in the AWS console
    1. Page 1 : **Create stack**
        1. Click the "Create stack" button and select "With new resources (standard)"
        1. Under "Specify template", check "Upload a template file"
        1. Use the file chooser to select **cf-pipeline.py** from your local branch of the <deployment_name> repo 
        1. Click the "Next" button
    1. Page 2: **Specify stack details**
        1. Stack name:
            1. <deployment_name>-cluster
        1. AdminUserName:
            1. JupyterHub Admin username
                1. Initial default admin with access to the JupyterHub admin and group pages
        1. CertificateArn:
            1. Arn associated with the CA certificate you stored in AWS Certificate Manager
                1. arn:aws:acm:<region>:<account_#>:certificate/<certificate_id>
        1. CodeCommitRepoName:
            1. Name of the CodeCommit repo holding your <deployment_name>-cluster code
        1. CodeCommitBranchName:
            1. Name of the branch holding this deployment's cluster code
        1. ContainerNamespace:
            1. <deployment_name>-container
        1. CostTagKey:
            1. Cost allocation tag
        1. CostTagValue:
            1. <deployment_name>
        1. ICALUrl:
            1. The iCal formatted URL of the calendar used for notifications
        1. DeploymentURL:
            1. Your custom URL (should match DeploymentURL parameter in <deployment_name>-auth stack)
                1. If left blank, the default load balancer will be used
                1. Can be updated later           
        1. OAuthPoolName:
            1. <deployment_name>-auth 
    1. Page 3: **Configure stack options**
        1. Tags:
            1. Key: Cost allocation tag
            1. Value: <deployment_name>
        1. Click the "Next" button
    1. Page 4: **Review <deployment_name>-auth**
        1. Review and confirm correctness
        1. Check the box next to "I acknowledge that AWS CloudFormation might create IAM resources"
        1. Click the "Create Stack" button
1. Open CodePipeline in the AWS console
    1. Open the <deployment_name>-Pipeline pipeline and monitor it as it runs
        1. Click the "details" link under each stage action for a closer inspection

Take care of odds and ends
--------------------

1. Update the DeploymentURL parameters in 2 CloudFormation stacks with load balancer URL or your custom URL
    1. If you already entered a custom URL when building the stacks, skip this step
    1. If using the load balancer URL
        1. Find it in the 'Outputs' tab of the CloudFormation console for the <deployment_name>-cluster CloudFormation stack
        1. Note: you will have to prepend "https://" to it
    1. Update the <deployment_name> stack
        1. Navigate to the <deployment_name> stack CloudFormation console
        1. Click the 'Update' button
            1. Page 1:
                1. Leave 'Use current template' selected
                1. Click the 'Next' button
            1. Page 2:
                1. Update the DeploymentURL parameter
                1. Click the 'Next' button
            1. Page 3:
                1. Click the 'Next' button
            1. Page 4:
                1. Review and confirm correctness
                1. Check the box next to "I acknowledge that AWS CloudFormation might create IAM resources"
                1. Click the "Update Stack" button 
        1. Repeat the above process for the <deployment_name>-auth stack
1. Add the cost allocation tag to the EKS cluster
    1. Navigate to the AWS EKS console
    1. click the "Clusters" link in the sidebar menu
        1. Click on <deployment_name>-cluster
            1. Click the "Tags" tab
                1. Click the "Manage tags" button
                    1. Click the "Add tag" button
                        1. Key: Cost allocation tag
                        1. Value: <deployment_name>
1. Wrap things up in Cognito
    1. Navigate to the AWS Cognito console
    1. Click the "Manage User Pools" button
        1. Click the "<deployment_name>-auth" user pool button
        1. Add the cost allocation tag to the Cognito user pool
            1. Click the "Tags" sidebar menu link
                1. Click the "Add tag" link
                1. Tag Key:
                    1. Cost allocation tag
                1. Tag Value:
                    1. <deployment_name>
                1. Click the "Save changes" button
        1. Reset triggers
            1. Cognito triggers can fall out of sync with email and logging lambdas so it is safest to reset them
            1. Click the "Triggers" sidebar menu link
                1. Set all lambda functions to "none"
                1. Click the "Save changes" button
                1. Click the "Triggers" sidebar menu link
                    1. Pre sign-up:
                        1. select the <deployment_name>-auth-LogFunction-<random hash> lambda
                    1. Pre authentication:
                        1. select the <deployment_name>-auth-PreAuthFunction-<random hash> lambda
                    1. Post authentication:
                        1. select the <deployment_name>-auth-LogFunction-<random hash> lambda
                    1. Post confirmation:
                        1. select the <deployment_name>-auth-PostEmailVerificationFun-<random hash> lambda
                    1. Pre Token Generator:
                        1. select the <deployment_name>-auth-LogFunction-<random hash> lambda
                    1. Leave the remaining triggers set to "none"
                    1. Click the "Save changes" button
1. Update image tags for every profile in helm_config.yml (<deployment_name>-cluster repository)
    1. hub:image:tag
        1. 'latest' will only work for the hub:image:tag on the first build
            1. It is safest to never use the "latest" tag
        1. Use the image's ECR timestamp
            1. Found in the AWS Elastic Container Service console
    1. profile image_url tag
        1. update the tag at the end of the ECR image_url
        1. Use the image's 7 character long ECR tag
            1. Found in the AWS Elastic Container Service console
    1. Repeat previous step for each profile
    1. Add, commit, and push changes to CodeCommit
    1. Navigate to the AWS CodePipeline console
        1. Click the <deployment_name>-Pipeline pipeline
            1. Click the "Release change" button
                1. Click the "Release" button
                1. Monitor the pipeline as it builds
1. Prime the Auto Scaling Group for each profile
    1. Navigate to the AWS EC2 console
        1. Select the "Auto Scaling Groups" sidebar link
            1. Select <deployment_name>-cluster-AutoScalingGroup<profile_name>-<random_hash>
                1. Group details:
                    1. Click the "Edit" button
                        1. Desired capacity:
                            1. Set to 1
                        1. Click the "Update" button
1. Create a test notification
    1. Navigate to your notification calendar
    1. Create an event
        1. Set the event to last as long as you wish the notification to display
        1. The event title will appear as the notification title
        1. The description includes a metadata and message section
            1. Example:
                1. ```
                      <meta>
                      profile: MY PROFILE, OTHER PROFILE
                      type: info

                      <message>
                      This is a notification
            1. \<meta\>
                1. profile:
                    1. Holds the name or names (comma separated) of the profiles where the notification will be displayed
                1. type:
                    1. info
                        1. blue notification
                    1. success
                        1. green notification
                    1. warning
                        1. yellow notification
                    1. error
                        1. red notification
            1. \<message\>
                1. Your notification message
1. Sign up with your admin account, sign in,  and add groups for each profile and sudo
    1. Open the DeploymentURL in a web browser
        1. Click the "Sign in" button
            1. Click the "Sign up" link
            1. Username:
                1. The name used for the AdminUserName parameter of the <deployment_name> CloudFormation stack
            1. Name:
                1. Your name
            1. Email:
                1. Enter the email address used for the AdminEmailAddress parameter in the <deployment_name>-auth CloudFormation stack
            1. Password:
                1. A password
            1. Click the "Sign up" button
                1. Verification Code:
                    1. The verification code sent to your email address
                1. Click the "Confirm Account" button
    1. Add a group for each profile and for sudo
        1. After confirming your account you should be redirected to the Server Options page
        1. Click the "Groups" link at the top of the screen
        1. Click the "Add New Group" button
            1. Group Name:
                1. The group name as it appears in the helm_config.yaml group_list
                    1. Note that this is not the display name and it contains underscores
            1. Group Description:
                1. (optional) Enter a group description
            1. Group Type:
                1. check "action"
                    1. This has no effect, but is useful for tracking user groups vs. profile groups
            1. All Users?:
                1. Check if you wish the profile to be accessible to all users
            1. Is Enabled?:
                1. check the box
            1. Click the "Add Group" button
            1. Repeat for all profiles
            1. Repeat for a group named "sudo"
                1. Do not enable sudo for all users!
                1. This is useful for developers but avoid giving root privileges to regular users
            1. Click the "Home" link at the top of the screen
    1. Start up and test each profile
        1. Click the "Start My Server" button
        1. Select a profile
            1. Click the "Start" button
        1. Confirm that the profile runs as expected
            1. Test notebooks as needed
            1. Confirm that notifications appear
        1. Repeat for each profile
                
Destroy Deployments
--------------------

At the end of a deployment's lifecycle, it is important to destroy it properly so no resources are left in place, 
costing you money.

Deleting the <deployment_name>-container, <deployment_name>-auth, <deployment_name>-cluster, and <deployment_name> 
CloudFormation stacks will kill the deployment and remove its resources but there are a couple of prerequisite steps 
to prepare for proper deletion.

Note: In the steps below, **do not manually delete any S3 buckets after emptying them.** If you delete the buckets, the
CloudFormation stack deletions associated with those buckets will fail and you will have to recreate the empty buckets 
to proceed. Empty them and let CloudFormation delete them for you.

1. Delete the <deployment_name>-container CloudFormation stack
    1. Empty the codepipeline-<region>-<deployment_name>-container-container S3 bucket
        1. Navigate to the AWS S3 console
            1. Check the box next to the codepipeline-<region>-<deployment_name>-container-container S3 bucket
            1. Click the "Empty" button
                1. Confirm the deletion of bucket contents by typing "permanently delete" in the provided field
                1. Click the "Empty" button
    1. Delete ECR repos for each profile
        1. Navigate to the AWS Elastic Container Registry
        1. Click the box next to the <deployment_name>/<profile_namespace> repository
        1. Click the "Delete" button
            1. Confirm the deletion by typing "delete" in the provided field
            1. Click the "Delete" button
        1. Repeat for each profile
    1. Delete the <deployment_name>-container CloudFormation stack
        1. Navigate to the AWS CloudFormation console
            1. Click the box next to the <deployment_name>-container stack
            1. Click the "Delete" button
                1. Click the "Delete stack" button
            1. Click the <deployment_name>-container stack name
                1. Click the "Events" tab
                1. Monitor the stack deletion progress
                    1. Click the refresh button periodically since the console doesn't update events automatically
1. Delete the <deployment_name>-auth CloudFormation stack
    1. Navigate to the AWS CloudFormation console
        1. Click the box next to the <deployment_name>-auth stack
        1. Click the "Delete" button
                1. Click the "Delete stack" button
        1. Click the <deployment_name>-auth stack name
            1. Click the "Events" tab
            1. Monitor the stack deletion progress
                1. Click the refresh button periodically since the console doesn't update events automatically
1. Delete the <deployment_name>-cluster CloudFormation stack
    1. Navigate to the AWS CloudFormation console
        1. Click the box next to the <deployment_name>-cluster stack
        1. Click the "Delete" button
                1. Click the "Delete stack" button
        1. Click the <deployment_name>-cluster stack name
            1. Click the "Events" tab
            1. Monitor the stack deletion progress
                1. Click the refresh button periodically since the console doesn't update events automatically
1. Delete the <deployment_name> CloudFormation stack
    1. Delete hub and notifications ECR repos
        1. Navigate to the AWS Elastic Container Registry
        1. Click the box next to the <deployment_name>/hub repository
        1. Click the "Delete" button
            1. Confirm the deletion by typing "delete" in the provided field
            1. Click the "Delete" button 
        1. Repeat the above steps for the <deployment_name>/notifications repository
    1. Empty the codepipeline-<region>-<deployment_name> S3 bucket
        1. Navigate to the AWS S3 console
            1. Check the box next to the codepipeline-<region>-<deployment_name> S3 bucket
            1. Click the "Empty" button
                1. Confirm the deletion of bucket contents by typing "permanently delete" in the provided field
                1. Click the "Empty" button
    1. Delete the <deployment_name> CloudFormation stack
        1. Navigate to the AWS CloudFormation console
            1. Click the box next to the <deployment_name> stack
            1. Click the "Delete" button
                    1. Click the "Delete stack" button
            1. Click the <deployment_name> stack name
                1. Click the "Events" tab
                1. Monitor the stack deletion progress
                    1. Click the refresh button periodically since the console doesn't update events automatically
1. (Optional) Delete the <deployment_name>-cluster and <deployment_name>-container CodeCommit repositories
    1. CodeCommit repos are cheap
        1. If you think you may re-deploy the same deployment, you may want to ease future work by leaving these repos in place
    1. Navigate to the AWS CodeCommit console
        1. Check the box next to the <deployment_name>-container repo
        1. Click the "Delete repository" button
            1. Confirm the deletion by typing "delete" in the provided field     
            1. Click the "Delete" button
        1. Repeat the above steps for the <deployment_name>-cluster repo
                              