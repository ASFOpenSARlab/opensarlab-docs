# Jupyter Line and Cell Magics, and IPython Syntax

Jupyter Notebook magic commands provide shortcuts and functionality to the notebooks, above what can be done with straight Python code. An exhaustive list of magics can be found in the [IPython docs](https://ipython.readthedocs.io/en/stable/interactive/magics.html). 

While all all magics are available to users, in OpenSARlab we tend to use a relatively small selection of them. These fall into two categories: line magics and cell magics. We also frequently use Ipython's shell assignment syntax.

## IPython Shell Assignment with "!"
In IPython syntax the exclamation mark allows users to run shell commands from inside a Jupyter Notebook code cell.
Simply start a line of code with "!" and it will run the command in the shell. 

Example: "!pwd" will print the current working directory.

## Line Magics

Line magics start with a single "%" and effect only the line on which they are used. 

### %matplotlib inline
Allows **non-interactive** matplotlib plots to be displayed in a notebook.

### %matplotlib notebook
Allows **interactive** matplotlib plots to be displayed and interacted with inside of a notebook.

### %df
This is a custom magic written for OpenSARlab. It uses the python function shutil.disk_usage() to check the state of storage on user volumes. 

- "%df" returns a human readable string in GB. 
- "%df --raw" returns a raw data object
- "%df --on" returns a string in GB after every subsequent code cell is run
- "%df --off" turns "%df --on" back off
- "%df -v" prints additional debugging text 

## Cell Magics

Cell magics start with "%%" and effect the contents of an entire cell. 

### %%javascript and %%js
Runs a code cell of javascript code.

### %%capture
Runs the cell but captures all output. We typically use this to suppress the display of a matplotlib plot we do not wish to show.

