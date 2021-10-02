# Welcome to the October 2021 OpenSARlab Upgrade!

### Changes:
- Pull in the [GEOS657_MRS repository](https://github.com/uafgeoteach/GEOS657_MRS)
- OpenSARlab documentation changes
- Add OpenSARlab documentation link to the top of every page
- Add current profile name to the top of every page

## Conda Environments

### Pull in The [GEOS657_MRS Repository](https://github.com/uafgeoteach/GEOS657_MRS)
- The GEOS_657_Labs directory has been removed from the [opnesarlab-notebooks repository](https://github.com/ASFOpenSARlab/opensarlab-notebooks) and moved into its own repository, [uafgeoteach/GEOS657_MRS](https://github.com/uafgeoteach/GEOS657_MRS)
- The notebooks in the `/home/jovyan/notebooks/ASF/GEOS_657_Labs` directory can now be found in the `/home/jovyan/GEOS_657_Labs` directory.
- If you made any changes to the notebooks in their original location, you may still see them there, but necessary scripts may be missing and you should start working out of the new location.

### OpenSARlab documentation changes
- OpenSARlab documentation is no longer being stored in `/home/jovyan/opensarlab_docs` in Jupyter Notebook form.
- There is now a link to the [OpenSARlab-docs website](https://opensarlab-docs.asf.alaska.edu/) at the top of every page in OpenSARlab.

### Add current profile name to the top of every page
- Different OpenSARlab profiles allow for varying resource allotments.
- The current profile name now appears a the top of every OpenSARlab page to serve as a reminder to the user of which profile they are running in. 