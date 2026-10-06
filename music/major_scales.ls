\version "2.24.0"

\paper {
  #(set-paper-size "letter")
  top-margin = 10\mm
  bottom-margin = 10\mm
  left-margin = 12\mm
  right-margin = 12\mm
}

\header {
  title = "Major Scales"
  subtitle = "Two Octaves, Hands One Octave Apart"
  tagline = ##f
}

\layout {
  indent = 0
  \context { \Score \omit BarNumber }
}

% Each scale uses eighth notes. RH is one octave above LH.
% LH moves to the treble staff above middle C; on the shared staff,
% RH is voiceOne (stems up) and LH is voiceTwo (stems down).

% ---------- C MAJOR ----------
cRight = \relative c' {
  \key c \major \time 4/4 \voiceOne
  c4-1 d-2 e-3 f-1 g-2 a-3 b-4 c-1 |
  d-2 e-3 f-1 g-2 a-3 b-4 c-5 b-4 |
  a-3 g-2 f-1 e-3 d-2 c-1 b-4 a-3 |
  g-2 f-1 e-3 d-2 c-1 \bar "|."
}
cLeft = \relative c {
  \key c \major \time 4/4
  c4-5 d-4 e-3 f-2 g-1 a-3 b-2 c-1 |
  \change Staff = "right" \voiceTwo
  d-4 e-3 f-2 g-1 a-3 b-2 c-1 b-2 |
  a-3 g-1 f-2 e-3 d-4
  \change Staff = "left" \oneVoice
  c-1 b-2 a-3 |
  g-1 f-2 e-3 d-4 c-5 \bar "|."
}

% ---------- G MAJOR ----------
gRight = \relative g' {
  \key g \major \time 4/4 \voiceOne
  g4-1 a-2 b-3 c-1 d-2 e-3 fis-4 g-1 |
  a-2 b-3 c-1 d-2 e-3 fis-4 g-5 fis-4 |
  e-3 d-2 c-1 b-3 a-2 g-1 fis-4 e-3 |
  d-2 c-1 b-3 a-2 g-1 \bar "|."
}
gLeft = \relative g {
  \key g \major \time 4/4
  g4-5 a-4 b-3 c-2
  \change Staff = "right" \voiceTwo
  d-1 e-3 fis-2 g-1 |
  a-4 b-3 c-2 d-1 e-3 fis-2 g-1 fis-2 |
  e-3 d-1 c-2 b-3 a-4 g-1 fis-2 e-3 |
  d-1
  \change Staff = "left" \oneVoice
  c-2 b-3 a-4 g-5 \bar "|."
}

% ---------- D MAJOR ----------
dRight = \relative d' {
  \key d \major \time 4/4 \voiceOne
  d4-1 e-2 fis-3 g-1 a-2 b-3 cis-4 d-1 |
  e-2 fis-3 g-1 a-2 b-3 cis-4 d-5 cis-4 |
  b-3 a-2 g-1 fis-3 e-2 d-1 cis-4 b-3 |
  a-2 g-1 fis-3 e-2 d-1 \bar "|."
}
dLeft = \relative d {
  \key d \major \time 4/4
  d4-5 e-4 fis-3 g-2 a-1 b-3
  \change Staff = "right" \voiceTwo
  cis-2 d-1 |
  e-4 fis-3 g-2 a-1 b-3 cis-2 d-1 cis-2 |
  b-3 a-1 g-2 fis-3 e-4 d-1 cis-2
  \change Staff = "left" \oneVoice
  b-3 |
  a-1 g-2 fis-3 e-4 d-5 \bar "|."
}

% ---------- A MAJOR ----------
aRight = \relative a' {
  \key a \major \time 4/4 \voiceOne
  a4-1 b-2 cis-3 d-1 e-2 fis-3 gis-4 a-1 |
  b-2 cis-3 d-1 e-2 fis-3 gis-4 a-5 gis-4 |
  fis-3 e-2 d-1 cis-3 b-2 a-1 gis-4 fis-3 |
  e-2 d-1 cis-3 b-2 a-1 \bar "|."
}
aLeft = \relative a, {
  \key a \major \time 4/4
  a4-5 b-4 cis-3 d-2 e-1 fis-3 gis-2 a-1 |
  b-4
  \change Staff = "right" \voiceTwo
  cis-3 d-2 e-1 fis-3 gis-2 a-1 gis-2 |
  fis-3 e-1 d-2 cis-3
  \change Staff = "left" \oneVoice
  b-4 a-1 gis-2 fis-3 |
  e-1 d-2 cis-3 b-4 a-5 \bar "|."
}

