\name{simdata}
\alias{simdata}
\docType{data}
\title{
Simulated Data for a System of Structural Equations
}
\description{
There are 100 observations sampled from a system of structural equations, which includes 10 endogenous variables and 10 exogenous variables. Each endogenous variables are directly affected by three unique exogenous variables.
}
\usage{data("simdata")}
\format{
  A list with two data frames and one list.
  \describe{
    \item{\code{y}}{ values of 10 endogenous variables.}
    \item{\code{x}}{ values of 10 exogenous variables.}
    \item{\code{sk}}{ a list of indices indicating the unique exogenous variables for each endogenous variable.}
  }
}
\examples{
data(simdata)
summary(simdata)
attach(simdata)
#simsem <- fitsem(y=y,x=x,sk=sk)
}
\keyword{datasets}
