library("igraph");
library("corpcor");


changes <- read.table("changes.sif", header=F, sep="\t", stringsAsFactors=F);
g <- graph.data.frame(changes[, c(1,3)], directed=TRUE);
adj <- as.matrix(get.adjacency(g));
files <- names(which( rowSums(adj) > 0 ));
revisions <- names(which( colSums(adj) > 0 ));

adj <- t(adj[files, revisions]);
pcors <- pcor.shrink(adj);

saveCors <- function(pcorThreshold) {
	pcorsUT <- upper.tri(pcors, diag=FALSE) * pcors;
	coupAdj <- (pcorsUT > pcorThreshold) * 1;
	if(sum(coupAdj) < 1) { return() }
	a <- names(which(rowSums(coupAdj) > 0));
	b <- names(which(colSums(coupAdj) > 0));
	ab <- union(a,b);

	coupAdj <- coupAdj[ab, ab];
	coupG <- graph.adjacency(coupAdj);

	pdf(sprintf("results/plot_%s.pdf", pcorThreshold));
	plot(coupG);
	tmp <- dev.off();

	files <- colnames(coupAdj);
	noOfFiles <- length(files);
	fileA <- c(NULL);
	fileB <- c(NULL);
	pcorValues <- c(NULL);
	for(i in 1:noOfFiles) {
		for(j in 1:i) {
			if(i == j) { next; }

			apCor <- pcors[files[i], files[j]];
			if(apCor < pcorThreshold) { next; }

			fileA <- c(fileA, files[i]);
			fileB <- c(fileB, files[j]);
			pcorValues <- c(pcorValues, apCor);
		}
	}
	pcorDF <- data.frame(FileA=fileA, pcorValues=pcorValues, FileB=fileB);
	pcorDF <- pcorDF[sort(pcorDF$pcorValues, decreasing=TRUE, index.return=TRUE)$ix, ];
	write.table(x=pcorDF, file=sprintf("results/partialCorrelations_%s.sif", pcorThreshold), sep="\t", row.names=FALSE, quote=FALSE);
}

for(threshold in c(.1, .3, .5, .7, .9)) {
	saveCors(threshold);
}
