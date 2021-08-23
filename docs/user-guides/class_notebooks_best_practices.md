[Return to Table of Contents](../user.md)

# Developing Notebooks for Classes or Trainings: Best Practices

### Provide a Conda Environment Capable of Running the Notebooks
---

- Provide students with a conda environment that has everything they need. [Conda Environments in OpenSARlab.](conda_environments.md)

<!--  Typo: can mimic instructor's enviornment (sic)  -->
- Students can mimic instructor's environment by:

    1. Distributing ```environment.yml``` file
    1. Upload ```environment.yml``` into following directory: ```/home/jovyan/conda_environments/Environment_Configs/```         
    1. Create using ```Create_OSL_Conda_Environments.ipynb``` notebook located in ```/home/jovyan/conda_environments```

- You may encounter dependency conflicts that can prevent you from installing essential software to run all of your notebooks in a single environment. In such cases, create multiple conda environments to run different notebooks.

### Set the Notebook Metadata to Use the Correct Environment
---

1. Open your notebook, change into your conda environment's kernel, and save the notebook.
1. Push the update to your notebook repo.
1. When students pull in your notebook repo, the notebooks will automatically run the correct kernel with no intervention (as long as the required environment has been created).

### Clear Your Notebook Output Before Saving it
---
- Saving a notebook with previous output(s) <!--displayed--> increases its file size and slows down the time it takes to load.
- [Restart your kernel and clear the notebook output](restarting_server_and_kernel.md) before saving and pushing notebooks to your repo. 

### Keep your Conda Environment Up to Date
---

- Libraries and packages installed in your conda environment will be updated over time. If you are using a conda environment that was used in a previous class or training, try re-creating it first to confirm that it still builds without any conflicts.
    - You can use the [Create_OSL_Conda_Environments notebook](https://github.com/ASFOpenSARlab/opensarlab-envs/blob/main/Create_OSL_Conda_Environments.ipynb) in OpenSARlab to create them, which is located in the `/home/jovyan/conda_environments/` directory.


### Test Notebooks Ahead of Time.
---

- If there are assignment sections requiring students to write or refactor code, test the notebook with the correct solutions first. This will alert you to potential issues that you may miss otherwise.
    - *Example:* The notebook successfuly runs the instructor provided code, but crashes the kernel due to insufficient memory when students add new code to complete the assignment. 

### Plan for Students with Poor Internet Access
---

<!-- - Saving a notebook without clearing its output first will increase the file size substantially. It is risky for students to submit assignments by running notebooks, saving their results, and submitting them afterwards. Students without a strong internet connection may not be able to save and turn in their work in this manner. -->
- Saving a notebook without clearing its output first will increase the file size substantially. 
- If notebooks are too big and students have poor internet connections, the notebook autosave functionality may fail.
- Due to above reasons, it is risky for students to submit their assignments by running notebooks, saving their results, and submitting them afterwards. Students without a strong internet connection may not be able to save and turn in their work in this manner.

To avoid issues related to poor internet access, consider following options:

<!-- Plan for Students with Poor Internet Access. I think another bullet should be added explaining that if notebooks are too big and there is poor internet, the notebook autosave function might fail.   -->

- Allow assignments to be turned in as screenshots pasted into a word processor and converted into pdf.

- Split assignments into 2 notebooks: one for content/examples and another one for assignment. Pass required data structures from the content notebook to the assignment notebook using a [Python pickle](https://docs.python.org/3/library/pickle.html).
    
### Avoid Changing Directories in Your Code
---

- Why?
    - Users can run Jupyter Notebook code cells in any order. Users can skip over cells and/or re-run previous cells, which can cause unexpected problems. 
        - *Example:* Consider a Python list that contain a data specific to each day (e.g. temperature, stock price, etc.). To store today's data, you can use `lst.append(todays_data)`. However, you may end with duplicate data in your list if you run this code multiple times since previous output is preserved and thus you are appending `todays_data` multiple times. This may result in breaking code and/or a confusion for students.
    
<!-- screenshot here if necessary -->
    
- If possible, don't change directories. Instead, provide absolute paths to functions that need them.

- If you are running a script that requires you to be in a particular working directory, use a context manager to handle directory changes. This will allow you to change to the correct working directory, call the script, and then change back to the original directory.
    - For context manager, write a following function first:

<!--  The path decorator example should include a from pathlib import Path -->

```python
import contextlib
from pathlib import Path

@contextlib.contextmanager
def work_dir(work_pth):
  cwd = Path.cwd()
  os.chdir(work_pth)
  try:
      yield
  finally:
      os.chdir(cwd)
``` 

- Then, call it using `with` keyword:

```python
with work_dir(work_pth):
  !python my_script.py  
```