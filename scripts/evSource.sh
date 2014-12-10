#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo "-- Cloning project from the URL: $1" &&
git clone "${1}" "${2}" &&
cd ${2} &&
echo "-- Done cloning... Now extracting changes..." &&
bash $DIR/extractChanges.sh > changes.sif &&
echo "-- Done extracting changes... Now estimating partial correlations on these files..." &&
mkdir -p results &&
Rscript $DIR/plmSrc.R > log.sif &&
echo "-- Done with the calculations. Please check `pwd`/results for results." && 
cd .. ||
echo "\!\! Failed..."
