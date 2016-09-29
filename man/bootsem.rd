\name{bootsem}
\alias{bootsem}
\title{Bootstrap Analysis of the Fitted System of Structural Equations}
\description{Use the bootstrap data sets to evaluate the significance of regulatory effects in the fitted large system of structural equations by the two-stage penalized least squares (2SPLS) method proposed by Chen, Zhang and Zhang (2016).}
\usage{bootsem(y,x,sk,nboots=100)}
\arguments{
    \item{y}{ a data frame containing the endogenous variables \eqn{Y_1, Y_2, ..., Y_p} in the model.}
    \item{x}{ a data frame containing the exogenous variables \eqn{X_1, X_2, ..., X_q} in the model.}
    \item{sk}{ a list with the \eqn{k}-th element specifying \eqn{S_k} which includes the indices of exogenous variables appearing in the structural equation for \eqn{k}-th endogenous variable.}
    \item{nboots}{ number of the bootstrap datasets.}
}
\details{
Generate the bootstrap data sets by randomly sampling from the original data with replacement, and apply 2SPLS to each bootstrap data set to infer the regulatory effects.
}
\value{
    \item{boot.target}{ the index of target variable.}
    \item{boot.source}{ the index of source variable.}
    \item{boot.freq}{ the bootstrap frequency of the regulatory effect.}
    \item{boot.mean}{ the mean of the regulatory effect.}
    \item{boot.sd}{ the standard deviation of the regulatory effects.}
}
\references{
Chen, C., Zhang, M., and Zhang, D. (2016) \emph{A Two-Stage Penalized Least Squares Method for Constructing Large Systems of Structural Equations.} (Submitted)
}
\author{Chen Chen <chen1167@stat.purdue.edu>, Dabao Zhang <zhangdb@stat.purdue.edu>.}
\seealso{
\code{\link{fitsem}} for constructing large systems of structural equations.
}
\examples{
data(simdata)
attach(simdata)
#simsem <- fitsem(y=y,x=x,sk=sk)
#btres <- bootsem(y,x,sk,nboots=200)
#summary(btres)
}
