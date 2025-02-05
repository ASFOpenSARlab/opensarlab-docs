# Jupyter Notebook Kernels
<br>

Notebooks in OpenScienceLab run Python kernels corresponding to a variety of [conda](https://docs.conda.io/en/latest/) software environments. Since notebooks have different software dependencies, it is important to run them in an appropriate kernel.

Each ASF-developed Jupyter Book of data recipes includes a notebook that creates the required conda environment. 

At this time, we still have some Jupyter Notebooks that have not yet been organized into Jupyter Books. Each of these notebooks is pre-configured to use its required kernel. See our [Conda environments documentation](./conda_environments.md) for instructions on building those software environments.

- [How to Switch Notebook Kernels](#How-to-Switch-Notebook-Kernels)
- [Restarting a Jupyter Notebook Kernel](#Restarting-a-Jupyter-Notebook-Kernel)

---

## How to Switch Notebook Kernels

1. Click the current kernel name in the upper right corner of a notebook. 
2. A window with a list of available kernels will appear.
3. Select a `kernel`.

:::{figure} ../assets/select_kernel.gif

Changing a notebook's kernel.
:::

:::{tip} Are you missing a required kernel?

You need to build its Conda environment. Instructions are provided [here](./conda_environments.md).
:::


---

## Restarting a Jupyter Notebook Kernel

1. Click in the notebook tab to select it.
2. Select one of the following from the `Kernel` Menu:

- `Restart Kernel`: Restarts the kernel but leaves any old code cell output in place.
- **(Recommended)**`Restart Kernel and Clear All Outputs...`: Restarts the kernel and removes old code cell output. 
- `Restart Kernel and Run up to Selected Cell...`: Restarts the kernel and run up to the cell where you selected.
- `Restart Kernel and Run All Cells...`: Restarts the kernel and runs all the code cells. **This only works with notebooks that do not require user input.**

:::{tip} Restart the kernel before rerunning a notebook.

While the ability to rerun the code cells in arbitrary order can be helpful, it can also cause problems, such as:
- Recycled variables may contain unexpected values if you run cells in non-sequential order.
- You may skip cells that set required variables or perform necessary functions.
- If you change directories in a code cell and run other cells in an unexpected order, you could attempt to run code in the wrong location.
:::