% ---------- E MAJOR ----------
eRight = \relative e' {
  \key e \major \time 4/4 \voiceOne
  e4-1 fis-2 gis-3 a-1 b-2 cis-3 dis-4 e-1 |
  fis-2 gis-3 a-1 b-2 cis-3 dis-4 e-5 dis-4 |
  cis-3 b-2 a-1 gis-3 fis-2 e-1 dis-4 cis-3 |
  b-2 a-1 gis-3 fis-2 e-1 \bar "|."
}
eLeft = \relative e {
  \key e \major \time 4/4
  e4-5 fis-4 gis-3 a-2 b-1
  \change Staff = "right" \voiceTwo
  cis-3 dis-2 e-1 |
  fis-4 gis-3 a-2 b-1 cis-3 dis-2 e-1 dis-2 |
  cis-3 b-1 a-2 gis-3 fis-4 e-1 dis-2 cis-3 |
  \change Staff = "left" \oneVoice
  b-1 a-2 gis-3 fis-4 e-5 \bar "|."
}

% ---------- B MAJOR ----------
bRight = \relative b' {
  \key b \major \time 4/4 \voiceOne
  b4-1 cis-2 dis-3 e-1 fis-2 gis-3 ais-4 b-1 |
  cis-2 dis-3 e-1 fis-2 gis-3 ais-4 b-5 ais-4 |
  gis-3 fis-2 e-1 dis-3 cis-2 b-1 ais-4 gis-3 |
  fis-2 e-1 dis-3 cis-2 b-1 \bar "|."
}
bLeft = \relative b, {
  \key b \major \time 4/4
  b4-4 cis-3 dis-2 e-1 fis-4 gis-3 ais-2 b-1 |
  \change Staff = "right" \voiceTwo
  cis-3 dis-2 e-1 fis-4 gis-3 ais-2 b-1 ais-2 |
  gis-3 fis-4 e-1 dis-2 cis-3
  \change Staff = "left" \oneVoice
  b-1 ais-2 gis-3 |
  fis-4 e-1 dis-2 cis-3 b-4 \bar "|."
}

% ---------- F-SHARP MAJOR ----------
fisRight = \relative fis' {
  \key fis \major \time 4/4 \voiceOne
  fis4-2 gis-3 ais-4 b-1 cis-2 dis-3 eis-1 fis-2 |
  gis-3 ais-4 b-1 cis-2 dis-3 eis-1 fis-2 eis-1 |
  dis-3 cis-2 b-1 ais-4 gis-3 fis-2 eis-1 dis-3 |
  cis-2 b-1 ais-4 gis-3 fis-2 \bar "|."
}
fisLeft = \relative fis {
  \key fis \major \time 4/4
  fis4-4 gis-3 ais-2 b-1
  \change Staff = "right" \voiceTwo
  cis-3 dis-2 eis-1 fis-4 |
  gis-3 ais-2 b-1 cis-3 dis-2 eis-1 fis-4 eis-1 |
  dis-2 cis-3 b-1 ais-2 gis-3 fis-4 eis-1 dis-2 |
  cis-3
  \change Staff = "left" \oneVoice
  b-1 ais-2 gis-3 fis-4 \bar "|."
}

% ---------- D-FLAT MAJOR ----------
desRight = \relative des' {
  \key des \major \time 4/4 \voiceOne
  des4-2 ees-3 f-1 ges-2 aes-3 bes-4 c-1 des-2 |
  ees-3 f-1 ges-2 aes-3 bes-4 c-1 des-2 c-1 |
  bes-4 aes-3 ges-2 f-1 ees-3 des-2 c-1 bes-4 |
  aes-3 ges-2 f-1 ees-3 des-2 \bar "|."
}
desLeft = \relative des {
  \key des \major \time 4/4
  des4-3 ees-2 f-1 ges-4 aes-3 bes-2 c-1
  \change Staff = "right" \voiceTwo
  des-3 |
  ees-2 f-1 ges-4 aes-3 bes-2 c-1 des-3 c-1 |
  bes-2 aes-3 ges-4 f-1 ees-2 des-3
  \change Staff = "left" \oneVoice
  c-1 bes-2 |
  aes-3 ges-4 f-1 ees-2 des-3 \bar "|."
}

