\version "2.26.0"

#(set-default-paper-size "letter")


\header {
  title = "Opening"
  subtitle = "from Glassworks"
  composer = "Philip Glass."
  arranger = "Alan Kydd."
}

topFA = {
    \tuplet 3/2 { f8 aes f }
  }

topAF = {
    \tuplet 3/2 { aes8 f aes }
  }

topFAcycle =
\fixed c' {
  \repeat unfold 2 {\topFA \topAF}
}

topCF = {
    \tuplet 3/2 { c'8 f c' }
  }

topFC = {
    \tuplet 3/2 { f8 c' f }
  }

topCFcycle =
\fixed c' {
  \repeat unfold 2 {\topCF \topFC}
  }

topGC = {
    \tuplet 3/2 { g8 c' g }
  }

topCG = {
    \tuplet 3/2 { c'8 g c' }
  }

topGCcycle =
\fixed c' {
  \repeat unfold 2 {\topGC \topCG}
}

topAC =
\fixed c' {
  \tuplet 3/2 { aes8 c' aes }
  \tuplet 3/2 { c'8 aes c' }
}

topDend =
\fixed c' {
  \tuplet 3/2 { aes8 c' aes }
  \tuplet 3/2 { c'8 g c' }
}

topCF_low = {
  \tuplet 3/2 { c8 f c }
}

topFC_low = {
    \tuplet 3/2 { f c8 f }
}

topCFcycle_low = {
  \fixed c' {
    \repeat unfold 2 {\topCF_low \topFC_low}
    }
}

topDF = {
  \tuplet 3/2 { d f d }
}

topFD = {
  \tuplet 3/2 { f d f }
}

topDFcycle = {
  \fixed c' {
    \repeat unfold 2 {\topDF \topFD}
    }
}

topBE = {
  \tuplet 3/2 { bes, ees bes, }
}

topEB = {
  \tuplet 3/2 { ees bes, ees }
}

topBEcycle = {
  \fixed c' {
    \repeat unfold 2 {\topBE \topEB}
    }
}

topCE = {
  \tuplet 3/2 { c ees c }
}

topEC = {
  \tuplet 3/2 { ees c ees }
}

topCEcycle = {
  \fixed c' {
    \repeat unfold 2 {\topCE \topEC}
  }
}

topDF_high = {
  \tuplet 3/2 { d' f d' }
}

topFD_high = {
  \tuplet 3/2 { f d' f }
}

topDFcycle_high = {
  \fixed c' {
    \repeat unfold 2 {\topDF_high \topFD_high}
  }
}

topAD = {
  \tuplet 3/2 { aes d' aes }
}

topDA = {
  \tuplet 3/2 { d' aes d' }
}

topADcycle = {
  \fixed c' {
    \repeat unfold 2 {\topAD \topDA}
  }
}

topAE = {
  \tuplet 3/2 { aes ees' aes }
}

topEA = {
  \tuplet 3/2 { ees' aes ees' }
}

topEAcycle = {
  \fixed c' {
    \repeat unfold 2 {\topEA \topAE}
  }
}

topDG = {
  \tuplet 3/2 { d' g d' }
}

topGD = {
  \tuplet 3/2 { g d' g }
}

topDGcycle = {
  \fixed c' {
    \repeat unfold 2 {\topDG \topGD}
  }
}

topDAcycle = {
  \fixed c' {
    \repeat unfold 2 {\topDA \topAD}
  }
}

topDB = {
  \tuplet 3/2 { d' bes d' }
}

topBD = {
  \tuplet 3/2 { bes d' bes }
}

topDBcycle = {
  \fixed c' {
    \repeat unfold 2 {\topDB \topBD}
  }
}

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
    \repeat unfold 4 {
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
  \repeat unfold 2 {
    \midBDcycle
  }
  d'1
}

bassNotes =
{
  \key c \minor
  \time 4/4

  \repeat volta 2 {
    \repeat unfold 3 {
      \fixed c {
	f1 f1 ees des
      }
    }

				% measure 13
    \fixed c { f1 f1 ees bes }

				% measure 17
    \repeat unfold 4 {
      \fixed c {
	c bes bes g 
      }
    }

				% measure 33
    \repeat unfold 2 {
      \fixed c {
	f f aes bes
      }
    }
    { f f aes bes2 aes2 }
    { g1 g f f }
  }

				% measure 49
  \repeat unfold 3 {
    \fixed c {
      f1 f1 ees des
    }
  }

				% measure 61
  \fixed c { f1 f ees bes }

				% measure 65
  \repeat unfold 4 {
    \fixed c {
      c bes bes g 
    }
  }

				% measure 81
  \repeat unfold 2 {
    \fixed c {
      f f aes bes
    }
  }
  { f f aes bes2 aes }
  { g1 g f f f }
  
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