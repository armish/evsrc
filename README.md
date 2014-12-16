# evSrc: EVolutionary SouRCe

A tool that identifies bad design choices in software development from a history of changes.
The tool, itself, is still work in progress, but you can read more about the approach from the following blog post:

[http://ergoso.me/computer/science/github/software/evolutionary/couplings/2014/12/10/evsrc-evolutionary-couplings-reveal-poor-software-design.html](http://ergoso.me/computer/science/github/software/evolutionary/couplings/2014/12/10/evsrc-evolutionary-couplings-reveal-poor-software-design.html)

# Simple use case
Make sure you have the R packages `igraph` and `corpcor` and also `git` installed on your system.
Once that is done, run the pipeline as follows:

```
bash scripts/evSource.sh addr://your/fav/git/repository /path/to/a/local/working/folder
```

and once all is done, you can collect your results from `/path/to/a/local/working/folder/results`.

# Contact
B. Arman Aksoy - [arman@aksoy.org](mailto:arman@aksoy.org)

# License
This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this program. If not, see [http://www.gnu.org/licenses/](http://www.gnu.org/licenses/).
