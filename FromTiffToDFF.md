## From raw .tiff files to DF/F

1. Motion correction
Use suite2p to register all experimental sessions that have the same FOV.

```
datalad run \
-m "registration using suite2p" \
-i "230529A*/*Saline/*" \
-i "230529A*/*Ketamine/*" \
-i "230529A*/*Lisuride/*" \
-i "230529A*/*LSD/*" \
-i "230529A*/*Ket-Xyl/*" \
-o "../../02_preprocessed_data/02_Psychedelics_L5b_suite2p/230529A_Sim-Cre/Ketamine-Lisuride-LSD-Ket-Xyl-Saline" \
"python ../../../02_code/02_prism_soma_dendrite/registration.py {inputs} {outputs}"

```

2. Segmentation
I chose manual segmentation using ImageJ due to following concerns:
- unique dataset in terms of multiple compartments including soma, trunk, dendritic branches are observable simultaneously
- suite2p used to be rather bad in detecting both soma and dendrites in one go, the new "dendrite/axon" setting hasn't been tested yet
- rather few neurons but huge data due to multi-days recordings, less time-consuming to manually segment and then extract
- neurons come and go sometimes on different sessions, this might be tricky for activity based algorithms

Size of manually drawn ROIs:
- Aime et al. 2022 draws rectangles of various length, but 2 um depth along dendritic branches to calculate the signal propagation, but this would result in high-dim data in my case; they call events that spread over more than 20 um spreading events, others confiend event
- Otor et al. 2022 draws ROIs between 20-50 um more freely with no touching rectangles, also generously around the branches
- I aimed for 10 um but failed because of wrong scale (can be fixed)

Tipps and tricks:
- Suite2p registration matrix is useful to see which processes belong to one cell based on activity, provides a good visual guidance

3. Signal extraction

3. Creation of dataframes
Once the signal is extracted, a pandas dataframe is created that contains all experimental information of the recorded data.

4. Neuropil correction
- Should be done and compared with not corrected data in terms of the difference in the end result (the scientific outcome)
- FISSA is nice, but it returns F values that have the baseline 0, DF/F0 then becomes tricky to calculate; they calc F0 using the uncorrected trace which does not really convince me; not reporting DF/F0 seems to be unconventional to me

5. DF/F0 calculation
- offset correction: automatically done by scanimage
- calculation of F0: various methods available, I chose the method described in Ali et al. 2020 : 10th percentile of a sliding window of 2 min
