[Return to Table of Contents](../user.md)

# Developing Notebooks for Classes or Trainings: Best Practices

### Provide an Environments Capable of Running the Notebooks

* Provide students with a conda environment that contains all needed software. [Conda Environments in OpenSARlab.](conda_environments.md)

* If you distribute an environment.yml file, students can upload it to the /home/jovyan/conda_environments/Environment_Configs/ directory and then create it using the /home/jovyan/conda_environments/Create_OSL_Conda_Environments.ipynb notebook.

* If dependency conflicts prevent you from installing the software needed to run all your notebooks into a single environment, you will need to create multiple conda environments to run different notebooks.

### Test Notebooks Ahead of Time.

* If there are assignment sections requiring students to code or refactor code, test the notebook with the correct solutions in place. This will alert you to potential problems which you may not otherwise notice.
    * Example: The notebook 

### Plan for Students with Poor Internet Access

* File sizes for run notebooks containing a lot of output can be quite large. Users with slow internet connections may have difficulty saving notebooks in this state. It can be risky to require that students submit assignments in the form of saved, pre-run notebooks. Some students may simply not be able to save and turn in their work.

    * Consider allowing assignments to be turned in as screenshots pasted into a Word or Google doc and saved as a pdf.
    * Consider splitting assignments into 2 notebooks, one with content/examples and another for the assignment. Pass only needed data structures from the content notebook to the assignment notebook using a pickle.
    