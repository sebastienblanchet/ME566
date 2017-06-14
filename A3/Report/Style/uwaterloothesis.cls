%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** Version Information ********************************
%%
%% Copyright (C) Huangrui Mo <huangrui.mo@gmail.com> 
%% This is free software: you can redistribute it and/or modify it
%% under the terms of the GNU General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{uwaterloothesis}
  [2014/10/01 v0.1 uwaterloothesis
   document class]
%%%%% --------------------------------------------------------------------------------
%%
%%%%*************************** Declare Options **************************************
%%
%% end-user parameters, each option is declared by one declare option command
\newif\ifUW@versioninfo \UW@versioninfofalse
\DeclareOption{draftversion}{% draft information reminder
  \UW@versioninfotrue%
}
\newif\ifUW@singlesided \UW@singlesidedfalse
\DeclareOption{singlesided}{% enable single-sided printing
  \UW@singlesidedtrue%
}
\newif\ifUW@doublesided \UW@doublesidedfalse
\DeclareOption{doublesided}{% enable double-sided printing
  \UW@doublesidedtrue%
}
\newif\ifUW@printcopy \UW@printcopyfalse
\DeclareOption{printcopy}{% enable print copy layout
  \UW@doublesidedtrue% auto enable double-sided style
  \UW@printcopytrue%
}
\DeclareOption*{% handle non-implemented options
  \PassOptionsToClass{\CurrentOption}{book}%
}
%% terminates all options processing
\ProcessOptions\relax
%%%%% --------------------------------------------------------------------------------
%%
%%%%*************************** Loadclass Infomation *********************************
%%
\ifUW@doublesided% if double-sided printing enabled
  \LoadClass[letterpaper,12pt,openright,twoside]{book}
\else% if double-sided printing isn't enabled
  \LoadClass[letterpaper,12pt,oneside]{book}
\fi
%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** Package Infomation *********************************
%%
%% math packages
\RequirePackage{amsmath,amssymb,amstext}
%%%%% --------------------------------------------------------------------------------
%%
%%%%************************ Load Class Configuretion ********************************
%%
\AtEndOfPackage{%class cfg loaded after package, makes commands at preamble take effect
  \makeatletter
  \InputIfFileExists{Style/uwaterloothesis.cfg}{}{}
  \makeatother
}
%%%%% --------------------------------------------------------------------------------
%%
%%%%******************************* Page Layout **************************************
%%
%% part one -- horizontal widths
%% left side width + textwidth + right side width = paperwidth
%% left side width of [odd, even] page = [odd, even]sidemargin + 1.0in (fixed) + hoffset
%% binding side width + textwidth + nonbinding side width = paperwidth
%% binding side width of [odd, even] page = [left, right] side width
%% assuming US letter paper (8.5in. x 11in.)
\setlength{\textwidth}{6in}% set required text width first
\ifUW@printcopy% if print copy layout enabled
  \setlength{\oddsidemargin}{0.5in}% binding side width
  \setlength{\evensidemargin}{0in}% ensure uniform binding side width for printing
\else
  \setlength{\oddsidemargin}{0.25in}% left side width
  \setlength{\evensidemargin}{0.25in}% ensure uniform left side width for EThesis
