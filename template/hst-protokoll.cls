\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hst-protokoll}[2015/09/01 Protokoll-Dokumentenklasse für die Hochschule Trier]

% Passes and class options to the underlying article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

% Load LaTeX's article class with the `titlepage' option so that \maketitle creates a title page, not just a title block
\LoadClass[a4paper, 11pt]{article}
\RequirePackage[a4paper, top=15mm, left=35mm, right=25mm, bottom=15mm]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage{epstopdf}
\RequirePackage[T1]{fontenc}
\RequirePackage{setspace}
\RequirePackage{tabularx}
\RequirePackage{blindtext}
\RequirePackage[ngerman]{babel} %deutsche Silbentrennung
\RequirePackage{titlesec}
\RequirePackage{textcomp}
\RequirePackage{enumitem} 
\RequirePackage{ifthen}

\newcounter{summe}
\newcommand{\abstimmung}[4]{
	\setcounter{summe}{#3}
	\addtocounter{summe}{#4}
	\begin{flushleft}
		#1\\
		Es wird über den Antrag abgestimmt.
	\end{flushleft}
	\ifthenelse{\equal{#3}{0}\AND\equal{#4}{0}}{
		\begin{center}
			\textbf{Der Antrag wird einstimmig angenommen.}
		\end{center}
	}{
	\begin{center}
		#2 \ifthenelse{\equal{#2}{1}}{Stimme}{Stimmen} dafür, #3 \ifthenelse{\equal{#3}{1}}{Stimme}{Stimmen} dagegen, #4 \ifthenelse{\equal{#4}{1}}{Enthaltung}{Enthaltungen}\\
		\ifthenelse{#2>\value{summe}}{
			\textbf{Der Antrag ist somit angenommen.}
		}{
		\textbf{Der Antrag ist somit abgelehnt.}
	}
\end{center}
}  
}
\def\logoPath{../logo.eps}

% % Variables
\newcommand{\AkzentFarbe}[3]{\definecolor{hlcolor}{RGB}{#1,#2,#3}}
\newcommand{\Protokollfuehrer}[1]{\def\protokoller{#1}}
\newcommand{\Sitzungsdatum}[1]{\def\dateOfMeeting{#1}}
\newcommand{\LatexVon}[1]{\def\TeXer{#1}}
\newcommand{\Vorsitzender}[1]{\def\fsiPresident{#1}}
\newcommand{\ProtokollID}[1]{\def\protocolID{#1}}
\newcommand{\Logo}[1]{\def\logoPath{\includegraphics[width=10.0cm]{#1}}}

\newenvironment{protokoll}
{\document
	
	\input{deckblatt.tex}
	\pagebreak
	
	\setcounter{tocdepth}{2}
	\tableofcontents 
	\pagebreak
}{\enddocument}

% % Custom Colors

\endinput