[Return to Table of Contents](../user.md)

# Accessing Public and Private S3 Buckets from OpenSARlab

*The commands below can be run from a terminal or from a notebook code cell by prepending an `!`*

## Accessing Public S3 Buckets

*When accessing a public bucket from OpenSARlab, be sure to include the `--no-sign-request` and `--region=<bucket's region>` flags*

*Note that buckets can have many variations on set permissions. The commands below assumes public access to list, read, and write.*

- List the contents of a bucket
    - `aws --no-sign-request --region <bucket's region> s3 ls s3://bucket_name/`
- List the contents of a directory in a bucket
    - `aws --no-sign-request --region <bucket's region> s3 ls s3://bucket_name/directory_name/`
- Download a file from a bucket
    - `aws --no-sign-request --region <bucket's region> s3 cp s3://bucket_name/directory_name/filename destination/path/filename`
- Upload a file to a bucket
    - `aws --no-sign-request --region <bucket's region> s3 cp source/path/filename s3://bucket_name/destination/path/filename`
    
## Accessing Private S3 Buckets

### Configure the AWS Client in your OpenSARlab account

- To configure the AWS Client, you will need:
    - An AWS Access Key ID to the account holding the bucket
    - An AWS Secret Access Key to the account holding the bucket
    - An arn to an AWS IAM role with permission to access the bucket
- Open a terminal
    - `aws configure`
        - When prompted enter the:
            - `AWS Access Key ID`
            - `AWS Secret Access Key`
            - `Default region name`
                - *Optional: You can enter the region where your bucket is located but this just sets a default and you will be able to enter your bucket's region in a following step*
            - `Default output format`
                - *Optional: you can leave this empty*
                
-  `vim ~/.aws/config`
    - *vim is a command line text editor*
        - [Vim Command Cheat Sheet](https://vim.rtorr.com/)
    - Add the following to the `config` file
    ```
    [profile osl]
    source_profile = default
    region = <your bucket's region>
    role_arn = <arn to your iam role>
    ```
   - Save and exit vim
    
### Access the private S3 bucket

- List the contents of a bucket
    - `aws --profile osl s3 ls s3://bucket_name/`
- List the contents of a directory in a bucket
    - `aws --profile osl s3 ls s3://bucket_name/directory_name/`
- Download a file from a bucket
    - `aws --profile osl s3 cp s3://bucket_name/directory_name/filename destination/path/filename`
- Upload a file to a bucket
    - `aws --profile osl s3 cp source/path/filename s3://bucket_name/destination/path/filename`
    
