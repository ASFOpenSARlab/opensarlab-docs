# Lab Management
<br>

## What Does Being a Lab Manager Mean

It means you have been given admin permissions for a particular lab.

### Lab Manager Permissions

- Add and remove users from the lab
- Manage a users allowed profiles
- Grant and remove Lab Manager permissions
- Generate and revoke tokens
- Be an admin on JupyterHub

## Lab Manager Page

### Accessing Management Page

In OpenScienceLab, there will be a new `Manage` button on the lab card you have lab manager permissions for.

<figure>
<img src="../assets/manage_button.png" style="height: 300px;">
</figure>

### Tokens

If the lab does not have tokens enabled you will see a message in the `Tokens` section indicating as such.

<figure>
<img src="../assets/manage_tokens_disabled.png" style="height: 300px;">
</figure>

If the lab has tokens enabled, you will see the following user interface

<figure>
<img src="../assets/manage_tokens.png" style="height: 300px;">
</figure>

#### Creating Token

1. Lab profiles field, a comma separated list of profiles a user who uses this token will have access to. Ex: `m6a.large, m6a.xlarge`. By default the field will be prepopulated with the labs default set of profiles.

1. Date range fields. Optional fields that allow you to set a start and/or end date for when your tokens are valid.

1. Add button. Generates a random token with your provided token settings.

#### Token Options

4. Token, a random 13 character long token. Share this with your users to allow them to join your lab with a token.

1. Token settings. Displays the settings the token was generated with. These cannot be changed after creation.

1. Remove token button. Allows you to invalidate a token, making people unable to get access to your lab with it.

### User Management

In the `Users` portion of the page, you will see a list of users with access to the lab and their permissions.

<figure>
<img src="../assets/manage_lab_users.png" style="height: 300px;">
</figure>

#### Adding/Updating Users

1. Username field, this must match the username of the user you are trying to add. The user does not need to have an account made at this point, but the next user who creates an account with that username will have access to the lab.

1. Lab profiles field, a comma separated list of profiles the user should have access to. Ex: `m6a.large, m6a.xlarge`. By default the field will be prepopulated with the labs default set of profiles.

1. Add button, adds a user to the lab with the requested set of profiles. If the user was already added to the lab, it will overwrite their previous profiles with the provided profiles.

#### Filtering Users

4. If your lab has a large amount of users, the amount displayed will be truncated. You can filter users by username or email. After typing your filter, press enter to apply it.

#### Managing Permissions

5. Remove button, pressing this button will remove the user from the lab.

1. Lab manager permission button, if the user is not a lab manager you will be able to grant manager permissions. If the user is a lab manager you will be able to remove their lab manager permissions here.

## Lab Management in JupyterHub
