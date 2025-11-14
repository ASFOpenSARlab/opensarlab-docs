# Contents of `opensciencelab.yaml`

Schema for the egress config can be found [here](./egress_config.md).

```yaml
---

parameters:
  lab_short_name: The url-friendly short name of the lab deployment.
  cost_tag_key: Name of the cost allocation tag.
  cost_tag_value: Value of the cost allocation tag. Also used by cloudformation during setup for naming.
  admin_user_name: Username of initial JupyterHub admin
  certificate_arn: AWS arn of the SSL certificate held in Certificate Manager
  container_namespace: A namespaced path within AWS ECR containing custom images
  lab_domain: Domain of JupyterHub deployment. Use `load balancer` if not known.
  portal_domain: Domain of the OSL Portal. Used to communicate with email services, etc.

  # Volume and snapshot lifecycle managament
  days_till_volume_deletion: The number of integer days after last server use when the user's volume is deleted. To never delete volume, use value 365000.
  days_after_server_stop_till_warning_email: Comma seperated list of integer days after last server use when user gets warning email. Must have minimum one value. To never send emails, use value 365000
  days_till_snapshot_deletion: The number of integer days after last server use when the user's snapshot is deleted. To never delete snapshot, use value 365000.
  days_after_server_stop_till_deletion_email: Number of integer days after last server use when user gets email notifiying about permanent deletion of data. Must have minimum one value. To never send emails, use value 365000
  utc_hour_of_day_snapshot_cron_runs : Integer hour (UTC) when the daily snapshot cron runs.
  utc_hour_of_day_volume_cron_runs: Integer hour (UTC) when the daily snapshot cron runs.

  # Versions of sofware installed
  eks_version: '1.31'  # https://docs.aws.amazon.com/eks/latest/userguide/kubernetes-versions.html
  kubectl_version: '1.31.0/2024-09-12'  # https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html
  aws_ebs_csi_driver_version: '2.36.0'  # https://github.com/kubernetes-sigs/aws-ebs-csi-driver/releases
  jupyterhub_helm_version: '3.3.7'  # https://jupyterhub.github.io/helm-chart/
  jupyterhub_hub_image_version: '4.1.5'  # Match App Version of JupyterHub Helm
  aws_k8s_cni_version: 'v1.18.5'  # https://docs.aws.amazon.com/eks/latest/userguide/managing-vpc-cni.html
  cluster_autoscaler_helm_version: '9.43.1'  # https://github.com/kubernetes/autoscaler/releases > cluster-autoscaler-chart
  istio_version: '1.23.2'  # https://github.com/istio/istio/releases; set to None if disabling Istio
  dask_helm_version: '2024.1.0'  # https://helm.dask.org/ > dask-gateway-{version}; Set to None if disabling Dask

nodes:
  - name: hub  # Required
    instance: The EC2 instance for the hub node. Type t3a.medium is preferred.
    min_number: 1  # Required
    max_number: 1  # Required
    node_policy: hub  # Required
    is_hub: True  # Required

  - name: daskcontroller  # Required
    instance: t3a.medium, t3.medium
    min_number: 1  # Required
    max_number: 1  # Required
    node_policy: dask_controller  # Required
    is_dask_controller: True  # Required
    is_spot: True

  - name: Name of node type. Must be alphanumeric (no special characters, whitespace, etc.)
    instance: The EC2 instance for the hub node. Fallback types seperated by commas. (m6a.xlarge, m5a.xlarge)
    min_number: Minimum number of running node of this type in the cluster (0)
    max_number: Maximum number of running node of this type in the cluster (25)
    node_policy: Node permission policy (user)
    root_volume_size: Size of the root volume of the EC2 (GiB) (Optional, range 1 - 16,384)
    is_dask_worker: The EC2 is a dask worker (Optional, True).
    is_spot: The EC2 is part of a spot fleet (Optional, True).  

# Service accounts allow a built-in way to interact with AWS resources from within a server. 
# However, the default AWS profile is overwritten and may have inintended consequences.
service_accounts:
  - name: service_account_name
    namespace: namespace of k8s resource (jupyter)
    permissions:
      - Effect: "Allow"
        Action: 
          - "AWS Resource Action"
        Resource: "AWS Resource ARN"

dask_profiles:
  - name: Name of dask profile that the user can select (Example 1)
    short_name: example_1
    description: "Basic worker used by example notebook"
    image_url: FQDN with docker tags (233535791844.dkr.ecr.us-west-2.amazonaws.com/smce-test-opensarlab/daskworker:180a826). If not public, the domain must be in the same AWS account as the cluster.
    node_name: Node must be defined as a dask worker.
    egress_profile: Name of the egress config to use. Do not include `.conf` suffix (Optional)

lab_profiles:
  - name: Name of profile that users can select (SAR 1)
    description: Description of profile
    image_url: FQDN of JupyterLab single user image with docker tags ( 233535791844.dkr.ecr.us-west-2.amazonaws.com/smce-test-opensarlab/sar:ea3e147). If not public, the domain must be in the same AWS account as the cluster.
    hook_script: Name of the script ran on user server startup (sar.sh) (optional)
    memory_guarantee: RAM usage guaranteed per user (6G) (Optional. Defaults to 0% RAM.)
    memory_limit: RAM usage guaranteed per user (16G) (Optional. Defaults to 100% RAM of server.)
    cpu_guarantee: CPU usage guaranteed per user (15) (Optional. Defaults to 0% CPU. Memory limits are preferable.)
    cpu_limit: CPU usage limit per user (30) (Optional. Defaults to 100% CPU of server. Memory limits are preferable.)
    storage_capacity: Size of each user's home directory (500Gi). Cannot be reduced after allocation.
    node_name: Node name as given in above section (sar1)
    delete_user_volumes: If True, deletes user volumes upon server stopping (Optional. Defaults to False.)
    desktop: If True, use Virtual Desktop by default (Optional. Defaults to False) The desktop enviromnent must be installed on image. 
    default: If True, the specific profile is selected by default (Optional. False if not explicity set.)
    service_account: Name of previously defined service account to apply to profile (Optional)
    egress_profile: Name of the egress config to use. Do not include `.conf` suffix (Optional)
```