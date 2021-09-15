[Return to Developer Guide](../dev.md)

# Questions to Consider When Planning a New OpenSARlab Deployment

*This document is intended to aid developers who are setting up OpenSARlab deployments in their own AWS account for their own user groups.*


## Environment Related Questions
- Do you have access to the notebooks you will be using?
    - Do they currently exist in a GitHub repository we can look at?
- How many conda environments will you need?
- Do you have an environment.yml for a conda environment/s in which to run the notebook?

## Resource Related Questions
- How much RAM and vCPUs each user will need access to?
- How much storage each user will need?
- How many users there will be?
- For cost estimation purposes, how many hours of activity per day do you anticipate from each user?

## Deployment End-of-Life Related Questions
- What are the start and end dates on the deployment?
- Will users need a window of time at the end of the deployment to migrate data off of OpenSARlab?
- Will you require an option for users to recreate the deployment environment locally with docker?

## Reports and Billing
- Would you like cost reports weekly or monthly?
- Would you like any cost alerts set up, in case usage turns out to be much greater than anticipated?
    - What course of action will be taken if cost limits are hit early? 
- Do you have funding secured?
- What payment method will you be using?
- Will you be paying weekly, monthly, or on some other time frame?



