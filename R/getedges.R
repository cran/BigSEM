getedges<- function(fsObj)
{
  etarget <- NULL
  esource <- NULL
  eweight <- 1

  py <- length(fsObj$y.names)
  nedges <- 0
  for( j in 1:py )
  {
    nce <- length(fsObj$y.source[[j]])
    if (nce!=0)
    {
      etarget[(nedges+1):(nedges+nce)] <- j
      esource[(nedges+1):(nedges+nce)] <- fsObj$y.source[[j]]
      eweight[(nedges+1):(nedges+nce)] <- fsObj$y.gamma[[j]]
      nedges=nedges+nce
    }
  }
  if( is.null(fsObj$y.gamma) )
    edges <- data.frame(target=etarget,source=esource)
  else
    edges <- data.frame(target=etarget,source=esource,weight=eweight)

  edges
}
