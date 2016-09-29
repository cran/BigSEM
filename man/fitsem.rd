\name{fitsem}
\alias{fitsem}
\title{Constructing Large Systems of Structural Equations}
\description{Use the two-stage penalized least squares (2SPLS) method proposed by Chen, Zhang and Zhang (2016) to construct a large system of structural equations, with the \eqn{k}-th structural equation as \eqn{Y_k = Y_{-k}\gamma_k+X_{S_k}\psi_{S_k}+\epsilon_k.}}
\usage{fitsem(y,x,sk,method='2SPLS')}
\arguments{
    \item{y}{ a data frame containing the endogenous variables \eqn{Y_1, Y_2, ..., Y_p} in the model.}
    \item{x}{ a data frame containing the exogenous variables \eqn{X_1, X_2, ..., X_q} in the model.}
    \item{sk}{ a list with the \eqn{k}-th element specifying \eqn{S_k} which includes the indices of exogenous variables appearing in the structural equation for \eqn{k}-th endogenous variable.}
    \item{method}{ the method to be used; the default is "2SPLS".}
}
\details{
2SPLS fits a single regression model for each endogenous variable at each stage. It employs the L_2 penalty at the first stage to obtain consistent estimation of a set of well-defined surrogate variables, and the L_1 penalty at the second stage to consistently select regulatory effects among massive candidates.
}
\value{
    \item{y.names}{ the names of the endogenous variables.}
    \item{x.names}{ the names of the exogenous variables.}
    \item{y.source}{ a list with the \eqn{k}-th element indicating all endogenous variables which affect the \eqn{k}-th endogenous variable, i.e., all endogenous variables having nozero coefficients on the right-hand of the \eqn{k}-th structural equation.}
    \item{y.gamma}{ a list with \eqn{k}-th element the nonzero coefficients of \eqn{\gamma_k}.}
    \item{y.sk}{ the same as the input sk.}
}
\references{
Chen, C., Zhang, M., and Zhang, D. (2016) \emph{A Two-Stage Penalized Least Squares Method for Constructing Large Systems of Structural Equations.} (Submitted)
}
\author{Chen Chen <chen1167@stat.purdue.edu>, Dabao Zhang <zhangdb@stat.purdue.edu>.}
\seealso{
\code{\link{bootsem}} for bootstrap analysis of the fitted system of structural equations.
}
\examples{
data(simdata)
attach(simdata)
#simsem <- fitsem(y=y,x=x,sk=sk)
#summary(simsem)

# Check the exogenous variables affecting Y_1
#simsem$x.names[simsem$y.sk[[1]]]
#cat(simsem$y.names[1],'<-',simsem$x.names[sk[[1]]],'\n')

# Check the endogenous variables affecting Y_1
#simsem$y.names[simsem$y.source[[1]]]
#cat(simsem$y.names[1],'<-',simsem$y.names[simsem$y.source[[1]]],'\n')

# Check gamma_1
#simsem$y.gamma[[1]]
}
