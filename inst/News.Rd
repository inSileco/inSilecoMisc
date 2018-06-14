\name{NEWS}
\title{News for Package \pkg{letiRmisc}}
\newcommand{\ghpr}{\href{https://github.com/inSileco/inSilecoMisc/pull/#1}{##1}}
\newcommand{\ghit}{\href{https://github.com/inSileco/inSilecoMisc/issues/#1}{##1}}


\section{Changes in inSileco version 0.1.2}{
  \itemize{
    \item Changes in the package structure:
    \itemize{
      \item so far, not much!
    }
    \item Addition of R functions:
    \itemize{
      \item New R function \code{loremIpsum()} to get a piece of a placeholder text.
      \item New R function \code{readYamlHeader()} to read YAML headers.
    }
    \item Changes in existing R functions:
    \itemize{
      \item so far, not much!
    }
  }
}



\section{Changes in inSileco version 0.1.1}{
  \itemize{
    \item Changes in the package structure:
    \itemize{
      \item New package name: inSileco.
    }
    \item Addition of R functions:
    \itemize{
      \item New R functions \code{findReplace()} and \code{grepReplace()}.
      \item New R functions \code{logistic()} and \code{logistic2()}.
      \item New R function \code{addWebIcon()}.
      \item New R function \code{meanAlong()}, a simple moving wondow function.
    }
    \item Changes in existing R functions:
    \itemize{
      \item New argument \code{exlude} in \code{wordCount()}.
    }
  }
}


\section{Changes in letiRmisc version 0.0.2 (21/11/2017 -- Unreleased)}{
  \itemize{
    \item Addition of R functions:
    \itemize{
      \item New R function \code{addURL()}
      \item New R function \code{findRef()}
      \item New R function \code{keepWords()}
      \item New R function \code{logit()}
      \item New R function \code{multiMatch()}
      \item New R function \code{signifSymbol()}
      \item New R function \code{strLength()}
      \item New R function \code{substrBib()}
      \item New R function \code{wordCount()} that adresses \ghit{#1}
    }
    \item Changes in the package structure:
    \itemize{
      \item bugReportURL has been changed to https://github.com/inSileco/letiRmisc/issues
    }
  }
}



\section{First version of letiRmisc version 0.0.1 (10/10/2016 -- Unreleased)}{
  \itemize{
    \item Addition of R functions:
    \itemize{
      \item New R function \code{adjustSting()}
      \item New R function \code{aggregateCol()}
      \item New R function \code{assignClass2df()}
      \item New R function \code{assignIds()}
      \item New R function \code{categorize()}
      \item New R function \code{duplicateRow()}
      \item New R function \code{findThem()}
      \item New R function \code{gaussianShape()}
      \item New R function \code{keepWords()}
      \item New R function \code{squaretize()}
    }
    \item initial package structure:
    \itemize{
      \item R man tests and vignettes folder added
      \item Description LICENSE README andfiles added
    }
  }
}
