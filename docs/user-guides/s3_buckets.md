# Accessing S3 Buckets
<br>

OpenScienceLab user servers typically run in AWS region `us-west-2`, which houses all public NASA data. This provides cheap, low-latency data access. 

You may access any public AWS S3 bucket or private bucket to which you have permission with either the `aws-cli` (command line interface) or `boto3` (Python package).

:::{tip} Configure the AWS Client in your OpenScienceLab account for non-public bucket access.

*Prerequisite: an AWS access key that provides access to the S3 bucket*

1. Open a terminal
2. Run the command: `aws configure`
3. When prompted, provide:
    - `AWS Access Key ID`
    - `AWS Secret Access Key`
    - `Default region name`: "us-west-2"
    - `Default output format`: "json" 

  
:::

:::{warning} 

If accessing a public S3 bucket anonymously, you must either:
- Provide the `--no-sign-request` argument to AWS-cli
or
- Provide an `UNSIGNED` config to the boto3 S3 bucket resource:
    - `s3 = boto3.resource('s3', config=Config(signature_version=UNSIGNED))`
 
:::

## Example Notebook Demonstrating S3 Bucket Access with `AWS-cli` and `boto3`

[S3_Buckets_Upload_Download.ipynb](https://github.com/ASFOpenSARlab/NISAR-Early-Adopters-Workshop-Oct-2024/blob/main/S3_Buckets_Upload_Download.ipynb)

:::
