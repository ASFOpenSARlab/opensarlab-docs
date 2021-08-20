[Return to Table of Contents](../user.md)

# How to Run a Jupyter Notebook

<!--  I suggest we insert the contents of the notebook intro into running a notebook and move the running a notebook to before conda env. A person needs to know how to run a notebook before doing envs anyway.  -->
### Before we get started, what is Jupyter Notebook?
- [Intro to Jupyter Notebook](jupyter_notebook_intro.md)

## Selecting Cells
#### Select a Single Cell in Non-Edit Mode
- Click to the left of a cell

![Selected cell in non-edit mode](../assets/select_cell_non_edit_mode.png)

*A selected cell in non-edit mode is surrounded by a box with a blue left edge*

---
 
#### Select Multiple Cells in Non-Edit Mode
1. Select a cell in non-edit mode
1. Select additional cells with:
    - `Shift + J` or `Shift + Down-Arrow` to select additional cells below
    - `Shift + K` or `Shift + Up-Arrow` to select additional cells above
1. Perform batch operations on selected cells

![Multpile selected cells](../assets/select_mult_cells.png)

*Multiple selected cells are surrounded by a blue highlighted box*

---

#### Select a Code Cell in Edit Mode
- Click inside a cell

![Selected code cell in edit mode](../assets/select_cell_edit_mode.png) 

*A selected cell in non-edit mode is surrounded by a box with a green left edge*

---
 
#### Select a Markdown Cell in Edit Mode
- Double click inside a cell

![Markdown cell in edit mode](../assets/markdown_cell_edit_mode.png) 

*A markdown cell in edit mode is surrounded by a box with a green left edge*

---
 
 
## Running Cells
![Clicking the Run button to run a cell](../assets/cell_numbers.png)

*Since code cells may be run in any order, they are numbered in the order they ran.*
 
---

### Run a Single Code or Markdown Cell
#### With the Run Button
1. Select a cell in edit or non-edit mode
1. Click the Run button

![Clicking the Run button to run a cell](../assets/run_button.png)

*Click the Run button to run a selected cell*

---
 
#### With Hotkeys 
- Select a cell in edit or non-edit mode
    - `Ctrl + Enter` runs a cell
    - `Shift + Enter` runs a cell and selects the cell below
    - `Alt + Enter` runs a cell and inserts an empty cell below

### Run a Cell and every Cell Above or Below It
- Select a cell in edit or non-edit mode
    - Select `Run All Above` from the "Cell" menu
    - Select `Run All Below` from the "Cell" menu

### Run a batch of selected cells
- Select a group of cells
    - Click the `Run` Button
    - Select `Run Cells` from the "Cell" menu

### Run an Entire Notebook
- Select `Run All` from the "Cell" menu (does not restart the kernel)
- Select `Restart & Run All` from the "Kernel" Menu (restarts kernel)


### Rerunning a Notebook
It is a recommended to restart the notebook kernel before rerunning a notebook. This is because any initialized variables and data structures from a previous run will be stored in memory along with their values, which can lead to unintended results.

*Example of unintended results:* Consider a case where you have a Python list with date specific data, such as weather, stock prices, etc. If you were to append specific day's data, you would do something like `lst.append(today)`. However, running this cell more than once will yield unpredictable result due to duplication of today's data. 

*e.g.* Running this cell `n` times will result in `[day_before, yesterday, today, today, today, today, ...]`.

To restart notebook, do one of the following:

- Select `Restart` from the Kernel Menu
- Select `Restart & Clear Output` from the Kernel Menu
- Select `Restart & Run All` from the Kernel Menu

## Clearing Cell Output Before Closing
It is recommended to clear every output from each code cells prior to closing or saving a notebook. Leaving the output in place can increase file size of notebook, which will use up more of your volume and cause slower notebook loading times (especially if you have a slow internet connection).