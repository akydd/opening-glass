\version "2.26.0"



triple =
#(define-music-function
  (pitch-one pitch-two)
  (ly:pitch? ly:pitch?)
  #{
     $pitch-one 8 $pitch-two 8 $pitch-one 8
  #})

triplet =
#(define-music-function
  (note-one note-two)
  (ly:pitch? ly:pitch?)
  #{
    \tuplet 3/2 \triple #note-one #note-two
  #})

triplet-pair =
#(define-music-function
  (note-one note-two)
  (ly:pitch? ly:pitch?)
  #{
    \triplet #note-one #note-two
    \triplet #note-two #note-one
  #})

topCycle =
#(define-music-function
  (note-one note-two)
  (ly:pitch? ly:pitch?)
  #{
    \triplet-pair #note-one #note-two
    \triplet-pair #note-one #note-two
  #})

change-second-last =
  #(define-music-function (music new-pitch) (ly:music? ly:pitch?)
     "Return MUSIC with the pitch of its second-from-last note event
      changed to NEW-PITCH (durations and everything else untouched)."
     (let ((notes '()))
       ;; walk the tree, collecting note events — newest first,
       ;; so the list ends up in reverse reading order
       (music-map
        (lambda (m)
          (when (music-is-of-type? m 'note-event)
            (set! notes (cons m notes)))
          m)
        music)
       ;; (car notes) = last note, (cadr notes) = second-last
       (if (>= (length notes) 2)
           (ly:music-set-property! (cadr notes) 'pitch new-pitch))
      music))

topPhrase =
#(define-music-function
  (a b c d e f g h)
  (ly:pitch? ly:pitch? ly:pitch? ly:pitch? ly:pitch? ly:pitch? ly:pitch? ly:pitch?)
  #{
  \fixed c' {
    \topCycle #a #b
    \topCycle #c #d
    \topCycle #e #f
    \topCycle #g #h
  }
  #})

topSectionA =
#(define-music-function
  (a b c d e f g h alt)
    (ly:pitch? ly:pitch? ly:pitch? ly:pitch? ly:pitch? ly:pitch? ly:pitch? ly:pitch? ly:pitch?)
  #{
  \addToFirstNote \mf { \change-second-last { \topPhrase #a #b #c #d #e #f #g #h } #alt }
  \repeat unfold 2 { \change-second-last { \topPhrase #a #b #c #d #e #f #g #h } #alt }
  \topPhrase #a #b #c #d #e #f #e #f
  #})

topSectionB =
#(define-music-function
  (a b c d e f g h)
  (ly:pitch? ly:pitch? ly:pitch? ly:pitch? ly:pitch? ly:pitch? ly:pitch? ly:pitch?)
  #{
  \repeat unfold 3 { \topPhrase #a #b #c #d #e #f #g #h }
  \topPhrase #a #b #c #d #e #f #e #f
  #})

topSectionC =
#(define-music-function
  (a b c d e f g h)
  (ly:pitch? ly:pitch? ly:pitch? ly:pitch? ly:pitch? ly:pitch? ly:pitch? ly:pitch?)
  #{
  \repeat unfold 3 { \topPhrase #a #b #c #d #e #f #e #f }
  \topPhrase #a #b #a #b #g #h #g #h
  #})

%% Attach EVENT (a dynamic like \mf, a script, or a -\markup {...}) to the
%% first note event of MUSIC.  Everything else is left untouched.
addToFirstNote =
#(define-music-function (event music) (ly:music? ly:music?)
   (let ((done #f))
     (music-map
      (lambda (m)
        (when (and (not done) (music-is-of-type? m 'note-event))
          (set! done #t)
          (ly:music-set-property! m 'articulations
            (append (ly:music-property m 'articulations)
                    (list event))))
        m)
      music)
     music))

%% Tie the last note of MUSIC to a new whole-note (a full 4/4 measure) of
%% the same pitch.
%%   \addTie { \topSectionC d' f aes d' ees' aes' d' g }
addTie =
#(define-music-function (music) (ly:music?)
   (let ((notes '()))
     (music-map
      (lambda (m)
        (when (music-is-of-type? m 'note-event)
          (set! notes (cons m notes)))
        m)
      music)
     (if (null? notes)
         music
         (let ((last (car notes)))
           (ly:music-set-property! last 'articulations
             (append (ly:music-property last 'articulations)
                     (list (make-music 'TieEvent))))
	  #{ $music $(ly:music-property last 'pitch) 1 #}))))

double =
#(define-music-function
  (pitch-one pitch-two)
  (ly:pitch? ly:pitch?)
  #{
    $pitch-one 8 $pitch-two 8
  #})

midCycle =
#(define-music-function
  (note-one note-two)
  (ly:pitch? ly:pitch?)
  #{
  \double #note-one #note-two
  \double #note-one #note-two
  \double #note-one #note-two
  \double #note-one #note-two
  \double #note-one #note-two
  \double #note-one #note-two
  \double #note-one #note-two
  \double #note-one #note-two
  #})

midPhrase =
#(define-music-function (a b c d) (ly:pitch? ly:pitch? ly:pitch? ly:pitch?)
  #{
  \fixed c {
    \midCycle #a #b
    \midCycle #c #d
  }
  #})

midSectionA =
#(define-music-function (a b c d) (ly:pitch? ly:pitch? ly:pitch? ly:pitch?)
  #{
  \repeat unfold 4 { \midPhrase #a #b #c #d }
  #})

midSectionB =
#(define-music-function (a b c d) (ly:pitch? ly:pitch? ly:pitch? ly:pitch?)
  #{
  \repeat unfold 3 { \midPhrase #a #b #c #d }
  \midPhrase #a #b #a #b
  #})

%% Two whole notes (two full 4/4 measures) of pitch P, tied together.
tieWholeNotes =
#(define-music-function (p) (ly:pitch?)
  #{
    $p 1 ~ $p 1
  #})

bassSectionA =
#(define-music-function (a b c d) (ly:pitch? ly:pitch? ly:pitch? ly:pitch?)
  #{
  \repeat unfold 3 { { \tieWholeNotes #a } $b 1 $c 1 }
  \tieWholeNotes #a
  $b 1 $d 1 
  #})

bassSectionB =
#(define-music-function (a b c) (ly:pitch? ly:pitch? ly:pitch?)
  #{
  \repeat unfold 4 { $a 1 $b 1 $b 1 $c 1 }
  #})

bassSectionC =
#(define-music-function (a b c) (ly:pitch? ly:pitch? ly:pitch?)
  #{
  \repeat unfold 2 { { \tieWholeNotes #a } $b 1 $c 1 }
  \tieWholeNotes #a
  $b 1 $c 2 $b 2
  \tieWholeNotes #c
  \tieWholeNotes #a
  #})