\fi
%% set margin for notes to zero
\setlength{\marginparwidth}{0pt}% width of margin notes
\setlength{\marginparsep}{0pt}% width of space between body text and margin notes
%% part two -- vertical heights
%% top height + textheight + bottom height = paperheight
%% top height = 1.0in (fixed) + voffset + topmargin + headheight + headsep 
\setlength{\textheight}{220mm}% set required text height first
\setlength{\voffset}{-15mm}% set a minimum header height
\setlength{\headheight}{15pt}% set a minimum header height
%% specifies the amount of space between paragraphs.
\setlength{\parskip}{0.5ex plus 0.25ex minus 0.25ex}
%% line spacing
\renewcommand{\baselinestretch}{1.1} % line space setting
\raggedbottom % prevent adding vertical white space in strange places
%% default pagestyle is page number at bottom without headers and footers
\pagestyle{plain}
%%%%% --------------------------------------------------------------------------------
%%
%%%%********************* Some Style Control Commands ********************************
%%
%% redefine cleardoublepage to empty pages
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \thispagestyle{empty}%
\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
%% define prechapter command
\newcommand\prechapter[1]{%
  \pagestyle{plain}
  \begin{center}%
    {\bfseries #1}
  \end{center}%
}
%%%%% --------------------------------------------------------------------------------
%%
%%%%******************* Commands of Titlepage Items **********************************
%%
\renewcommand\title[2][\UW@value@title]{%
  \def\UW@value@title{#2}
  %\def\UW@value@titlemark{\MakeUppercase{#1}}}
  \def\UW@value@titlemark{#1}}
\def\@title{\UW@value@titlemark}
\renewcommand\author[1]{\def\UW@value@author{#1}}
\newcommand\degree[1]{\def\UW@value@degree{#1}}
\newcommand\discipline[1]{\def\UW@value@discipline{#1}}
\newcommand\preparedfor[1]{\def\UW@value@preparedfor{#1}}
\newcommand\preparedcity[1]{\def\UW@value@preparedcity{#1}}

%create new command for page
%\newcommand{name}[num]{definition}


%%%%% --------------------------------------------------------------------------------
%%
%%%%*************************** Titlepage Configuration ******************************
%%
\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
	
	% Add picture of UW's logo
	\begin{figure}[!htbp]
		\centering
		%scale makes picture smaller (0.5 times)
		\includegraphics[width=0.6\textwidth,scale=0.5]{UW}
		\label{fig:UW}
	\end{figure}
	
	Department of Mechanical and Mechatronics Engineering 
	
	\vfill
	
	%Title of report
    %\Huge
    {\bf \UW@value@title}
	
	%end huge command 
    %\normalsize
	
	\vfill
	
    \UW@value@statement
	
	\vfill
	
	Prepared by:\\
	\UW@value@author\\
	
	\vfill
	
	\UW@value@discipline\\
	
	
	\vfill
	\UW@value@school
    
  \end{center}
  
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \ifUW@versioninfo
      \vspace*{\stretch{1}}
      \begin{footnotesize}
        \noindent
        Draft Version (\today)
      \end{footnotesize}
    \fi
    \cleardoublepage
  \else
    \ifUW@versioninfo
      \thispagestyle{empty}
      \vspace*{\stretch{1}}
      \begin{footnotesize}
        \noindent
        Draft Version (\today)
      \end{footnotesize}
      \cleardoublepage
    \fi
  \fi
}
%%%%% --------------------------------------------------------------------------------
%%
%%%%****************************** New Environments **********************************
%%
%% author's declaration
\newenvironment{declaration}
  {\prechapter{\UW@label@declaration}}
  {\cleardoublepage}
%% abstract
\newenvironment{abstract}
  {\prechapter{\UW@label@abstract}}
  {\cleardoublepage}
%% acknowledgements
\newenvironment{acknowledgements}
  {\prechapter{\UW@label@thanks}}
  {\cleardoublepage}
%% dedication
\newenvironment{dedication}
  {\prechapter{\UW@label@dedication}\begin{center}\bigskip\itshape}
  {\end{center}\cleardoublepage}
%%%%% --------------------------------------------------------------------------------
%%
%%%%**************************** Dotted Line in TOC **********************************
%%
%% define spacing and length
\def\@dotsep{1.5mu}% spacing for dots
\def\@pnumwidth{2em}% spacing between titles and page numbers
\def\@tocrmarg{2em}% right margin indentation
\def\@chaptervspace{8bp}% spacing between chapter titles
\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par\penalty\@highpenalty}%
  \fi}
\renewcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1
       \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}
       \hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip \@chaptervspace \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak
      \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}
      \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
%%%%% --------------------------------------------------------------------------------
\endinput
%% End of file
%%%%% --------------------------------------------------------------------------------