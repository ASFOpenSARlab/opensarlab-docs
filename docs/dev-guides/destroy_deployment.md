[Return to Developer Guide](../dev.md)

# **Destroy Deployments**

It is essential to destroy a deployment at the end of its life cycle so that no resources are left in place. With a proper destruction procedure, one can mitigate the accrued cost of AWS. 

---

## **WARNING:** Before deleting the deployments, developers will need to account for the following: 

- When deleting the `CloudFormation` stack, the deletion order matters.
- Delete some of the `CloudFormation` stacks before deleting ECR.
- The name of the items you're deleting may differ depending on the deployment you are taking down. For example, your deployment's `CloudFormation` stack may not have a `region` name or may not have a `<deployment-name>-auth` stack.
- Do **NOT** take down the `Cognito` and `CloudWatch` logs. These are used for statistical analysis later on.

---

## **Removing CloudFormation Stacks**

---

When you first go to CloudFormation, it should look something like the following:

![CloudForamtion Stacks](../assets/docs-cloudFormation-stacks.PNG)


Because the order of removing deployment is essential, you will need to take down the `CloudFormation` stacks first. Deleting the following CloudFormation stacks will kill the deployment and remove its resources:

- `<deployment_name>-container`
- `<deployment_name>-auth`
- `<deployment_name>-cluster`
- `deployment_name`

---

_**NB**_: **Do not manually delete any S3 buckets after emptying them** in the steps below.

If you delete the buckets after emptying them, the `CloudFormation` stack deletions associated with those buckets will fail. To fix the issues regarding deleted buckets, you will have to recreate the empty buckets to proceed. 

Therefore, let `CloudFormation` delete the S3 buckets for you once you empty them.

---

Follow the below instructions to properly delete these stacks.

---

## **Steps to Delete `CloudFormation` Stacks**

---

### **1. Prepare to delete the `<deployment_name>-container` CloudFormation stack**
    
_NB: The `<deployment_name>-container` is independent of other stacks, i.e., the deletion order does not matter._

1. Empty the `codepipeline-<region>-<deployment_name>-container` S3 bucket

![empty container in s3](../assets/docs-s3-empty.PNG)

2. Navigate to the AWS S3 console
    1. Click the `codepipeline-<region>-<deployment_name>-container` S3 bucket option.
    1. Click the `Empty` button
        1. Confirm the deletion of bucket contents by typing `permanently delete` in the provided field
        1. Click the `Empty` button

### **2. Delete ECR repos for each profile**

1. Navigate to the AWS Elastic Container Registry

![delete ECR](../assets/docs-ecr-delete.PNG)

2. Click the option next to the `<deployment_name>/<profile_namespace>` repository
3. Click the `Delete` button
    1. Confirm the deletion by typing `delete` in the provided field
    1. Click the `Delete` button
4. Repeat for each profiles


### **3. Delete the `<deployment_name>-container` CloudFormation stack**
1. Navigate to the AWS CloudFormation console

![delete cluster stack](../assets/docs-cloudFormation-cluster-delete.PNG)

1. Click the `<deployment_name>-container` stack option
1. Click the `Delete` button
    1. Click the `Delete Stack` button
1. Click the `<deployment_name>-container` stack name
    1. Click the `Events` tab
    1. Monitor the stack deletion progress
        1. Click the refresh button periodically since the console doesn't update events automatically

_NB: Stack deletion process will be similar to above instructions for other stacks._

---

## **Deleting the rest of the `CloudFormation` Stacks**

---

Unlike the `container` stack, the deletion order matters for the rest. On the bright side, the deletion process should be similar to the `container` stacks.

Specifically, you will need to delete your stacks in the following order:

1. `<deployment_name>-auth` stack (if applicable)
2. `<deployment_name>-jupyterhub` stack
3. `<deployment_name>-cluster` stack
4. *`<deployment_name>-cluster-pipeline` stack
5. *`<deployment_name>` stack (if applicable)

_NB:*These stacks have additional steps._

**WARNING: As mentioned earlier, do NOT delete the `<deployment_name>-cognito` stack.**

In above order, follow these steps (except for stack 4 and 5):

