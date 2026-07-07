\version "2.26.0"

\include "functions.ily"

#(set-default-paper-size "letter")

\header {
  title = "Opening"
  subtitle = "from Glassworks"
  composer = "Philip Glass."
  arranger = "Alan Kydd."
}

top =
{
  \key c \minor
  \time 4/4
  \repeat volta 2 {
    \topSectionA f aes c' f g c' aes c' g'
				% m. 17
    \topSectionB c f d f bes, ees c ees
				% m. 33
    \topSectionC d' f aes d' ees' aes d' g
  }

				% m. 49
  \topSectionA f aes c' f g c' aes c' g'
				% m. 65
  \topSectionB c f d f bes, ees c ees
				% m. 81
  \addTie { \topSectionC d' f aes d' ees' aes' d' g }
}

mid =
{
  \key c \minor
  \time 4/4
  \repeat volta 2 {
    \midSectionA aes c' g bes
    % m. 17
    \midSectionA f aes ees g
    % m. 33
    \midSectionB bes d c e
  }

				% m. 49
  \midSectionA aes c' g bes
				% m. 65
  \midSectionA f aes ees g
				% m. 81
  \addTie { \midSectionB bes d c e }
}

bass =
{
  \key c \minor
  \time 4/4

  \repeat volta 2 {
    \bassSectionA f ees des bes
				%m. 17
    \bassSectionB c bes g
				% m. 33
    \bassSectionC f aes bes
  }

  % m. 49
  \bassSectionA f ees des bes

  \bassSectionB c bes g

  \addTie { \bassSectionC f aes bes }
}

\score {
  <<
    \new Staff \with { instrumentName = "Guitar 1 " } \top
    \new Staff \with { instrumentName = "Guitar 2 " } \mid
    \new Staff \with { instrumentName = "Guitar 3 " } \bass
  >>
  }