[![OpenSARlab Header](../assets/OSL_user_guide_header.png)](../OpenSARlab_user_guide.md)

# Installing Software in OpenSARlab

## pip
You can install pip packages to your /home/jovyan/.local/lib/python3.7/site-packages directory with the following command:
- python -m pip install --user package_name

It is important to use the  --user argument. This will install the package to your .local directory, avoiding any permission issues, and insuring that the package installation will persist when the OpenSARlab server restarts (so you don't have to reinstall it every time). 

Note that pip packages in the .local directory will supersede other versions of the same package installed elsewhere.   

## apt and apt-get
Users cannot install software in OpenSARlab using apt or apt-get.

