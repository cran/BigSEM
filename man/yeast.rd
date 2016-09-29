\name{yeast}
\alias{yeast}
\docType{data}
\title{
Yeast Genetical Genomics Data
}
\description{
A set of data from a genetical genomics experiment on yeast, including 112 observations on 722 gene expression levels and 732 genotypic values.
}
\usage{data("yeast")}
\format{
  A list with two data frames and one list.
  \describe{
    \item{\code{geneexp}}{ expression levels of of 722 genes.}
    \item{\code{snps}}{ genotypic values of 732 SNPs.}
    \item{\code{ciseqtl}}{ a list of the indices of cis-eQTL for each gene.}
  }
}
\details{
The experiment included 112 segregants from a cross between two strains BY4716 and RM11-la (Brem and Kruglyak, 2005). The data here only keep 722 genes which have marginally significant cis-eQTL (p-value < 0.05). The set of cis-eQTL for each gene was filtered to control a pairwise correlation under 0.90, and then further filtered to keep up to three cis-eQTL which have the strongest association with the corresponding gene expression.
}
\source{
Brem, R. B. and Kruglyak, L. (2005) \emph{The landscape of genetic complexity across 5,700 gene expression traits in yeast.} Proceedings of the National Academy of Sciences of the United States of America, 102(5):1572-1577.
}
\references{
Chen, C., Zhang, M., and Zhang, D. (2016) \emph{A Two-Stage Penalized Least Squares Method for Constructing Large Systems of Structural Equations.} (Submitted)
}
\examples{
data(yeast)
summary(yeast)
attach(yeast)

#yeastsem <- fitsem(y=geneexp,x=snps,sk=ciseqtl)
}
\keyword{datasets}
