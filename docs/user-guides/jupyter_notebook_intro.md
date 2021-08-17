[Return to Table of Contents](../user.md)

# A Light Introduction to Jupyter Notebook
[https://jupyter.org/](https://jupyter.org/)

<!-- Which Markdown docs should we introduce? -->
Jupyter Notebook is a web application that allows users to display: 

* Interactive and runnable code cells, which is typically written in [Python](https://docs.python.org/3/)
* [Markdown](https://www.markdownguide.org/) cells containing explanatory text, formulas, hyperlinks, tables, pseudocode, images, etc.

Jupyter Notebook provides an ideal format for teaching/learning coding concepts, prototyping algorithms, and collaborating on Python projects. 

<!-- prev
 Jupyter Notebook is a web application that allows users to display interactive and runnable code cells (typically written in Python) alongside markdown cells containing explanatory text, formulas, hyperlinks, tables, pseudocode, and images. Jupyter Notebook provides an ideal format for teaching/learning coding concepts, prototyping algorithms, and collaborating on Python projects.  -->

## Cells
Jupyter Notebook has 4 cell types. In OpenSARlab, we use the following two:
* Markdown cells
* Code cells
 
### Markdown Cells
---
<!-- contain docs of markdown... or able to write in markdown? -->
Markdown cells contain documentation in Markdown, HTML, and/or LaTeX. They may contain text, images, hyperlinks, formulas, tables, pseudocode, plots, figures, etc. 

-  To enter edit mode in a markdown cell, double click it.

 ![An un-run markdown cell.](../assets/markdown_cell_edit_mode.png) 

*A markdown cell in edit mode*

---

<!--  move pass what? -->
- To move past or display a markdown cell's content, run it. 
 
![A run markdown cell.](../assets/markdown_run.png)

*A run markdown cell*

---
 
### Code Cells
---
 Code cells contain editable and runnable Python code. You can run them in any order for any number of times.
 
 The ability to run/rerun code cells in arbitrary order can be helpful, but it can also cause problems. 
 
*e.g.* Recycled variables may end up with unexpected values if cells are ran in out of order sequence.

<!-- maybe use "incorrect order" instead of out-of-order  -->

 <!--prev 
 For instance, recycled variables can end up with unexpected values if cells are ran in an order not intended by a notebook's author. -->
 
 ![A code cell.](../assets/code_cell.png)

*A code cell*

---
