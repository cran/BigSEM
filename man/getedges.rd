\name{getedges}
\alias{getedges}
\title{Retrieve All the Edges from the Fitted Systems of Structural Equations}
\description{The output from \link{fitsem}, this function lists all the connects in the fitted system by the two-stage penalized least squares (2SPLS) method (Chen, Zhang and Zhang, 2016).}
\usage{getedges(fsObj)}
\arguments{
    \item{fsObj}{ a result of a call to \code{\link{fitsem}}.}
}
\details{
The output will list each connection in the fitted system in a row.
}
\value{
    \item{target}{ the indices of the target variables.}
    \item{source}{ the indices of the source variables.}
    \item{weight}{ the corresponding value in \eqn{\gamma_k} when the connect is included in the \eqn{k}-th structural equation.}
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

#edges <- getedges(simsem)

# Check the first connect
#cat(simsem$y.names[edges$target[1]], '<-', simsem$y.names[edges$source[1]],'\n')
}
