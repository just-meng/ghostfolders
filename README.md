# Project title
Meng's PhD project on the effects of psychedelics on cortical circuits in vivo.

## Abstract

## Contributors

- Jiameng Wu, jiameng.wu@gmail.com, https://orcid.org/0000-0002-6266-7666
- Timothy Zolnik

## List of experiments

- Preliminary_Psychedelics: Preliminary experiment conducted in March-April 2022 using prism-assisted 2-photon imaging with pan-neuronal expression of GCaMP6s to simultaneously record the calcium signal from
	- neurons of different layers
	- soma and dendrite of the same neurons (L5PN)
- Psychedelics_L5b: Calcium imaging of sparsely labeled L5b neurons in Sim-Cre mice with the goal to simultaneously observe somatic and dendritic activity

## List of datasets

This repository is the central place for the project. Data-management is done with [Datalad](https://www.datalad.org/) following the [YODA](http://handbook.datalad.org/en/latest/basics/101-127-yoda.html) principle. Datasets of different experiment, modality, and processing stage are treated as independent subdatasets. Collections of code used for a particular analysis are also treated as independent subdatasets.  

The naming convention is ##_Exp_Name_datatype with two trailing digits indicating the order of experiment, followed by the name of experiment starting with capital letter, and the datatype in lower-case.
- 01_data/01_raw_data/01_Preliminary_Psychedelics_2p (source: scanimage-pc, remote: gin)
- 01_data/01_raw_data/01_Preliminary_Psychedelics_bpod (source: analysis-pc, remote: none)
- 01_data/01_raw_data/02_Psychedelics_L5b_2p (source: scanimage-pc, remote: gin)
- 01_data/01_raw_data/02_Psychedelics_L5b_bpod (source: laser-pc, remote: gin)
- 01_data/02_preprocessed_data/01_Preliminary_Psychedelics_suite2p (source: gin, remote: gin)
- 01_data/02_preprocessed_data/02_Psychedelics_L5b_suite2p
- 01_data/03_combined_data/01_Preliminary_Psychedelics_pandas (source: analysis-pc, remote:none)
- 01_data/03_combined_data/02_Psychedelics_L5b_pandas
- 02_code/01_prism_somata (source:analysis-pc, remote:none)
- 02_code/02_prism_somatodendritic

## Other information
