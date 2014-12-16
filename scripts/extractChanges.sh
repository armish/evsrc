#!/bin/bash

for i in `git ls-files`; do
	git log --pretty="$i%x09modified-in%x09%H" --follow -- $i
done
