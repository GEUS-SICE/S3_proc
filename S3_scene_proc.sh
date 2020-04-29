#!/usr/bin/env bash

# Wrapper for running SICE pipeline

set -o errexit
set -o nounset
set -o pipefail
set -x

red='\033[0;31m'; orange='\033[0;33m'; green='\033[0;32m'; nc='\033[0m' # No Color
log_info() { echo -e "${green}[$(date --iso-8601=seconds)] [INFO] ${@}${nc}"; }
log_warn() { echo -e "${orange}[$(date --iso-8601=seconds)] [WARN] ${@}${nc}"; }
log_err() { echo -e "${red}[$(date --iso-8601=seconds)] [ERR] ${@}${nc}" 1>&2; }

### dev
 SEN3_source=./SEN3/Cook_OLCI_scenes
 proc_root=./out/Cook_OLCI_scenes

LD_LIBRARY_PATH=. # SNAP requirement

# SNAP: Reproject, calculate reflectance, extract bands, etc.
./S3_proc.sh -i ${SEN3_source} -o ${proc_root} -X S3.xml -t


    
