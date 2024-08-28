# Table of Contents

1. [hpc](#hpc)
2. [Hierarchy of Inquiry](#hierarchy-of-inquiry)
   - [Research Computing](#research-computing)
   - [GitHub Repository](#github-repository)
   - [Contact HPC Admins](#contact-hpc-admins)
3. [Partitions/Queues](#partitionsqueues)
4. [Submission Script Guide](#submission-script-guide)
   - [sbatch](#sbatch)
   - [srun](#srun)
5. [Directory Usage](#directory-usage)
6. [Hardware](#hardware)
   - [Intel Processors](#intel-processors)
   - [AMD Processors (new)](#amd-processors-new)
7. [Storage](#storage)

## hpc

This repository holds files/scripts commonly used on the HPC at the University of Memphis, and is meant to be a place where users can raise questions or concerns about HPC related issues.

## Hierarchy of Inquiry

If you have questions or concerns with the HPC, we ask that you address the following resources first.

1. Visit [Research Computing](https://uofmwiki.memphis.edu/shelves/research-computing) on the official UofM Wiki page. Note that you will have to sign in with and authenticate your UofM account. There you will find a record of guides for operating on the HPC including
    - Submitting Jobs
    - MPI
    - GPU Jobs
    - Installing Software
    - Accessing Modules
    - R
2. Review this GitHub repo to access reusable files as well as view previous issues reported by other users. Visit the [Issues](https://github.com/uofm-research-computing/hpc/issues?q=is%3Aissue) tab above to browse previous tickets. 
    - HPC Admins are responsible for adding tickets filed with the University's TopDesk system here after completion, but will accept issues files here without need of going through TopDesk.
    - Be mindful to remove the `is:open` filter to view previously closed issues.
3. If your question/concern is left unaddressed, feel free to email the HPC admins (hpc-admins@memphis.edu)

## Partitions/Queues
When submitting a job, you'll need to specify which partition your job should run in. Here are the possible queues available.
| Queue         | Number of Nodes | Memory per Node | CPU Cores per Node | Additional Notes               |
|---------------|-----------------|-----------------|--------------------|--------------------------------|
| *acomputeq*   | 16              | 768 GB          | 192                |                                |
| *awholeq*     | 8               | 768 GB          | 192                | Allocate cores in units of 192 |
| *abigmemq*    | 4               | 1.5 TB          | 192                |                                |
| *agpuq*       | 4               | 768 GB          | 192                | 2 A100 GPUs                    |
| *icomputeq*   | 40              | 192 GB          | 40                 |                                |
| *iwholeq*     | 38              | 192 GB          | 40                 | Allocate cores in units of 40  |
| *ibigmemq*    | 4               | 1.5 TB          | 40                 |                                |
| *igpuq*       | 6               | 192 GB          | 40                 | 2 V100 GPUs                    |

You can also run `sinfo -o "%P %D %m %c %G %l"` on the cluster to see similar information, though the memory is presented in MB there.

## Submission Script Guide

When you log in, you are placed on either of the login nodes (`log01`/`log02`), but running a script there takes up memory for every other user online. You must submit a script as a job to utilize the power of the cluster. 

There are two commands of submitting a job to the cluster: `sbatch` and `srun`. Below is a simple run-down of both commands. However, if we do not adequately describe what you are looking for, please visit the slurm documentaion on [sbatch](https://slurm.schedmd.com/sbatch.html).

### sbatch

You can submit jobs using the sbatch command: `sbatch jobscript.sh`. However, it’s important to ensure that your submission script (`jobscript.sh`) follows the required format. Many issues arise when users overlook this critical step. Please visit this [sample script](https://github.com/uofm-research-computing/hpc/blob/60538f2cba2066fb2f2d1dc4fe04a39a5e9a9ed5/Submission%20Scripts/General%20Slurm/submitManual.sh) that walks through the format and the many flags.

### srun

You can run commands interactively through the `srun` command (which takes many of the same options as the `sbatch` command):

```
srun --cpus-per-task=1 --mem-per-cpu=500M --partition=acomputeq --job-name=test --time=00:02:00 --pty bash
```

will launch an interactive session on one of the acomputeq nodes once one is available where commands can be written. The `--pty` option indicates that the command is interactive. Run the `exit` (`Ctrl+D`) command to quit an interactive job.

## Directory Usage 

Our system provides three main directories for your storage needs:
- **/home/$USER**: Use this directory to store reusable scripts and small files. It has a storage limit of 50 GB. Please keep in mind that this space is intended for essential files that do not take up significant storage.
- **/project/$USER**: This is where you should keep all major files generated from your jobs that you need to retain. You have up to 1 TB of space available here. Store any important data and outputs that need to be preserved for future reference.
- **/scratch/$USER**: Set this directory as the location for temporary files during job execution. It provides 10 TB of space. Be sure to clean up and delete these temporary files after your job is completed. Move any crucial files to the **/project/$USER** directory. Note that files older than 60 days in this directory will be automatically deleted.

Ensure that you manage these directories appropriately to optimize your storage usage and maintain a clean working environment.

## Modules



## Hardware

During the Fall of 2023, we upgraded the cluster with more and newer compute resources. This upgrade is part of a new 4-year cycle, and it came online in late January 2024.

The older Intel partition configuration consists of 88 compute nodes with 3520 total CPU cores (40 cores per node), 20736 GB total RAM, and 12 NVIDIA V100 GPUs.

The new AMD partition configuration consists of 32 nodes with 6144 total CPU cores (192 cores per node), 27648 GB total RAM, and 8 A100 GPUs.

Overall, the cluster has 120 compute nodes with 9152 cores, 48384 GB total RAM, and 20 GPUs.

### Intel Processors

- Intel Thin: 78 PowerEdge C6420 dual socket Intel Skylake Gold 6148 compute nodes with 192 GB DDR4 RAM and EDR Infiniband.
- NVIDIA GPU with Intel processors: 6 PowerEdge R740 dual socket Intel Skylake Gold 6148 GPU nodes with 192 GB DDR4 RAM, 2 x NVIDIA V100 GPU and EDR Infiniband - 5120 GPU cores/V100, 10240 GPU cores/GPU node
- Intel Fat: 2 PowerEdge R740 dual socket Intel Skylake Gold 6148 Fat Memory Nodes with 768 GB DDR4 RAM and EDR Infiniband
- Intel Large Fat: 2 PowerEdge R740 dual socket Intel Skylake Gold 6148 Nodes with 1.5 TB DDR4 RAM and EDR Infiniband

### AMD Processors (new)

- AMD Thin: 24 PowerEdge R7625 dual socket AMD Epyc Genoa 9654 compute nodes with 768 GB DDR5 RAM and HDR100 Infiniband.
- NVIDIA GPU with AMD processors: 4 PowerEdge R7625 dual socket AMD Epyc Genoa 9354 compute nodes with 768 GB DDR5 RAM, 2 x NVIDIA A100 GPU and HDR100 Infiniband.
- AMD Fat: 4 PowerEdge R7625 dual socket AMD Epyc Genoa 9654 compute nodes with 1.5 TB DDR5 RAM and HDR100 Infiniband.

### Storage

- Parallel File System: Arcastream PixStor (GPFS) with 60 x 7.68 TB HDD (460.8 TB total raw storage) providing up to 7.5 GB/sec read and 5.5 GB/sec write performance, and 8 x 15.3 TB SSD (122.9 TB total raw storage) providing up to 80 GB/s read and write speeds. Total storage is 583.7 TB.

All compute nodes are connected via HDR100/EDR Infiniband (2:1 Blocking) and 1GbE for host/OOB management. Head and Login nodes are connected via HDR100 Infiniband and 10GbE for host/OOB management.
