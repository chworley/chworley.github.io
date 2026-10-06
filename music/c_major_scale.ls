\header {
  title = "Major Scales"
  subtitle = "Two Octaves, Hands One Octave Apart"
  tagline = ##f
}

% G MAJOR

gRight = \relative g' {
  \key g \major
  \voiceOne
  % ...
}

gLeft = \relative g {
  \key g \major
  % ...
  \change Staff = "right"
  \voiceTwo
  % ...
  \change Staff = "left"
  \oneVoice
  % ...
}

% D MAJOR

dRight = \relative d' {
  \key d \major
  \voiceOne
  % ...
}

dLeft = \relative d {
  \key d \major
  % ...
}