fitsem <- function(y,x,sk,method='2SPLS')
{
  ynames <- colnames(y)
  y <- as.matrix(y)
  xnames <- colnames(x)
  x <- as.matrix(x)

  # number of rows/columns of matrices
  py <- ncol(y)
  px <- ncol(x)
  Ny <- nrow(y)
  Nx <- nrow(x)

  # Stage 1: use the ridge regression to fit each reduced-form equation
  # to obtain consisten estimates of the surrogate variables.
  lambda <- matrix(0,py,1)
  coeff <- matrix(0,px,py)
  yhat <- matrix(0,Ny,py)
  lambdaseq <- seq(0,0.1,0.001)
  for (i in 1:py) {
    fitr <- lm.ridge(y[,i]~x,lambda=lambdaseq)
    lambda[i] <- lambdaseq[which.min(fitr$GCV)] #GCV to select labmda
    coeff[,i] <- fitr$coef[,which.min(fitr$GCV)]
    yhat[,i] <- scale(x,center=T,scale=fitr$scales)%*%coeff[,i]+mean(y[,i]) #predicted values of surrogate variables
  }

  # Stage 2: use adaptive lasso to identify and estimate regulatory effects.
  hy <- matrix(0,Ny,py)
  regyidx <- list()
  coeffada <- list()
  x <- scale(x)
  y <- scale(y)
  yhat <- scale(yhat)
  for (i in 1:py) {
    xi <- x[,sk[[i]]]
    hi <- diag(Ny)-xi%*%solve(t(xi) %*% xi) %*% t(xi) #projection matrix
    hy[,i] <- hi %*% y[,i] #transformed y
    hy[,i] <- scale(hy[,i])
    hyhati <- hi %*% yhat #transformed yhat
    hyhati <- scale(hyhati)
    ada.object <- adalasso(hyhati[,-i],hy[,i],k=10)
    regyidx[[i]] <- which(!ada.object[[8]] == 0)
    regyidx[[i]][regyidx[[i]]>=i] <- regyidx[[i]][regyidx[[i]]>=i]+1 #indices of non-zero coefficients
    coeffada[[i]] <- ada.object[[8]][ada.object[[8]]!=0]  #gamma
    names(coeffada[[i]]) <- ynames[regyidx[[i]]]
  }

  # output results
  list(y.names=ynames,x.names=xnames,y.source=regyidx,y.gamma=coeffada,y.sk=sk)
}
