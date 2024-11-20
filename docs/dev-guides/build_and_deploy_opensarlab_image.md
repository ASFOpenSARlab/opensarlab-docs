# Build and Deploy OpenSARLab Image

## Setup Container Build in AWS

1. Create AWS account if needed

1. Gain GitHUb access if needed

1. Create new GitHub repo

    To organize repos, use the naming convention: `deployment-{location/owner}-{maturity?}-container`

1. Copy canonical `opensarlab-container` and commit

    Either copy/paste or use `git remote add github https://github.com/ASFOpenSARlab/opensarlab-container.git`

1. Within AWS add GitHub Connections. If done before, the app should show your GitHub app name.

    https://docs.aws.amazon.com/dtconsole/latest/userguide/connections-create-github.html

    Make sure you are in the right region of your AWS account.

    Once Connections is setup, save the Connection arn for later.

1. Remember to add the current GitHub repo to the Connection app

    GitHub > Settings > GitHub Apps > AWS Connector for GitHub > Repository Access

    Add GitHub repo

1. Within AWS CloudFormation, upload the template file `cf-container.yaml` and build.

    When prompted, use the Parameters:

    | Parameter | Description |
    |-----------|-------------|
    | Stack name | The CloudFormation stack name. For readablity, append `-pipeline` to the end. |
    | CodeStarConnectionArn | The ARN of the Connection made eariler. |
    | ContainerNamespace | The ECR prefix acting as a namespace for the images. This will be needed for the cluster's `opensarlab.yaml`. |
    | CostTagKey | Useful if using billing allocation tags. |
    | CostTagValue | USeful if using billing allocation tags. Note that many resources will have this in their name for uniqueness. It needs to be short in length. |
    | GitHubBranchName | The branch name of the GitHub repo where the code resides. |
    | GitHubFullRepo | The GitHub repo name. Needs to be in the format `{GitHub organization}/{GitHub repo}` from `https://github.com/OrgName/RepoName`. |
    | | |

    The pipeline will take a few seconds to form.

    If the cloudformation stack fails to fully form it will need to be fully deleted and the template will need to be re-uploaded.

1. The pipeline will start to build automatically in CodePipeline.

    A successful run will take about 20 minutes. 
    
    If it takes signitifcantly less time then the build might have failed even if CodePipeline says successful.
