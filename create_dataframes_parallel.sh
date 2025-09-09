set -e -u

# Jobs are set up to not require a shared filesystem (except for the lockfile)
# ------------------------------------------------------------------------------
# FIXME: Supply a RIA-URL to a RIA store that will collect all outputs, and a
# RIA-URL to a different RIA store from which the dataset will be cloned from.
# Both RIA stores will be created if they don't yet exist.
output_store="ria+file:///mnt/RawData/myoutputstore"
input_store="ria+file:///mnt/RawData/myinputstore"
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


# ------------------------------------------------------------------------------
# FIXME: Supply the name of container you have registered (see README for info)
# FIXME: Supply a path or URL to the place where your container dataset is
# located, and a path or URL to the place where an input (super)dataset exists.
containername='2p'
container="2p_analysis.sif"
data="01_data/02_preprocessed_data/02_Psychedelics_L5b_suite2p"
bpod="01_data/01_raw_data/02_Psychedelics_L5b_bpod"
script="02_code/02_prism_soma_dendrite/create_dataframe.py"
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


#-------------------------------------------------------------------------------
# FIXME: Replace this name with a dataset name of your choice.
source_ds="L5b_suite2p"
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


# Create a source dataset with all analysis components as an analysis access
# point.
datalad create -c yoda $source_ds
cd $source_ds

# clone the container-dataset as a subdataset. Please see README for
# instructions how to create a container dataset.
datalad clone -d . "${container}" code/pipeline

# Register the container in the top-level dataset.
datalad containers-add \
  -u code/pipeline \
  $containername

git config \
  -f .datalad/config \
  datalad.containers.2p.cmdexec 'singularity exec -B {{pwd}} {img} {cmd}'
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


