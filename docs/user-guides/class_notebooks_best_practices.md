[Return to Table of Contents](../user.md)

# Developing Notebooks for Classes or Trainings: Best Practices

### Provide a Conda Environment Capable of Running the Notebooks
---

<!-- edit 1 -->
* Provide students with a conda environment that has everything they need. [Conda Environments in OpenSARlab.](conda_environments.md)

<!-- edit 2 -->
<!-- Note: broken down into multiple parts. May need to revise the objective (i.e. "Students can create new environment"-->
* Students can create new enviornment by:

    1. Distributing ```environment.yml``` file
    2. Upload ```environment.yml``` into following directory: ```/home/jovyan/conda_environments/Environment_Configs/```         
    3. Create using ```Create_OSL_Conda_Environments.ipynb``` notebook located in ```/home/jovyan/conda_environments```

<!-- edit 3 -->
<!-- Note:  Broken down into two sentences. May need to revise what user needs to do. -->
* You may encounter dependency conflicts that can prevent you from installing essential software(s) to run all of your notebooks in a single environment. In such cases, create multiple conda environments to run different notebooks.

### Set the Notebook Metadata to Use the Correct Environment
---

1. Open your notebook, change into your conda environment's kernel, and save the notebook.
2. Push the update to your notebook repo.
3. When students pull in your notebook repo, the notebooks will automatically run the correct kernel with no intervention (as long as the required environment has been created).

### Clear Your Notebook Output Before Saving it
---
<!-- edit 4 -->
<!-- Note: not sure "previous output(s)" is the right way to phrase this-->
* Saving a notebook with previous output(s) increases its file size and slows down the time it takes to load.
* [Restart your kernel and clear the notebook output](restarting_server_and_kernel.md) before saving and pushing notebooks to your repo. 

### Keep your Conda Environment Up to Date
---

* Libraries and packages installed in your conda environment will be updated over time. If you are using a conda environment that was used in a previous class or training, try re-creating it first to confirm that it still builds without any conflicts.
    * You can use the [Create_OSL_Conda_Environments](https://github.com/ASFOpenSARlab/opensarlab-envs/blob/main/Create_OSL_Conda_Environments.ipynb) in OpenSARlab to create them, which is located in the `/home/jovyan/conda_environments/` directory.


### Test Notebooks Ahead of Time.
---

<!-- edit 5 -->
<!-- Note: Previous statement ("in place") was ambigious, hence replaced with "first". Confirm if this is what the initial author intended to do -->
* If there are assignment sections requiring students to write or refactor code, test the notebook with the correct solutions first. This will alert you for potential issues that you may miss otherwise.
    * Example: The notebook successfuly runs the provided code during initial run, but it may crash the kernel due to insufficient memory when student adds new code to complete the assignment. 
    <!-- * Example: The notebook runs the provided code successfully at first, but when student adds code needed to complete an assignment, there is not enough memory and the kernel crashes. -->

### Plan for Students with Poor Internet Access
---

<!-- edit 6 - first bullet point needs revision as it lacks why having a poor internet access is a risk-->
* Saving a notebook without clearing its output first will increase the file size substantially. It is risky for students to submit an assignments by running a notebook, saving its result, and submitting afterwards since some students may not have a strong internet connection to save and turn in their work in this manner.

To avoid issues related to poor internet access, consider following options:

* Allow assignments to be turned in as screenshots pasted into a Word,Google doc, etc. and conveted in pdf.

* Split assignments into 2 notebooks: one for content/examples and another one for assignment. Pass required data structures from the content notebook to the assignment notebook using a [Python pickle](https://docs.python.org/3/library/pickle.html).
    
### Avoid Changing Directories in Your Code
---

<!-- edit 7 - first example could be improved with code example rather than verbally expalining them.-->
* Why?
    * Jupyter Notebook code cells can run its code in out of order. Users can skip over cells and/or re-run previous cells, which can cause unexpected problems. 
        * For example: Consider a 2 line code that creates ```some/other/path``` and then goes into that directy. If this code gets re-run, you may end up doing same operation over and over with following result: `some/other/path/some/other/path/some/other/path/...`. This will cause breaking code and a confusion for students.
    
* If possible, don't change directories. Instead, provide absolute paths to functions that need them.

* If you are running a script that requires you to be in a particular working directory, use a context manager to handle directory changes. This will allow you to change to the correct working directory, call the script, and then change back to the original directory.
    * For context manager, write a following function first:

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

* Then, call it using `with` keyword:

```python
with work_dir(work_pth):
  !python my_script.py  
```

  
  

    

    