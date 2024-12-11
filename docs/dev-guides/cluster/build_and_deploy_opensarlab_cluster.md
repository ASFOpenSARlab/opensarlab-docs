# Build and Deploy OpenSARLab Cluster

1. Build the docker images first based off `opensarlab-container`.

1. Deploy the following in the same AWS account and region as the previous container images.

1. Create new GitHub repo

    To organize repos, use the naming convention: `deployment-{location/owner}-{maturity?}-cluster`

1. Copy canonical `opensarlab-cluster` and commit.

    Either copy/paste or use `git remote add github https://github.com/ASFOpenSARlab/opensarlab-cluster.git`

    Make sure any hidden files (like .gitignore, .yamllint, etc.) are properly copied.

1. Within AWS add GitHub Connections. If done before, the app should show your GitHub app name.

    https://docs.aws.amazon.com/dtconsole/latest/userguide/connections-create-github.html

    Make sure you are in the right region of your AWS account.

    Once Connections is setup, save the Connection arn for later.

1. Remember to add the current GitHub repo to the Connection app

    GitHub > Settings > GitHub Apps > AWS Connector for GitHub > Repository Access

    Add GitHub repo

1. Add a SSL certificate to AWS Certification Manager. 

    You will need the ARN of the certificate.

1. Update `opensciencelab.yaml` within the code. See explaination of the various parts [../opensciencelab_yaml.md](here). 

1. Deploy the CloudFormation template found at `pipeline/cf-setup-pipeline.yaml`.

    Use the following parameters:

    | Parameter | Description |
    |-----------|-------------|
    | Stack name | The CloudFormation stack name. For readablity, append `-pipeline` to the end. |
    | CodeStarConnectionArn | The ARN of the Connection made eariler. |
    | CostTagKey | Useful if using billing allocation tags. |
    | CostTagValue | USeful if using billing allocation tags. Note that many resources will have this in their name for uniqueness. It needs to be short in length. |
    | GitHubBranchName | The branch name of the GitHub repo where the code resides. |
    | GitHubFullRepo | The GitHub repo name. Needs to be in the format `{GitHub organization}/{GitHub repo}` from `https://github.com/OrgName/RepoName`. |
    | | |

    The pipeline will take a few seconds to form.

    If the cloudformation stack fails to fully form it will need to be fully deleted and the template will need to be re-uploaded.

1. The pipeline will start to build automatically in CodePipeline.

    A successful run will take about 12 minutes. 
    
    If it takes signitifcantly less time then the build might have failed even if CodePipeline says successful.

    Sometimes the final buld stage will error with something like "build role not found". In this case, just retry the stage. There is sometimes a race condtion for AWS role creations.  

    During the course of the build, other CloudFormation stacks will be created. One of these is for the cluster. Within Outputs will be the Load Balancer url which can be used within external DNS. 

1. Add the Portal SSO Token to Secrets Manager.

    Update `sso-token/{region}-{cluster name}`.

1. Add deployment to Portal

    Update `labs.{maturity}.yaml` and re-build Portal.

    Within the Portal Access page, create lab sheet with the `lab_short_name` found in `opensciencelab.yaml`.

    Within the Portal Access page, add usernames and profiles as needed.

1. Add CloudShell access

    From the AWS console, start CloudShell (preferably in it's own browser tab)

    CloudShell copy and paste are not shifted like a normal terminal. They are your normal keyboard operations.

    If needed, update default editor:

    - Append to ~/.bashrc the command `export EDITOR=vim`

    Setup access to the K8s cluster

    - From the AWS EKS page, get the cluster name for below.

    - From the AWS IAM page, get the ARN of the role `{region namwe}-{cluster name}-user-full-access`

    - On the CloudShell terminal, run `aws eks update-kubeconfig --name {EKS clsuter name} --role-arn {role ARN}`

    - Run `kubectl get pods -A`. You should see any user and hub pods. 
  
1. Bump the AutoScaling Groups

    For reasons unknown, fresh brand-new ASGs need to be "primed" by setting the desired number to one. JupyterHub's autoscaler will scale the groups back down to zero if there is no use. This normally has to only be done once.

1. Start a JupyterLab server to make sure one works

1. Within CloudShell, check the PVC and PV of the user volume. Make sure the K8s annotation `pv.kubernetes.io/provisioned-by: ebs.csi.aws.com` is present.

    If not, then the JupyterHub volume managment will fail and volumes will become orpaned upon lifecycle deletion.


## Destroy OpenSARLab Cluster

To take down, consult [destroy deployment docs](../destroy_deployment.md)