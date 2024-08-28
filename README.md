# HPC

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

## Partitions


## Hardware

During the Fall of 2023, we upgraded the cluster with more and newer compute resources. This upgrade is part of a new 4-year cycle, and it came online in late January 2024.

The older Intel partition configuration consists of 88 compute nodes with 3520 total CPU cores (40 cores per node), 20736 GB total RAM, and 12 NVIDIA V100 GPUs.

The new AMD partition configuration consists of 32 nodes with 6144 total CPU cores (192 cores per node), 27648 GB total RAM, and 8 A100 GPUs.

Overall, the cluster has 120 compute nodes with 9152 cores, 48384 GB total RAM, and 20 GPUs.

Intel Processors

- Intel Thin: 78 PowerEdge C6420 dual socket Intel Skylake Gold 6148 compute nodes with 192 GB DDR4 RAM and EDR Infiniband.
- NVIDIA GPU with Intel processors: 6 PowerEdge R740 dual socket Intel Skylake Gold 6148 GPU nodes with 192 GB DDR4 RAM, 2 x NVIDIA V100 GPU and EDR Infiniband - 5120 GPU cores/V100, 10240 GPU cores/GPU node
- Intel Fat: 2 PowerEdge R740 dual socket Intel Skylake Gold 6148 Fat Memory Nodes with 768 GB DDR4 RAM and EDR Infiniband
- Intel Large Fat: 2 PowerEdge R740 dual socket Intel Skylake Gold 6148 Nodes with 1.5 TB DDR4 RAM and EDR Infiniband

AMD Processors (new)

- AMD Thin: 24 PowerEdge R7625 dual socket AMD Epyc Genoa 9654 compute nodes with 768 GB DDR5 RAM and HDR100 Infiniband.
- NVIDIA GPU with AMD processors: 4 PowerEdge R7625 dual socket AMD Epyc Genoa 9354 compute nodes with 768 GB DDR5 RAM, 2 x NVIDIA A100 GPU and HDR100 Infiniband.
- AMD Fat: 4 PowerEdge R7625 dual socket AMD Epyc Genoa 9654 compute nodes with 1.5 TB DDR5 RAM and HDR100 Infiniband.

Storage

- Parallel File System: Arcastream PixStor (GPFS) with 60 x 7.68 TB HDD (460.8 TB total raw storage) providing up to 7.5 GB/sec read and 5.5 GB/sec write performance, and 8 x 15.3 TB SSD (122.9 TB total raw storage) providing up to 80 GB/s read and write speeds. Total storage is 583.7 TB.

All compute nodes are connected via HDR100/EDR Infiniband (2:1 Blocking) and 1GbE for host/OOB management. Head and Login nodes are connected via HDR100 Infiniband and 10GbE for host/OOB management.
