# Running Jupyter Notebooks
<br>

[Jupyter Notebooks](https://docs.jupyter.org/en/latest/) allow users to display: 

* Interactive and runnable code cells, typically written in [Python](https://docs.python.org/3/)
* [Markdown](https://jupyter-notebook.readthedocs.io/en/stable/examples/Notebook/Working%20With%20Markdown%20Cells.html) cells containing explanatory text, formulas, hyperlinks, tables, pseudocode, images, etc.

Jupyter Notebooks provide an ideal file format for teaching/learning coding concepts and prototyping algorithms. 

---

- [Notebook Cell Types](#Notebook-Cell-Types)
    - [Markdown Cells](#markdown-cells)
    - [Code Cells](#code-cells)
- [How to Run Jupyter Notebooks](#How-to-Run-Jupyter-Notebooks)
    - [Selecting Cells](#selecting-cells)
        - [Select an Individual Cell](#Select-an-Individual-Cell)
        - [Select Multiple Cells](#Select-Multiple-Cells)
    - [Hide Code Cells](#Hide-Code-Cells)
        - [Collapse an Individual Cell](#Collapse-an-Individual-Cell)
        - [Collapse Selected Cells or All Cells in a Notebook](#Collapse-Selected-Cells-or-All-Cells-in-a-Notebook)
        - [Hide Sections of Code Cells beneath a Markdown Cell](#Hide-Sections-of-Code-Cells-beneath-a-Markdown-Cell)
    - [Running Code Cells](#running-code-cells)
        - [Run a Single Code Cell](#run-a-single-code-cell)
        - [Run Multiple Code Cells](#Run-Multiple-Code-Cells)
            - [Run a batch of selected cells](#Run-a-batch-of-selected-cells)
            - [Run Every Cell Above or Below a Code Cel](#Run-Every-Cell-Above-or-Below-a-Code-Cell)
            - [Run an Entire Notebook](#Run-an-Entire-Notebook)
        - [Rerunning a Notebook](#rerunning-a-notebook)
    - [Clearing Cell Output Before Closing](#clearing-cell-output-before-closing)

---

## Notebook Cell Types

### Markdown Cells

Markdown cells contain documentation in Markdown, MyST Markdown, HTML, and/or LaTeX. They are often used to display text, images, hyperlinks, formulas, tables, pseudocode, plots, figures, etc. 

**Markdown Edit Mode**

To enter edit mode in a markdown cell, double-click the cell.

:::{figure} ../assets/markdown_cell_edit_mode.gif

Double-click on a markdown cell to enter edit mode
:::

**Markdown Display Mode**

To render a markdown cell, select it then:
- Click the **play** button at the top of the notebook

or

- Use the `shift + enter` "play" shortcut.

:::{figure} ../assets/markdown_run.gif


A run markdown cell
:::


### Code Cells

Code cells contain editable and runnable Python code. You can run them sequentially or in any order, once or any number of times.
 
:::{figure} ../assets/code_cell.gif

Selecting and running a code cell
:::


:::{tip}

While the ability to rerun the code cells in arbitrary order can be helpful, it can also cause problems, such as:
- Recycled variables may contain unexpected values if you run cells in non-sequential order.
- You may skip cells that set required variables or perform necessary functions.
- If you change directories in a code cell and run other cells in an unexpected order, you could attempt to run code in the wrong location.
:::

---

## How to Run Jupyter Notebooks


### Selecting Cells

Users may select cells individually or in a batch, and then run the selected cells.


#### Select an Individual Cell
- Click anywhere inside a cell to select it.

:::{figure} ../assets/select_cells.gif

A selected cell displays a blue vertical line on the left edge.
:::
 
#### Select Multiple Cells
1. Select a cell **by clicking to the left of the text box**
    -  Clicking inside the cell will select it but it will place you in text edit mode and you will not be able to select additonal cells. 
1. Select additional cells using:
    - `shift + j` or `shift + Down-Arrow` to select additional cells below
    - `shift + k` or `shift + Up-Arrow` to select additional cells above
    - `shift + mouse click` to select batches of cells
1. Perform batch operations on selected cells with **`▶`** button or with `Ctrl + Enter` or `Cmd + Enter` (Mac).

:::{figure} ../assets/select_multiple_cells.gif

Selected cells will be surrounded by a blue background
:::

### Hide Code Cells

You may occasionally wish to hide code cells to reduce clutter. 

#### Collapse an Individual Cell

:::{figure} ../assets/collapse_code_cell.gif

You can hide an individual code cell by clicking the blue vertical line to the left of the code cell.
:::

#### Collapse Selected Cells or All Cells in a Notebook

- Select some code cells and choose the menu option: `View` -> `Collapse Selected Code`
- Select the menu option: `View` -> `Collapse All Code`

#### Hide Sections of Code Cells beneath a Markdown Cell

:::{figure} ../assets/collapse_cells_under_md.gif

Hide entire sections of code cells beneath a markdown cell by clicking the vertical blue bar to the left of the markdown cell.
:::

---
 
## Running Code Cells
Code cells may be executed in any order. A cell execution counter to the left of each code cell indicates the order in which the cells were run.

:::{figure} ../assets/cell_numbers.png


The cell execution counter indicates the order in which code cells have run.
:::

### Run a Single Code Cell
1. Select the cell you wish to run. 
1. Do one of the following:
    - Click the `▶` button at the top of the notebook.
    - `Ctrl + Enter` or `Cmd + Enter` (Mac) to run a cell.
    - `Shift + Enter` to run a cell and select the cell below
    - `Alt + Enter` to run a cell and insert an empty cell below


### Run Multiple Code Cells

#### Run a batch of selected cells
1. Select a group of cells.
1. Do one of the following:
    - Click the `▶` button at the top of the notebook.
    - `Ctrl + Enter` to run a cell.
    - `Shift + Enter` to run a cell and select the cell below
    - `Alt + Enter` to run a cell and insert an empty cell below


#### Run Every Cell Above or Below a Code Cell

Select a cell, then:

- Select the menu option: `Run` ->  `Run All Above Selected Cell`
- Select the menu option: `Run` -> `Run Selected Cell and All Below`

    
#### Run an Entire Notebook

If you wish to run every code cell in a notebook, you can do one of the following:

- Select the menu option: `Run` -> `Run All`
- Select the menu option: `Kernel` -> `Restart Kernel and Run All Cells...`


:::{tip} Restarting the Kernel and Rerunning vs. Simply Rerunning

Rerunning a notebook without restarting the kernel preserves previously defined local variables. This can potentially cause issues related to directory changes, paths, and variables containing unexpected values. It is generally safer to restart the kernel and rerun the notebook. 
:::

---

### Rerunning a Notebook
We recommend restarting the notebook kernel before rerunning it since any initialized variables and data structures from a previous run persist in memory along with their values, which can lead to unintended results.

To restart the kernel so you can begin a fresh notebook run use one of the following options:
- Select the menu option: `Kernel` -> `Restart Kernel`
- Select the menu option: `Kernel` -> `Restart Kernel and Clear...`

:::{tip} Clearing Notebook Output

It is easy to lose track of your position in a notebook if it contains code cell output and execution counters from a previous run. We recommend clearing any output before rerunning a notebook.  
:::
  
---

## Clearing Cell Output Before Closing

For large notebooks with a lot of plots and images, we recommend clearing all code cell output before closing or saving a notebook. Leaving the output in place can increase the file size of the notebook, which can cause slower notebook loading times (especially if you have a slow internet connection).
