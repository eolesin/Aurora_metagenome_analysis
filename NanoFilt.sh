#!/bin/bash

#SBATCH --account=nn9841k
#SBATCH --job-name=nanofilt
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=5G

# load miniconda
module load Miniconda3/4.9.2

# Set the ${PS1} (needed in the source of the Anaconda environment)
export PS1=\$

# Source the conda environment setup
# The variable ${EBROOTANACONDA3} or ${EBROOTMINICONDA3}
# So use one of the following lines
# comes with the module load command
# source ${EBROOTANACONDA3}/etc/profile.d/conda.sh
source ${EBROOTMINICONDA3}/etc/profile.d/conda.sh

# Deactivate any spill-over environment from the login node
conda deactivate &>/dev/null

# Activate the environment by using the full path (not name)
# to the environment. The full path is listed if you do
# conda info --envs at the command prompt.
conda activate /cluster/projects/nn9836k/conda_envs/guppy

# Execute the python program
NanoFilt BS01_cat.fastq -l 1000 > BS01_filt.fastq
