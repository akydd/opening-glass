\version "2.26.0"

\include "functions.ily"

#(set-default-paper-size "letter")


\header {
  title = "Opening"
  subtitle = "from Glassworks"
  composer = "Philip Glass."
  arranger = "Alan Kydd."
}


topFAcycle = \cycle f aes
topCFcycle = \cycle c' f
topGCcycle = \cycle g c'

topAC =
\fixed c' {
  \triplet-pair aes c'
}

topDend =
\fixed c' {
  \triplet aes c'
  \triplet c' g
}

topCFcycle_low = \cycle c f
topDFcycle = \cycle d f
topBEcycle = \cycle bes, ees
topCEcycle = \cycle c ees
topDFcycle_high = \cycle d' f
topADcycle = \cycle aes d'
topEAcycle = \cycle ees' aes
topDGcycle = \cycle d' g
topDAcycle = \cycle d' aes
topDBcycle = \cycle d' bes

topNotes =
{
  \key c \minor
  \time 4/4

  \repeat volta 2 {
    \mf\topFAcycle
    \<\topCFcycle\!
    \topGCcycle
    \>\topAC
    \topDend\!
	  
    \repeat unfold 2 {
      \topFAcycle
      \<\topCFcycle\!
      \topGCcycle
      \>\topAC
      \topDend\!
    }

    \topFAcycle
    \<\topCFcycle\!
    \topGCcycle
    \topGCcycle

				% measure 17
    \repeat unfold 3 {
      \<\topCFcycle_low\!
      \topDFcycle
      \topBEcycle
      \>\topCEcycle\!
    }

    \<\topCFcycle_low\!
    \topDFcycle
    \topBEcycle
    \>\topBEcycle\!

				% measure 33
    \repeat unfold 3 {
      \topDFcycle_high
      \topADcycle
      \topEAcycle
      \topEAcycle
    }

    \repeat unfold 2 {
      \topDGcycle
    }

    \topDAcycle
    \topDBcycle
  }

				% measyre 49
  \repeat unfold 3 {
    \topFAcycle
    \topCFcycle
    \topGCcycle
    \topAC
    \topDend
  }

  \topFAcycle
  \topCFcycle
  \topGCcycle
  \topGCcycle

				% measure 65
  \repeat unfold 3 {
    \topCFcycle_low
    \topDFcycle
    \topBEcycle
    \topCEcycle
  }

  \topCFcycle_low
  \topDFcycle
  \topBEcycle
  \topBEcycle

				% measure 81
  \repeat unfold 3 {
    \topDFcycle_high
    \topADcycle
    \topEAcycle
    \topEAcycle
  }

				% measure 93
  \repeat unfold 2 {
    \topDGcycle
  }

  \topDAcycle
  \topDBcycle
  { bes'1 }
}

% Each of the mid cycles are 2 measures long.

midAC = { aes,8 c }

midGB = { g8 bes }

midACcycle =
\fixed c' {
  \repeat unfold 8 { \midAC }
}

midGBcycle =
\fixed c {
  \repeat unfold 8 { \midGB }
}

midFA = { f8 aes }

midFAcycle =
\fixed c {
  \repeat unfold 8 { \midFA }
}

midEG = { ees8 g }

midEGcycle =
\fixed c {
  \repeat unfold 8 { \midEG }
}

midBD = { bes8 d' }

midBDcycle =
\fixed c {
  \repeat unfold 8 { \midBD }
}

midCE = { c8 ees }

midCEcycle =
\fixed c' {
  \repeat unfold 8 { \midCE }
}

midNotes =
{
  \key c \minor
  \time 4/4

  \repeat volta 2 {
    \mf\midACcycle
    \midGBcycle
	  
    \repeat unfold 3 {
      \midACcycle
      \midGBcycle
    }

    \repeat unfold 4 {
      \midFAcycle
      \midEGcycle
    }

    \repeat unfold 3 {
      \midBDcycle
      \midCEcycle
    }
    \repeat unfold 2 {
      \midBDcycle
    } 
  }

				% measure 49
  \repeat unfold 4 {
    \midACcycle
    \midGBcycle
  }

				% measure 65
  \repeat unfold 4 {
    \midFAcycle
    \midEGcycle
  }

				% measure  81
  \repeat unfold 3 {
    \midBDcycle
    \midCEcycle
  }

    \midBDcycle
    \midBDcycle~ d'1
}

bassNotes =
{
  \key c \minor
  \time 4/4

  \repeat volta 2 {
    \fixed c {
      f1\mf~ 1\< ees\! des\> <>\!
    }
    \repeat unfold 2 {
      \fixed c {
	f1\~ 1\< ees\! des\> <>\!
      }
    }

				% measure 13
    \fixed c { f1\!~ 1 ees bes }

				% measure 17
    \repeat unfold 4 {
      \fixed c {
	c bes bes g 
      }
    }

				% measure 33
    \repeat unfold 2 {
      \fixed c {
	f~ 1 aes bes
      }
    }
    { f~ 1 aes bes2 aes2 }
    { g1~ 1 f~ 1 }
  }

				% measure 49
  \repeat unfold 3 {
    \fixed c {
      f1~ 1 ees des
    }
  }

				% measure 61
  \fixed c { f1~ 1 ees bes }

				% measure 65
  \repeat unfold 4 {
    \fixed c {
      c bes bes g 
    }
  }

				% measure 81
  \repeat unfold 2 {
    \fixed c {
      f~ 1 aes bes
    }
  }
  { f~ 1 aes bes2 aes }
  { g1~ 1 f~ 1~ 1 }
  
}

\score {
  <<
    \new Staff \with {
      instrumentName = "Guitar 1 "
    } {\topNotes}
    \new Staff \with {
      instrumentName = "Guitar 2 "
    } {\midNotes}
    \new Staff \with {
      instrumentName = "Guitar 3 "
    } {\bassNotes}
  >>
}