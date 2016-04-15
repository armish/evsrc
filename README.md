# evSrc: EVolutionary SouRCe

A tool that identifies code couplings within a software project from a history of changes. Tight code couplings are particularly hard to detect [code smells](http://en.wikipedia.org/wiki/Code_smell) since the indicators are not within the code itself but in the relationship between different pieces.

The tool, itself, is still work in progress, but you can read more about the approach from the following blog post:

[http://ergoso.me/computer/science/github/software/evolutionary/couplings/2014/12/10/evsrc-evolutionary-couplings-reveal-poor-software-design.html](http://ergoso.me/computer/science/github/software/evolutionary/couplings/2014/12/10/evsrc-evolutionary-couplings-reveal-poor-software-design.html)

# Simple use case
Make sure you have the R packages `igraph` and `corpcor` and also `git` installed on your system.
Once that is done, run the pipeline as follows:

```
bash scripts/evSource.sh addr://your/fav/git/repository /path/to/a/local/working/folder
```

and once all is done, you can collect your results from `/path/to/a/local/working/folder/results`.

## Visualizing results

PDF results that are rendered with igraph are automatically generated in the results folder.

By default, correlation thresholds .1, .3, .5, .7, .9 are generated via the R script. If you receive no output, you may try smaller thresholds

Other options for visualizing the results

D3 based viewer http://pnavarrc.github.io/evsrc-visualization/dist/
Cytoscape.js viewer here http://cmdcolin.github.io/evsrc-cytoscape/

# Contact
B. Arman Aksoy - [arman@aksoy.org](mailto:arman@aksoy.org)

# License
This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this program. If not, see [http://www.gnu.org/licenses/](http://www.gnu.org/licenses/).
