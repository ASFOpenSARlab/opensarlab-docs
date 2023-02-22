[Return to Table of Contents](../user.md)

# Getting Started
- [A Light Introduction to Jupyter Notebook](#a-light-introduction-to-jupyter-notebook)
    - [Markdown Cells](#markdown-cells)
    - [Code Cells](#code-cells)
- [Detailed Instructions on Running Jupyter Notebook](#detailed-instructions-on-running-jupyter-notebook)
    - [Selecting Cells](#selecting-cells)
        - [Edit Mode vs Non-Edit Mode](#edit-mode-vs-non-edit-mode)
        - [Select Individual Cell (Non-Edit Mode)](#select-individual-cell-non-edit-mode)
        - [Select Multiple Cells (Non-Edit Mode)](#select-multiple-cells-non-edit-mode)
        - [Select Cell (Edit Mode)](#select-cell-edit-mode)
        - [Select a Markdown Cell (Edit Mode)](#select-a-markdown-cell-edit-mode)
    - [Running Cells](#running-cells)
        - [Run a Single Cell](#run-a-single-cell)
        - [Run Multiple Cells](#run-multiple-cells)
        - [Rerunning a Notebook](#rerunning-a-notebook)
- [Summary and Demo]()

---

<!-- # How to Run a Jupyter Notebook -->

<!--  I suggest we insert the contents of the notebook intro into running a notebook and move the running a notebook to before conda env. A person needs to know how to run a notebook before doing envs anyway.  -->

<!-- ### Before we get started, what is Jupyter Notebook?
- [Intro to Jupyter Notebook](jupyter_notebook_intro.md) -->

# A Light Introduction to Jupyter Notebook
[Jupyter Notebook](https://jupyter.org/) is a web application that allows users to display: 

* Interactive and runnable code cells, typically written in [Python](https://docs.python.org/3/)
* [Markdown](https://jupyter-notebook.readthedocs.io/en/stable/examples/Notebook/Working%20With%20Markdown%20Cells.html) cells containing explanatory text, formulas, hyperlinks, tables, pseudocode, images, etc.

Jupyter Notebook provides an ideal format for teaching/learning coding concepts, prototyping algorithms, and collaborating on Python projects. 

While Jupyter Notebook has four cell types, we use the following two for the OpenSciencelab:

## _Markdown Cells_

Markdown cells contain documentation in Markdown, HTML, and/or LaTeX. They are often used to display text, images, hyperlinks, formulas, tables, pseudocode, plots, figures, etc. 

- To enter edit mode in a markdown cell, double-click the cell.

 ![An un-run markdown cell.](../assets/markdown_cell_edit_mode.gif) 

_A markdown cell in edit mode_

If you wish to proceed through the notebook past the markdown cell or run a markdown cell's code to display its formatted contents, you can:
- Click the **play** button at the top of the notebook
- Use the `shift + enter` shortcut key.

 
![A run markdown cell.](../assets/markdown_run.gif)

*A run markdown cell*

**NB**: The cell will automatically move to the next cell if you are using the **play** button to run the cell.

## _Code Cells_

Code cells contain editable and runnable Python code. You can run them in any order for any number of times.
 
 ![A code cell.](../assets/code_cell.gif)

*A code cell*

**NB**: While the ability to rerun the code cells in arbitrary order can be helpful, it can cause unexpected problems, such as:
- Recycled variables may contain unexpected values if you run cells in non-sequential order.
- Values from previous cells may trigger a different behavior when running the same cell.

---

# Detailed Instructions on Running Jupyter Notebook

Now that users have a basic understandings of Jupyter notebook, users can use below manual as a refernce for detailed use.

## **Selecting Cells**

Users may select cells individually or in a batch; users can then run the selected cells.

### **Edit Mode vs Non-Edit Mode**
Before we discuss cell selection, it may be helpful to learn the difference between the _edit_ mode and _non-edit_ mode.

- **Edit Mode**: If you select a cell using edit mode, you may edit the code and Markdown written on that cell. You can choose the cell in the _edit_ mode by clicking inside the cell box.


- **Non-Edit Mode**: If you select the cell outside of the code/Markdown box, you will be selecting the cell in a _non-edit_ mode.

While the difference is subtle, it is crucial to know the different modes because some hotkeys are unavailable in the _edit_ mode. For instance, the `shift + j` command will allow you to select multiple cells in the _non-edit_ mode, but this does not work in the _edit_ mode.

---

### **Select Individual Cell (Non-Edit Mode)**
- Click on the left side of the cell.

![Selected individual cell](../assets/select_cell_non_edit_mode.gif)

A selected cell displays a blue horizontal line on the left edge. Markdown cell will have an additional shaded area that is directly next to the cell. For a visual example, please refer to the _hiding cells_ section.

**NB**: It is crucial to **avoid clicking** the _blue_ edge as well as the shaded area that is directly next to the cell. We will discuss this in a later section.

---
 
### **Select Multiple Cells (Non-Edit Mode)**
1. Select a cell in non-edit mode
1. Select multiple cells with:
    - `shift + j` or `shift + Down-Arrow` to select additional cells below
    - `shift + k` or `shift + Up-Arrow` to select additional cells above
1. Perform batch operations on selected cells with **play** button or with `ctrl + enter`.

![Multpile selected cells](../assets/select_mult_cells.gif)

*Selected cells will have a blue background*

---

### **Select Cell (Edit Mode)**
- Click inside a cell block.

![Selected code cell in edit mode](../assets/select_cell_edit_mode.png) 

For live demonstration, please refer to the [_code cells_](#code-cells) section.

**NB**: The edit mode cell will no longer display green edges.

---
 
### **Select a Markdown Cell (Edit Mode)**
- Double click inside a cell.

![Markdown cell in edit mode](../assets/markdown_cell_edit_mode.png) 


For live demonstration, please refer to the [_Markdown cells_](#markdown-cells) section.

**NB**: The edit mode cell will no longer display green edges.

---
 
## **Running Cells**
Because you can run code cells in any order, each cell generates a number in the order they ran.

![Clicking the Run button to run a cell](../assets/cell_numbers.png)

--- 

### **Run a Single Cell**
#### With the Run Button
1. Select any cell you wish to run. 
1. Do one of the following:
    - Click `Run` button
    - `Ctrl + Enter` to run a cell
    - `Shift + Enter` to runs a cell and selects the cell below
    - `Alt + Enter` to runs a cell and inserts an empty cell below

![Clicking the Run button to run a cell](../assets/run_cell.gif)

*Running selected cell multiple times with `ctrl + enter`*

---

### **Run Multiple Cells**

Instead of running just a single cell, you can run multiple cells at once in a following manner:

- Run every cell above/below selected cell.
- Run them in a groups of selected cell.
- Run the entire notebook

#### **Running every cell above/below:**

Select a cell, then:

- Select `Run All Above Selected Cell` from the _Run_ menu
- or select `Run Selected Cell and All Below` from the _Run_ menu


![run all above](../assets/run_above.gif)

*Running all cells above selected. Note that the selected cell is ignored.*

#### **Run a batch of selected cells**
Select a group of cells, then:
    - Use a hotkey
    - or click the run button

![run in batch](../assets/run_in_batch.gif)

*Runs a group of cells in a batch using `ctrl + enter`*
    
#### **Run an Entire Notebook**

If you wish to run the entire notebook from the get-go, you can do one of the following:

- Select _Run_ > _Run All Cells_
- Select _Run_ > _Restart Kernel and Run All Cells..._

The difference is that the former option preserves the values from the previous run while the latter lets you run from a new state—more on this in the next section.


---

### **Rerunning a Notebook**
It is a recommended to restart the notebook kernel before rerunning a notebook. This is because any initialized variables and data structures from a previous run will be stored in memory along with their values, which can lead to unintended results.

*Example of unintended results:* Consider a case where you have a Python list with date specific data, such as weather, stock prices, etc. If you were to append specific day's data, you would do something like `lst.append(today)`. However, running this cell more than once will yield unpredictable result due to duplication of today's data. 

*e.g.* Running this cell `n` times will result in `[day_before, yesterday, today, today, today, today, ...]`.

To restart notebook, do one of the following:

- Select `Restart` from the Kernel Menu
- Select `Restart & Clear Output` from the Kernel Menu
- Select `Restart & Run All` from the Kernel Menu

---

## Clearing Cell Output Before Closing
It is recommended to clear every output from each code cells prior to closing or saving a notebook. Leaving the output in place can increase file size of notebook, which will use up more of your volume and cause slower notebook loading times (especially if you have a slow internet connection).