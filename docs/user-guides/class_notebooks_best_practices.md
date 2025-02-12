# Notebook Development Best Practices
<br>

## Provide a Conda Environment Capable of Running the Notebooks

- Include an `environment.yml` in your GitHub repository that can be used to build a Conda environment that supports the notebook.
- Learn how to [Install software in a lab](software.md).

---

## Provide a Pinned `environment.yml` to Build a Conda Environment

The open-source Python packages used in your Conda environments are routinely updated, often introducing breaking dependencies. If the `environment.yml` file does not pin packages to specific versions, the default behavior is to build the latest available versions. This can introduce new dependency conflicts at any time. 

Even if you pin every package, there is still a risk that an `environment.yml` will no longer build correctly at some point. This can occur if one of its package versions is removed due to a security risk, legal issue, or the discovery of a critical error, though this is relatively rare.

### To reduce the chances of your `environment.yml` breaking over time, provide a pinned version to your users:
1. Open a terminal.
2. Create the conda environment if it does not yet exist.
3. Run the command `mamba env export -n your_environement_name > environement.yml`
4. Open the newly created `environment.yml` in a text editor.
5. Remove the `prefix` line at the bottom of the file
    - `prefix` is the path to the environment on your system, which will likely differ between users.
6. Save the file.
7. Push the file to your notebook repository.  

---

## Set The Notebook Metadata to Use the Correct Environment

1. Open your notebook, change into your conda environment's kernel, and save the notebook.
1. Push the update to your notebook repository.
1. When users clone your repository, the notebooks will automatically use the correct kernel (as long as the required environment has been created).

---

## Consider Clearing Your Notebook Output Before Saving It, Or Not

Saving a notebook with its output increases the file size and slows down the time it takes to open, save, and download. This can cause difficulty for users accessing a JupyterHub over a weak internet connection.

However, saving a notebook with its output in place has benefits. It allows you to display results without running the notebook. They are also visible on GitHub.

### If you wish to clear the notebook output:
1. Open the notebook.
2. Select the menu option: `Kernel` -> `Restart Kernel and Clear...`
3. Save the notebook.
4. Push the cleared notebook to its repository.

---

## Test Notebooks Ahead of Time.

- If there are assignment sections requiring students to write or refactor code, test the notebook with the correct solutions. This will alert you to potential issues that you may miss otherwise.

:::{tip} Example

A notebook successfully runs the instructor-provided code cells but crashes the kernel due to insufficient memory when students add new code required to complete the assignment. 
:::

---

## Plan for Students with Poor Internet Access

- Saving a notebook without clearing its output first will increase the file size substantially. 
- If notebooks are too big and students have poor internet connections, the notebook autosave functionality may fail.
- Students without a strong internet connection may not be able to save a completed notebook and turn it in with the output in place.

### To avoid these issues, consider allowing students to turn in work with one of the following options:
1. Print the notebook as a PDF by selecting `Print...` from the `File` menu.
2. Screenshot relevant portions of the notebook and paste them into a word processor.
    
---
    
## Avoid Changing Directories in a Notebook

### Why?
- Users can run Jupyter Notebook code cells any number of times and in any order. If a code cell changes directories, there is no way to guarantee that the user will run it in the expected order, which can lead to unexpected behavior.

:::{tip} Example (Don't do this)

Consider a code cell that creates a new directory, changes into it, and outputs a new file:
```Python
dir_name = "my_dir" # define directory name
os.mkdir(dir_name) # create the directory
os.chdir(dir_name) # move into the directory
!touch "my_file.txt"
```

If a user reruns this code cell three times, they will end up with three nested "my_dir" directories, each containing a "my_file.txt" file. 

If the cell includes code that downloads data, it can quickly overrun a user's available storage with duplicate datasets.
:::
    

### How do I avoid changing directories in my notebook?
- Don't change directories. Instead, use absolute paths or paths relative to the notebook's directory.
- If you are running a script that requires you to be in a particular working directory, use a context manager to handle directory changes. This will allow you to change to the correct working directory, call the script, and then change back to the original directory.


    :::{note} Example 
    
    **Write a context manager to temporarily change directories when providing an absolute or relative path is not an option**
    
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
    
    **Call the context manager using the `with` keyword:**
    
    ```python
    with work_dir("my_dir"):
      !python my_script.py  
    ```
    :::

## Provide a Path to Seek Help and Report Issues

- Link to the notebook repository's GitHub Issues page.
- Link to a class messaging app.
- Link to your organization's user support resources.

## Define Terms of Service

- Provide details about how and when support for a notebook will be discontinued.