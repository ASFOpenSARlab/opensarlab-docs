[Return to Table of Contents](../user.md)

# **Accessing S3 Buckets**
<!-- # **Accessing S3 Buckets from OpenScienceLab** -->

*The commands below can be run from a notebook code cell by prepending an `!` or directly from a terminal.*

### **For those that are familiar with CLI**

Those that are comfortable using command line tools, such as Bash, may find that the AWS syntax is not intuitive.

e.g.

Recursive flag: 

|Bash|AWS|
|----|---|
|`-r`|--recursive|

_Key Point_: Please remember that AWS has a cumbersome syntax that may differ from other command lines.

Generally speaking, the S3 command should look something like the following:

``` aws
aws s3 [optional_flags] <source_path> <destination_Path>
```

## **Accessing Public S3 Buckets**
---

*When accessing a public bucket from OpenScienceLab, be sure to include the following flags:*
- `--no-sign-request` 
- `--region=<bucket's region>`

**NB: The S3 buckets can have different sets of permissions. The commands below assume public access to the list, read, and write.**

_List of Useful AWS commands_:

|Action|AWS Command|
|---|---|
|List the contents of a bucket|`aws --no-sign-request --region <bucket's region> s3 ls s3://bucket_name/`|
|List the contents of a directory in a bucket|`aws --no-sign-request --region <bucket's region> s3 ls s3://bucket_name/directory_name/`|
|Download a file from a bucket|`aws --no-sign-request --region <bucket's region> s3 cp s3://bucket_name/directory_name/filename destination/path/filename`|
|*Upload a file to a bucket|`aws --no-sign-request --region <bucket's region> s3 cp source/path/filename s3://bucket_name/destination/path/filename`|

__*Increase your `s3.multipart_threshold` to allow uploading up to 5000MB as an anonymous user with the following steps:__

1. Open a terminal
2. Run the following command:

``` aws
aws configure set default.s3.multipart_threshold 5000MB
```
    
## **Accessing Private S3 Buckets**
---

### **Configure the AWS Client in your OpenScienceLab account**

(Prerequisite) To configure the AWS Client, you will need:
- An _AWS Access Key ID_ to the account holding the bucket
- An _AWS Secret Access Key_ to the account holding the bucket
- An _arn_ to an _AWS IAM role_ with permission to access the bucket

**Steps on configuring a terminal**:

1. Open a terminal and run:
```
aws configure
```

2. It will ask you for the following:
    - `AWS Access Key ID`
    - `AWS Secret Access Key`
    - `Default region name`
        - *Optional: You can enter the region where your bucket is located but this just sets a default and you will be able to enter your bucket's region in a following step*
    - `Default output format`
        - *Optional: you can leave this empty*
            
3. Manually edit the `config` file to add profile using *Vim.

- Use `vim ~/.aws/config` to open the `config` file.
- Add the following: 
    
```
[profile osl]
source_profile = default
region = <your bucket's region>
role_arn = <arn to your iam role>
```

4. Save and exit Vim


*NB: _Vim_ is a command line text editor. Since it does have a learning curve, users that never used Vim are encouraged to reference the [Vim Command Cheat Sheet](https://vim.rtorr.com/).
    
### **For Private S3 Bucket**
_List of Useful AWS commands_:

|Action|AWS Command|
|---|---|
|List the contents of a bucket| `aws --profile osl s3 ls s3://bucket_name/`|
|List the contents of a directory in a bucket|`aws --profile osl s3 ls s3://bucket_name/directory_name/`|
|Download a file from a bucket|`aws --profile osl s3 cp s3://bucket_name/directory_name/filename destination/path/filename`|
|Upload a file to a bucket|`aws --profile osl s3 cp source/path/filename s3://bucket_name/destination/path/filename`|