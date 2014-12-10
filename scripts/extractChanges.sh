#!/bin/bash
 
for i in `git ls-files`
do 
        git log --follow -p $i |grep "^commit" |awk "{ print \"$i\tmodified-in\t\" \$2 }"
done
