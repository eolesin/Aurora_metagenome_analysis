#!/bin/bash







#SBATCH --account=nn9836k



#SBATCH --job-name=guppy



#SBATCH --output=/cluster/projects/nn9841k/MinION_metagenome/Aurora/BS01/guppy_%j.out



#SBATCH --error=/cluster/projects/nn9841k/MinION_metagenome/Aurora/BS01/guppy_%j.err



#SBATCH --time=12:00:00



#SBATCH --nodes=1



##CPU cores per task



##SBATCH --cpus-per-node=2



##GPU setup



#SBATCH --partition=accel



#SBATCH --gpus=2



#SBATCH --mem-per-gpu=8G







set -o errexit  # Exit the script on any error



set -o nounset  # Treat any unset variables as an error











export PATH=$PATH:/cluster/projects/nn9841k/software/ont-guppy/bin



export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cluster/projects/nn9841k/software/ont-guppy/lib

export LD_LIBRARY_PATH=/cluster/software/CUDA/10.2.89/lib64/stubs/

module --quiet purge  # Reset the modules to the system default



##module load CUDA/10.2.89







guppy_basecaller -i /cluster/projects/nn9836k/Aurora/BS01_Nanopore/fast5_pass -s  /cluster/projects/nn9841k/MinION_metagenome/Aurora/BS01/fastq_guppy -c /cluster/projects/nn9841k/software/ont-guppy/data/dna_r9.4.1_450bps_hac.cfg -r --records_per_fastq 0 -x cuda:all --min_qscore 9 --chunks_per_runner 1024 --chunk_size 1000 --compress_fastq
