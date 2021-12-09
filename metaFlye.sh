#!/bin/bash

#SBATCH --account=nn9841k
#SBATCH --job-name=Flye
#SBATCH --time=8:0:0
#SBATCH --partition=bigmem
#SBATCH --ntasks=1 --cpus-per-task=10
#SBATCH --mem-per-cpu=32G
#SBATCH --output=/cluster/projects/nn9841k/MinION_metagenome/Aurora/BS01//03_METAFLYE_ASSEMBLY/metaFlye_%j.out
#SBATCH --error=/cluster/projects/nn9841k/MinION_metagenome/Aurora/BS01//03_METAFLYE_ASSEMBLY/metaFlye_%j.err
#SBATCH --get-user-env
## Recommended safety settings:

set -o errexit # Make bash exit on any error
#set -o nounset # Treat unset variables as errors

module --quiet purge  # Reset the modules to the system default

# load modules
module load Flye/2.9-GCC-10.3.0

wdir="/cluster/projects/nn9841k/MinION_metagenome/Aurora/BS01/"
#tmpdir="/cluster/work/users/nimst/tmp"

#go to your home directory, or to wherever you want to work
cd $wdir

flye -o $wdir/03_METAFLYE_ASSEMBLY --meta --nano-hq /cluster/projects/nn9841k/MinION_metagenome/Aurora/BS01/02_FILTERED_READS/BS01_filt.fastq -t 10

# Finish the script
exit 0
