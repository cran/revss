% Copyright (c) 2020, Avraham Adler All rights reserved
% SPDX-License-Identifier: BSD-2-Clause

\name{adm}
\alias{adm}
\title{Average Distance to the Median}

\description{Compute the mean absolute deviation from the median, and (by
default) adjust by a factor for asymptotically normal consistency.}

\usage{adm(x, center = median(x), constant = sqrt(pi / 2), na.rm = FALSE)}

\arguments{
  \item{x}{A numeric vector.}
  \item{center}{The central value from which to measure the average distance.
  Defaults to the median.}
  \item{constant}{A scale factor for asymptotic normality defaulting to
  \eqn{\sqrt{\frac{\pi}{2}}}{\sqrt(\pi / 2)}.}
  \item{na.rm}{If \code{TRUE} then \code{NA} values are stripped from \code{x}
  before computation takes place.}
}

\details{
Computes the average distance, as an absolute value, between each observation
and the central observation---usually the median.  In statistical literature
this is also called the \bold{mean absolute deviation around the median}.
Unfortunately, this shares the same acronym as the median absolute deviation
(\acronym{MAD}), which is the median equivalent of this function.

General practice is to adjust the factor for asymptotically normal consistency.
In large samples this approaches \eqn{\sqrt{\frac{2}{\pi}}}{\sqrt(2 / \pi)}. The
default is to multiple the results by the reciprocal. However, it is important
to note that this asymptotic behavior may \strong{not} hold with the smaller
sample sizes for which this package is intended.

If \code{na.rm} is \code{TRUE} then \code{NA} values are stripped from \code{x}
before computation takes place. If this is not done then an \code{NA} value in
\code{x} will cause \code{mad} to return \code{NA}.
}
\value{
\deqn{ADM = C\frac{1}{n}\sum_{i=1}^n{|x_i - \textrm{center}(x)|}}{ADM =
C * mean(abs(x - center(x)))}

where \eqn{C} is the consistency constant and \code{center} defaults to
\code{median}.}
\references{
Nair, K. R. (1947) A Note on the Mean Deviation from the Median.
\emph{Biometrika}, \bold{34}, 3/4, 360--362. \doi{10.2307/2332448}
}

\author{Avraham Adler \email{Avraham.Adler@gmail.com}}
\seealso{
\code{\link[stats]{mad}} for the median absolute deviation from the
\code{\link{median}}
}
\examples{
adm(c(1:9))
x <- c(1,2,3,5,7,8)
c(adm(x), adm(x, constant = 1))
}

\keyword{univar}
\keyword{robust}
