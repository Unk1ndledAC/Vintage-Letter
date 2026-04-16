% ============================================================
% vintageletter.cls — Vintage Letter Template
% Author: Based on pgfornament by Alain Matthes
% License: LPPL 1.3c
% ============================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vintageletter}[2026/04/16 v1.0 Vintage Letter Template]

% ── Base Document Class ────────────────────────────────────
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{article}

% ── Required Packages ──────────────────────────────────────
\RequirePackage[
  top=3.2cm, bottom=3.2cm,
  left=3.5cm, right=3.5cm,
  includeheadfoot
]{geometry}

\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{tikz}
\RequirePackage{pgfornament}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{eso-pic}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{enumitem}
\RequirePackage{calc}

% ── Font Settings ──────────────────────────────────────────
% Western: EB Garamond (vintage serif typeface)
\setmainfont{EB Garamond}[
  Ligatures=TeX,
  Numbers=OldStyle
]

% CJK (Japanese/Chinese): System Gothic fonts
\setCJKmainfont{Yu Gothic}[
  BoldFont = Yu Gothic Bold
]
\setCJKsansfont{Yu Gothic}
\setCJKmonofont{Yu Gothic}

% ── Color Definitions ──────────────────────────────────────
\definecolor{inkbrown}{RGB}{74,44,24}       % Ink brown (main text)
\definecolor{orncolor}{RGB}{139,90,43}      % Warm gold-brown (ornaments)
\definecolor{pagecream}{RGB}{255,252,240}   % Parchment cream (background)
\definecolor{ruledgold}{RGB}{180,140,60}    % Gold line (dividers)
\definecolor{accentred}{RGB}{139,35,35}     % Vintage red (emphasis)

% ── Page Style ─────────────────────────────────────────────
\pagestyle{fancy}
\fancyhf{}
\setlength{\headheight}{26pt}

% Header: small ornaments on left and right
\fancyhead[L]{%
  \textcolor{orncolor}{%
    \pgfornament[width=1.2cm,color=orncolor]{11}}}
\fancyhead[R]{%
  \textcolor{orncolor}{%
    \pgfornament[width=1.2cm,color=orncolor]{14}}}

% Footer: centered page number
\fancyfoot[C]{\textcolor{orncolor}{\small\thepage}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% ── Parchment Background ──────────────────────────────────
\AddToShipoutPictureBG{%
  \AtPageLowerLeft{%
    \color{pagecream}\rule{\paperwidth}{\paperheight}}}

% ── Line Spacing & Paragraphs ──────────────────────────────
\setstretch{1.85}
\setlength{\parindent}{2em}
\setlength{\parskip}{0.4em}

% ── Decorative Commands ────────────────────────────────────

% Ornamental divider (with central flourish)
\newcommand{\ornrule}{%
  \vspace{0.6em}%
  \begin{center}
    \textcolor{ruledgold}{%
      \pgfornament[width=2cm,color=orncolor]{84}%
      \hspace{0.5em}%
      \pgfornament[width=0.9cm,color=orncolor]{11}%
      \hspace{0.5em}%
      \pgfornament[width=2cm,color=orncolor,symmetry=v]{84}%
    }
  \end{center}%
  \vspace{0.4em}}

% Corner decorations (TikZ overlay)
\newcommand{\cornerdeco}{%
  \begin{tikzpicture}[remember picture,overlay]
    % Top-left corner
    \node[anchor=north west, xshift=0.8cm, yshift=-0.8cm]
      at (current page.north west)
      {\pgfornament[width=2.2cm,color=orncolor]{61}};
    % Top-right corner
    \node[anchor=north east, xshift=-0.8cm, yshift=-0.8cm]
      at (current page.north east)
      {\pgfornament[width=2.2cm,color=orncolor,symmetry=v]{61}};
    % Bottom-left corner
    \node[anchor=south west, xshift=0.8cm, yshift=0.8cm]
      at (current page.south west)
      {\pgfornament[width=2.2cm,color=orncolor,symmetry=h]{61}};
    % Bottom-right corner
    \node[anchor=south east, xshift=-0.8cm, yshift=0.8cm]
      at (current page.south east)
      {\pgfornament[width=2.2cm,color=orncolor,symmetry=c]{61}};
    % Top border line
    \node[anchor=north, yshift=-0.9cm] at (current page.north)
      {\pgfornament[width=10cm,color=orncolor]{46}};
    % Bottom border line
    \node[anchor=south, yshift=0.9cm] at (current page.south)
      {\pgfornament[width=10cm,color=orncolor,symmetry=h]{46}};
  \end{tikzpicture}}

% Floral header decoration
\newcommand{\floralheader}{%
  \vspace*{-0.5cm}
  \begin{center}
    \pgfornament[width=3.5cm,color=orncolor]{69}
    \hspace{1.5em}
    \pgfornament[width=1.6cm,color=orncolor]{11}
    \hspace{1.5em}
    \pgfornament[width=3.5cm,color=orncolor,symmetry=v]{69}
  \end{center}
  \vspace{0.8em}}

% Dedication environment
\newenvironment{dedication}{%
  \vspace{1.5em}
  \begin{center}
    \large\itshape\color{accentred}}{%
  \end{center}
  \vspace{1em}}

% Signature command
\newcommand{\signature}[1]{%
  \begin{flushright}
    \pgfornament[width=1.8cm,color=orncolor]{55}\\[0.5em]
    {\Large\itshape #1}\\[0.2em]
    \textcolor{orncolor}{\small\pgfornament[width=2.5cm,color=orncolor]{71}}
  \end{flushright}}

% Addressee command
\newcommand{\addressee}[1]{%
  {\large\itshape #1}
  \ornrule}

% ── Document Start Hook ────────────────────────────────────
\AtBeginDocument{\color{inkbrown}\cornerdeco\floralheader}

\endinput
