bootsem <- function(y,x,sk,nboots=100)
{
  ynames <- colnames(y)
  y <- as.matrix(y)
  xnames <- colnames(x)
  x <- as.matrix(x)

  Ny <- nrow(y)

  edges <- NULL

  # generate bootstrap data sets by randomly sampling the original data with replacement,
  # and apply 2SPLS to each data set to infer the regulatory effects.
  for (n in 1:nboots){
    cat(" Bootstrap Data Set: ",n, "\n")

    idx <- sample.int(Ny,size=Ny,replace=T)
    booty <- y[idx,]
    bootx <- x[idx,]

    fit <- fitsem(booty,bootx,sk)
    edges <- rbind(edges,getedges(fit))
  }

  # calculate the bootstrap frequency, the mean, and the standard deviation of the regulatory effects
  btfreq <- aggregate(edges$weight,by=list(edges$target,edges$source),function(x) length(x)/nboots)
  btmean <- aggregate(edges$weight,by=list(edges$target,edges$source),function(x) sum(x)/nboots)
  btsd <- aggregate(edges$weight,by=list(edges$target,edges$source),function(x) sqrt(sum((x-sum(x)/nboots)^2)/(nboots-1)+(nboots-length(x))*(sum(x)/nboots)^2/(nboots-1)))
  names(btfreq) <- c("target","source","frequency")
  names(btmean) <- c("target","source","mean")
  names(btsd) <- c("target","source","sd")

  data.frame(boot.target=btfreq$target,boot.source=btfreq$source,boot.freq=btfreq$frequency,boot.mean=btmean$mean,boot.sd=btsd$sd)
}