1. Delete the `<deployment_name>-<stack_name>` CloudFormation stack
    1. Navigate to the AWS CloudFormation console
        1. Click the box next to the `<deployment_name>-<stack_name>` stack
        1. Click the `Delete` button
                1. Click the `Delete stack` button
        1. Click the `<deployment_name>-<stack_name>` stack name
            1. Click the `Events` tab
            1. Monitor the stack deletion progress
                1. Click the refresh button periodically since the console doesn't update events automatically


If you are deleting stack 4 (`<deployment_name>-cluster-pipeline`), you will need to follow these steps first before deleting the stack:


1. Navigate to the AWS S3 console
    1. If exists, click the `<region>-<deployment_name>-lambda` S3 bucket option.
    1. Click the `Empty` button
        1. Confirm the deletion of bucket contents by typing `permanently delete` in the provided field
        1. Click the `Empty` button

If you are deleting stack 5 (`<deployment_name>`), you will need to follow these steps first before deleting the stack:

1. Delete the `deployment_name` CloudFormation stack
    1. Delete hub and notifications ECR repos
        1. Navigate to the AWS Elastic Container Registry
        1. Click the box next to the `deployment_name`/hub repository
        1. Click the `Delete` button
            1. Confirm the deletion by typing "delete" in the provided field
            1. Click the `Delete` button 
        1. Repeat the above steps for the `deployment_name`/notifications repository
    1. Empty the `codepipeline-<region>-<deployment_name>` S3 bucket
        1. Navigate to the AWS S3 console
            1. Check the box next to the `codepipeline-<region>-<deployment_name>` S3 bucket
            1. Click the `Empty` button
                1. Confirm the deletion of bucket contents by typing `permanently delete` in the provided field
                1. Click the `Empty` button
---

## **Delete EBS Snapshots and Volumes**

To mitigate the cost associated with storage space, it is crucial to deallocate unused resources. The below steps will guide you on how to do so.

---

First, navigate to the AWS EC2 console - this step should be identical for both EBS snapshots and EBS volumes.

![ec2 home screen](../assets/docs-ec2-snap-vol.PNG)

### **Delete EBS snapshots**
1. Click the _Snapshots_ link in the sidebar menu
    1. Filter by osl-stackname: `<deployment_name>`
        1. **Double check that you filtered for the correct deployment!**
    1. Select all snapshots
    1. Select `Delete` from the `Actions` menu
    1. Confirm by clicking the `Yes, delete` button

### **Delete EBS volumes**
1. Navigate to the AWS EC2 console
1. Click the _Volumes_ link in the sidebar menu
    1. Filter by osl-stackname: `<deployment_name>`
        1. **Double check that you filtered for the correct deployment!**
    1. Select all volumes
    1. Select `Delete volumes` from the `Actions` menu
    1. Confirm by clicking the `Yes, delete` button             

---

## **(Optional) Delete the CodeCommit repositories**

This section will guide you on how to remove the  `<deployment_name>-container` and `<deployment_name>-cluster` repositories located in the CodeCommit.

_**Important Note:**_ Often, it would be in your best interest to preserve the CodeCommit repositories since the cost of maintaining them are minuscule. 

If you believe that you may re-deploy the same deployment, you may want to ease future work in one of the following manners:

1. Leaving these repositories in place, i.e., don't delete them.
1. Download the zip of your repositories, store them in S3, and then delete them. 

In another word, delete the CodeCommit repositories if and only if you are sure that you don't need them.

---

First, navigate to the AWS CodeCommit console:

![CodeCommit Repos](../assets/docs-codecommit.PNG)

Then delete the `<deployment_name>-container` and `<deployment_name>-cluster` in any order. The deletion process for these two repositories is following:

1. Check the option next to the repository
1. Click the `Delete repository` button
1. Confirm the deletion by typing `delete` in the provided field     
1. Click the `Delete` button

--- 

## **(Optional) Confirm that all resources have been deleted**

Once you've taken down the deployment, you may want to verify the resource usage. 

---

![cost allocation](../assets/docs-cost-allocation.PNG)

1. Wait a day for deleted resources to update in the tag editor
1. Navigate to the AWS Resource Groups and Tag Editor console
    1. Select the _Tag Editor_ link in the sidebar menu and fill in the following:
        1. Regions: `<current-region>`
        1.  Tags:
            1. `Key`: Cost allocation tag
            1. `Value`: `<deployment_name>`
        1. Click the `Search resources` button
        1. Identify and delete any remaining resources