% ---------- A-FLAT MAJOR ----------
aesRight = \relative aes' {
  \key aes \major \time 4/4 \voiceOne
  aes4-3 bes-4 c-1 des-2 ees-3 f-1 g-2 aes-3 |
  bes-4 c-1 des-2 ees-3 f-1 g-2 aes-3 g-2 |
  f-1 ees-3 des-2 c-1 bes-4 aes-3 g-2 f-1 |
  ees-3 des-2 c-1 bes-4 aes-3 \bar "|."
}
aesLeft = \relative aes {
  \key aes \major \time 4/4
  aes4-3 bes-2 c-1
  \change Staff = "right" \voiceTwo
  des-4 ees-3 f-2 g-1 aes-3 |
  bes-2 c-1 des-4 ees-3 f-2 g-1 aes-3 g-1 |
  f-2 ees-3 des-4 c-1
  \change Staff = "left" \oneVoice
  bes-2 aes-3 g-1 f-2 |
  ees-3 des-4 c-1 bes-2 aes-3 \bar "|."
}

% ---------- E-FLAT MAJOR ----------
eesRight = \relative ees' {
  \key ees \major \time 4/4 \voiceOne
  ees4-3 f-1 g-2 aes-3 bes-4 c-1 d-2 ees-3 |
  f-1 g-2 aes-3 bes-4 c-1 d-2 ees-3 d-2 |
  c-1 bes-4 aes-3 g-2 f-1 ees-3 d-2 c-1 |
  bes-4 aes-3 g-2 f-1 ees-3 \bar "|."
}
eesLeft = \relative ees {
  \key ees \major \time 4/4
  ees4-3 f-2 g-1 aes-4 bes-3 c-2
  \change Staff = "right" \voiceTwo
  d-1 ees-3 |
  f-2 g-1 aes-4 bes-3 c-2 d-1 ees-3 d-1 |
  c-2 bes-3 aes-4 g-1 f-2 ees-3 d-1
  \change Staff = "left" \oneVoice
  c-2 |
  bes-3 aes-4 g-1 f-2 ees-3 \bar "|."
}

% ---------- B-FLAT MAJOR ----------
besRight = \relative bes' {
  \key bes \major \time 4/4 \voiceOne
  bes4-2 c-1 d-2 ees-3 f-1 g-2 a-3 bes-4 |
  c-1 d-2 ees-3 f-1 g-2 a-3 bes-4 a-3 |
  g-2 f-1 ees-3 d-2 c-1 bes-4 a-3 g-2 |
  f-1 ees-3 d-2 c-1 bes-2 \bar "|."
}
besLeft = \relative bes, {
  \key bes \major \time 4/4
  bes4-3 c-2 d-1 ees-4 f-3 g-2 a-1 bes-3 |
  c-2
  \change Staff = "right" \voiceTwo
  d-1 ees-4 f-3 g-2 a-1 bes-3 a-1 |
  g-2 f-3 ees-4 d-1
  \change Staff = "left" \oneVoice
  c-2 bes-3 a-1 g-2 |
  f-3 ees-4 d-1 c-2 bes-3 \bar "|."
}

% ---------- F MAJOR ----------
fRight = \relative f' {
  \key f \major \time 4/4 \voiceOne
  f4-1 g-2 a-3 bes-4 c-1 d-2 e-3 f-1 |
  g-2 a-3 bes-4 c-1 d-2 e-3 f-4 e-3 |
  d-2 c-1 bes-4 a-3 g-2 f-1 e-3 d-2 |
  c-1 bes-4 a-3 g-2 f-1 \bar "|."
}
fLeft = \relative f {
  \key f \major \time 4/4
  f4-5 g-4 a-3 bes-2 c-1
  \change Staff = "right" \voiceTwo
  d-3 e-2 f-1 |
  g-4 a-3 bes-2 c-1 d-3 e-2 f-1 e-2 |
  d-3 c-1 bes-2 a-3 g-4 f-1 e-2 d-3 |
  \change Staff = "left" \oneVoice
  c-1 bes-2 a-3 g-4 f-5 \bar "|."
}

