# Troubleshooting

## Portal

### A Cluster Gives a "403 Unauthorized" Error
**Problem**: When any user clicks a deployment's "Go to Lab" page on the SSO Portal,
they get a "403 Unauthorized" error, despite being properly authorized.

**Solution**: Double check that the SSO token in the Portal is the same as the cluster.
If not, aligning them should fix the problem. If they are, looking at the cluster logs
and the portal logs for the `/portal/auth` endpoint may yield more information.

## Cluster
### OSL Servers Time Out Intermittently
**Problem**: An user's server consistently times out while other users have no difficulty starting a server.

**Solution**: Respawn the `hub` pod. Sometimes an internal state within `hub` gets out of sync with the actual state. 

To respawn the `hub` pod, in a terminal:

1. `sk <name-of-cluster>`
1. `kubectl get pods`
1. `kubectl delete pod <name-of-hub-pod>`

*or* delete the hub EC2 from the AWS EC2 console and let the autoscaler bring it back
up.

### While Cleaning Up a Deployment, Resources Won't Delete
This is the workflow we developed to tear down clusters:

1. Kill all servers and disable access in the portal  
1. CloudFormation pipelines (force delete after fail is fine)
    1. Jupyterhub  
    1. Cluster  
        1. Hub repository, cron repository are container (ECR) registries  
        1. Container pipeline  
        1. Pipeline bucket is “codepipeline-\*-container”  
        1. Empty bucket then let the pipeline delete it  
    1. Cluster pipeline  
        1. Empty codepipeline-us-west-2-\<CLUSTER\_NAME\> S3 bucket
1. Containers (ECR)  
1. S3 buckets  
1. EC2
    - Instances  
    - Volumes  
    - Snapshots
1. Check tag editor for osl-billing tag

## Container
### Running OSL Containers Locally
There are some tricks to running local OSL containers. Notably, one feature that is
practically required is a virtual volume mount, in order to not have to transfer data in
and out of the container. This can be accomplished as in the [2024 EarthScope InSAR
Workshop Repository](https://github.com/ASFOpenSARlab/earthscope-insar-image).

This is the important code snippet from the [bottom of the `Dockerfile`](https://github.com/ASFOpenSARlab/earthscope-insar-image/blob/18e0074e1ebe184663cac4e5fe81f3a921867ceb/dockerfile#L151C1-L165C16):
```docker
WORKDIR /home/jovyan

RUN chmod -R 775 /home/jovyan &&\
    chown -R jovyan:users /home/jovyan

RUN mkdir -p /tmp/helper_scripts
COPY helper_scripts/* /tmp/helper_scripts

COPY helper_scripts/entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
COPY --chown=1000:100 helper_scripts/cmd.sh /cmd.sh
RUN chmod 755 /cmd.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/cmd.sh"]
```


