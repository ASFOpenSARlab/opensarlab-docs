[Return to Table of Contents](../user.md)

# **Jupyter Line and Cell Magics, and IPython Syntax**

In addition to running Python code, Jupyter Notebooks allows users to run [magic commands](https://ipython.readthedocs.io/en/stable/interactive/magics.html) with various functionality. While all magic commands are available to users, the below magic commands are used the most in the OpenScienceLab:

- [Shell Assignment Syntax](#shell-assignment-syntax)
- [Line Magics](#)
- [Cell Magics](#)

---

<!-- ## IPython Shell Assignment with `!` -->
## **Shell Assignment Syntax** 

In IPython syntax, the exclamation mark (!) allows users to run shell commands from inside a Jupyter Notebook code cell.
Simply start a line of code with `!` and it will run the command in the shell. 

*Example:* ```!pwd``` will print the current working directory.

---

## Line Magics

Line magics start with a single `%` and effect only the line on which they are used. 

Following line magics are commonly used:

### `%matplotlib inline`
- Allows **non-interactive** `matplotlib plots` to be displayed in a notebook.

### `%matplotlib notebook`
- Allows **interactive** `matplotlib plots` to be displayed and interacted with inside of a Jupyter Notebook. 

### `%df`
- This is a custom magic written specifically for OpenSARlab. It uses the python function `shutil.disk_usage()` to check the state of storage on user's volumes. 

    - `%df` returns a human readable string in GB. 
    - `%df --raw` returns a raw data object
    - `%df --on` returns a string in GB after every subsequent code cell is run
    - `%df --off` turns `%df --on` back off
    - `%df -v` prints additional debugging text 

---

## Cell Magics

Cell magics start with `%%` and effect the contents of an entire cell. 

### `%%javascript or %%js`
- Runs a JavaScript code cell. 

*Note: leave a blank line above the magic command in the beginning of the code cell.*

### `%%capture`
- Runs the cell but captures all output. We typically use this to suppress output of a `matplotlib plot` that the user does not wish to see. 