\markup { \vspace #1 \fill-line { \fontsize #2 \bold "C Major" } }
\score {
  \new PianoStaff <<
    \new Staff = "right" << \new Voice { \cRight } >>
    \new Staff = "left" << \clef bass \new Voice { \cLeft } >>
  >>
  \layout { }
}

\markup { \vspace #1 \fill-line { \fontsize #2 \bold "G Major" } }
\score {
  \new PianoStaff <<
    \new Staff = "right" << \new Voice { \gRight } >>
    \new Staff = "left" << \clef bass \new Voice { \gLeft } >>
  >>
  \layout { }
}

\markup { \vspace #1 \fill-line { \fontsize #2 \bold "D Major" } }
\score {
  \new PianoStaff <<
    \new Staff = "right" << \new Voice { \dRight } >>
    \new Staff = "left" << \clef bass \new Voice { \dLeft } >>
  >>
  \layout { }
}

\markup { \vspace #1 \fill-line { \fontsize #2 \bold "A Major" } }
\score {
  \new PianoStaff <<
    \new Staff = "right" << \new Voice { \aRight } >>
    \new Staff = "left" << \clef bass \new Voice { \aLeft } >>
  >>
  \layout { }
}

\markup { \vspace #1 \fill-line { \fontsize #2 \bold "E Major" } }
\score {
  \new PianoStaff <<
    \new Staff = "right" << \new Voice { \eRight } >>
    \new Staff = "left" << \clef bass \new Voice { \eLeft } >>
  >>
  \layout { }
}

\markup { \vspace #1 \fill-line { \fontsize #2 \bold "B Major" } }
\score {
  \new PianoStaff <<
    \new Staff = "right" << \new Voice { \bRight } >>
    \new Staff = "left" << \clef bass \new Voice { \bLeft } >>
  >>
  \layout { }
}

\markup { \vspace #1 \fill-line { \fontsize #2 \bold "F-sharp Major" } }
\score {
  \new PianoStaff <<
    \new Staff = "right" << \new Voice { \fisRight } >>
    \new Staff = "left" << \clef bass \new Voice { \fisLeft } >>
  >>
  \layout { }
}

\markup { \vspace #1 \fill-line { \fontsize #2 \bold "D-flat Major" } }
\score {
  \new PianoStaff <<
    \new Staff = "right" << \new Voice { \desRight } >>
    \new Staff = "left" << \clef bass \new Voice { \desLeft } >>
  >>
  \layout { }
}

\markup { \vspace #1 \fill-line { \fontsize #2 \bold "A-flat Major" } }
\score {
  \new PianoStaff <<
    \new Staff = "right" << \new Voice { \aesRight } >>
    \new Staff = "left" << \clef bass \new Voice { \aesLeft } >>
  >>
  \layout { }
}

\markup { \vspace #1 \fill-line { \fontsize #2 \bold "E-flat Major" } }
\score {
  \new PianoStaff <<
    \new Staff = "right" << \new Voice { \eesRight } >>
    \new Staff = "left" << \clef bass \new Voice { \eesLeft } >>
  >>
  \layout { }
}

\markup { \vspace #1 \fill-line { \fontsize #2 \bold "B-flat Major" } }
\score {
  \new PianoStaff <<
    \new Staff = "right" << \new Voice { \besRight } >>
    \new Staff = "left" << \clef bass \new Voice { \besLeft } >>
  >>
  \layout { }
}

\markup { \vspace #1 \fill-line { \fontsize #2 \bold "F Major" } }
\score {
  \new PianoStaff <<
    \new Staff = "right" << \new Voice { \fRight } >>
    \new Staff = "left" << \clef bass \new Voice { \fLeft } >>
  >>
  \layout { }
}

