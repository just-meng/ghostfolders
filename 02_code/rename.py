"""
Rename all files in a given directory. Run with 'datalad run' to leave the trace.

datalad run -m "Rename bpod files of mouse 230628C with the wrong date." \
-i 01_data/01_raw_data/02_Psychedelics_L5b_bpod/230628C/2023-07-28_Lisuride/pre \
python 02_code/02_prism_soma_dendrite/rename.py {inputs} "2023-07-27" "2023-07-28"
"""

import os
import argparse

parser = argparse.ArgumentParser(description="Rename all files in a given folder that match a certain expression")
parser.add_argument('inputs', nargs=3, help='-i directory -i match -i replace_by')
args = parser.parse_args()
directory = args.inputs[0]
match = args.inputs[1]
replace_by = args.inputs[2]

old_file_names = os.listdir(directory)
new_file_names = [i.replace(match, replace_by) for i in old_file_names]
[os.replace(os.path.join(directory, old), os.path.join(directory, new))
 for (old, new) in zip(old_file_names, new_file_names)]