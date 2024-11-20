# Contents of `opensciencelab.yaml`

Schema for the egress config can be found [../egress_config.md](here).

```yaml
---

parameters:
  lab_short_name: The url-friendly short name of the lab deployment.
  cost_tag_key: Name of the cost allocation tag
  cost_tag_value: Value of the cost allocation tag
  admin_user_name: Username of initial JupyterHub admin
  certificate_arn: AWS arn of the SSL certificate held in Certificate Manager
  container_namespace: A namespaced path within AWS ECR containing custom images
  lab_domain: Domain of JupyterHub deployment. Use `load balancer` if not known.
  portal_domain: Domain of the OSL Portal. Used to communicate with email services, etc.
  days_till_volume_deletion: The number of integer days after last server use when the user's volume is deleted. To never delete volume, use value 365000.
  days_till_snapshot_deletion: The number of integer days after last server use when the user's snapshot is deleted. To never delete snapshot, use value 365000.
  days_after_server_stop_till_warning_email: Comma seperated list of integer days after last server use when user gets warning email. Must have minimum one value. To never send emails, use value 365000
  days_after_server_stop_till_deletion_email: Number of integer days after last server use when user gets email notifiying about permanent deletion of data. Must have minimum one value. To never send emails, use value 365000
  utc_hour_of_day_snapshot_cron_runs : Integer hour (UTC) when the daily snapshot cron runs.
  utc_hour_of_day_volume_cron_runs: Integer hour (UTC) when the daily snapshot cron runs.

nodes:
  - name: hub  # Required
    instance: The EC2 instance for the hub node. Type t3a.medium is preferred.
    min_number: 1  # Required
    max_number: 1  # Required
    node_policy: hub  # Required
    is_hub: True  # Required

  - name: Name of node type. Must be alphanumeric (no special characters, whitespace, etc.)
    instance: The EC2 instance for the hub node (m5a.2xlarge)
    min_number: Minimum number of running node of this type in the cluster (0)
    max_number: Maximum number of running node of this type in the cluster (25)
    node_policy: Node permission policy (user)
    root_volume_size: Size of the root volume of the EC2 (GiB) (Optional, range 1 - 16,384)

service_accounts:
  - name: service_account_name
    namespace: namespace of k8s resource (jupyter)
    permissions:
      - Effect: "Allow"
        Action: 
          - "AWS Resource Action"
        Resource: "AWS Resource ARN"

profiles:
  - name: Name of profile that users can select (SAR 1)
    description: Description of profile
    image_name: Name of JupyterHub single user image found in ECR (sar1)
    image_tag: Tag of JupyterHub single user image found in ECR (b1f4e84)
    hook_script: Name of the script ran on user server startup (sar.sh) (optional)
    memory_guarantee: RAM usage guaranteed per user (6G) (Optional. Defaults to 0% RAM.)
    memory_limit: RAM usage guaranteed per user (16G) (Optional. Defaults to 100% RAM of server.)
    cpu_guarantee: CPU usage guaranteed per user (15) (Optional. Defaults to 0% CPU.)
    cpu_limit: CPU usage limit per user (30) (Optional. Defaults to 100% CPU of server.)
    storage_capacity: Size of each user's home directory (500Gi). Cannot be reduced after allocation.
    node_name: Node name as given in above section (sar1)
    delete_user_volumes: If True, deletes user volumes upon server stopping (Optional. Defaults to False.)
    classic: If True, use Classic Notebook interface (Optional. Defaults to False, i.e. JupyterLab.)
    default: If True, the specific profile is selected by default (Optional. False if not explicity set.)
    service_account: Name of previously defined service account to apply to profile (Optional)
    egress_profile: Name of the egress config to use. Do not include `.conf` suffix (Optional)
```