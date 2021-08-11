[Return to Table of Contents](../user.md)

# Developing Notebooks for Classes or Trainings: Best Practices

### Provide a Conda Environment Capable of Running the Notebooks

* Provide students with a conda environment that contains all needed software. [Conda Environments in OpenSARlab.](conda_environments.md)

* If you distribute an environment.yml file, students can upload it to the /home/jovyan/conda_environments/Environment_Configs/ directory and then create it using the /home/jovyan/conda_environments/Create_OSL_Conda_Environments.ipynb notebook.

* If dependency conflicts prevent you from installing the software needed to run all your notebooks in a single environment, you will need to create multiple conda environments to run different notebooks.

### Set the Notebook Metadata to Use the Correct Environment

* Open your notebook, change into your conda environment's kernel, and save the notebook.
* Push the update to your notebook repo.
* When students pull in your notebook repo, the notebooks will automatically run the correct kernel with no intervention (as long as the required environment has been created).

### Clear Your Notebook Output Before Saving it

* Saving a notebook with output in place increases it's file size substantially and slows down the time it takes to load.
* [Restart your kernel and clear the notebook output](restarting_server_and_kernel.md) before saving and pushing notebooks to your repo. 

### Keep your Conda Environment Up to Date

* Libraries and packages installed in your conda environment will be updated over time. If you are using a conda environment used for a previous class or training, test it first to confirm that it still builds properly. 

### Test Notebooks Ahead of Time.

* If there are assignment sections requiring students to code or refactor code, test the notebook with the correct solutions in place. This will alert you to potential problems which you may not otherwise notice.
    * Example: The notebook runs the provided code successfully but when the student adds code needed to complete an assignment, there is not enough memory and the kernel crashes.

### Plan for Students with Poor Internet Access

* File sizes for run notebooks containing a lot of output can be quite large. Users with slow internet connections may have difficulty saving notebooks in this state. It can be risky to require that students submit assignments in the form of pre-run notebooks with output in place. Some students may simply not be able to save and turn in their work.

    * Consider allowing assignments to be turned in as screenshots pasted into a Word or Google doc and saved as a pdf.
    * Consider splitting assignments into 2 notebooks, one with content/examples and another for the assignment. Pass all needed data structures from the content notebook to the assignment notebook using a [Python pickle](https://docs.python.org/3/library/pickle.html).
    
### Avoid Changing Directories in Your Code

* Why?
    * Jupyter Notebook code cells can be run out of sequence. Users can skip over cells or double back and re-run cells. If you create and change into a directory like `some/other/path` in a code cell and it then gets re-run, you will end up in an unexpected directory like `some/other/path/some/other/path`. If you run it a 3rd time, you will end up in `some/other/path/some/other/path/some/other/path`. This will cause breaking code and a lot of confusion for students.
    
* Where possible, don't change directories and just provide the absolute path to functions that need it.

* If you are running a script that requires you to be in a particular working directory, use a context manager to handle directory changes. Write a function like this:

```python
import contextlib
@contextlib.contextmanager
def work_dir(work_pth):
  cwd = Path.cwd()
  os.chdir(work_pth)
  try:
      yield
  finally:
      os.chdir(cwd)
``` 

Then, call it like this:

```python
with work_dir(work_pth):
  !python my_script.py  
```
  
This will change to the correct working directory, call the script, and then change back to the original directory.
  
  

    

    