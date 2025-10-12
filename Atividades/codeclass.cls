\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{codeclass}

\newif\ifhyper\hypertrue
\DeclareOption{nohyper}{\hyperfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}
\PassOptionsToPackage{colorlinks  = true, 
                urlcolor        = red!70!black, 
                anchorcolor     = red!70!black, 
                citecolor       = red!70!black, 
                filecolor       = red!70!black, 
                linkcolor       = red!70!black, 
                menucolor       = red!70!black, 
                linktocpage     = true, 
                bookmarks       = true,
                pdfusetitle
                }{hyperref}
\RequirePackage{mypackages}

% ORCiD
\newcommand{\orcid}[1]{\texorpdfstring{\textsuperscript{\orcidlink{#1}}}{}}

% E-mail
\def\@email{\@empty}
\providecommand{\email}[1]{\gdef\@email{#1}}
\renewcommand{\email}[1]{\gdef\@email{#1}}

% Affiliation
\def\@affiliation{\@empty}
\providecommand{\affiliation}[1]{\gdef\@affiliation{\textit{#1}}}
\renewcommand{\affiliation}[1]{\gdef\@affiliation{\textit{#1}}}

% Dated
\def\@dated{\@empty}
\providecommand{\dated}[1]{\gdef\@dated{(Data: #1)}}
\renewcommand{\dated}[1]{\gdef\@dated{(Data: #1)}}

% Abstract
\def\@abstract{\@empty}
\renewcommand{\abstract}[1]{\gdef\@abstract{#1}}

\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\rhead{\thepage}
\pagestyle{fancy}

% Make Title
\renewcommand{\maketitle}{
    \thispagestyle{cover}

    \begin{center}
    
    {\huge\bfseries\@title}

    \vspace{1em}
    
    {\@author}

    \vspace{0.5em}

    {\parbox{4in}{\centering\@affiliation}}

    \vspace{1em}

    {\@dated}

    \vspace{1em}

    \parbox{5in}{\@abstract}
    \end{center}
    \vspace{1em}
}

\newcommand{\makefinal}{%
    \emergencystretch=0.65em 
    \printbibliography[heading=bibintoc]
}

\newenvironment{widetext}{
    \begin{strip}
        \begin{tikzpicture}[overlay]
            \draw[thick] (0,0) -- (0+\linewidth/2-\columnsep/3,0) -| (0+\linewidth/2-\columnsep/3,0.3);
        \end{tikzpicture}
        
}{      \hspace{0.3cm}
        \begin{tikzpicture}[overlay]
            \draw[thick] (0+\linewidth/2-\columnsep/2,-0.3) -| (0+\linewidth/2-\columnsep/2,0) -- (0+\linewidth-\columnsep,0);
        \end{tikzpicture}
    \end{strip}
}

\fancypagestyle{cover}{%
\fancyhf{}
\fancyhead[L]{\bfseries Aprendizado de Máquina e Inteligência Artificial em Física}
\fancyhead[R]{\bfseries PGF5393 \& 4305512}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
}

\definecolor{marrom}{HTML}{A03232}

\DeclareMathOperator*{\Jimeens}{Lucas~Roda~Ximenes~dos~Santos}

\makeatletter
\patchcmd{\minted@framed@colorbg}%
  {\vspace{0.5\baselineskip}}% Adjust top spacing
  {\vspace{0.25\baselineskip}}% Replace with desired top spacing
  {}{}
\patchcmd{\endminted@framed}%
  {\vspace{0.5\baselineskip}}% Adjust bottom spacing
  {\vspace{0.25\baselineskip}}% Replace with desired bottom spacing
  {}{}
\makeatother

%%% Code Highlighting %%%
\newenvironment{code}{\captionsetup{type=listing}}{}
\newenvironment{longlisting}{\captionsetup{type=listing}}{}

% Define a new and improved minted style.
\setminted{
    frame=lines,
    framesep=2mm,
    baselinestretch=1,
    fontsize=\footnotesize,
    % linenos, % Coloca números na esquerda do código
    tabsize=2,
    breaklines=true,
    breakanywhere=true,
}

% Change line number color to gray (Frade's suggestion).
\renewcommand{\theFancyVerbLine}{%
    \scriptsize\textcolor[rgb]{0.7,0.7,0.7}{\arabic{FancyVerbLine}}%
}

\def\sklearn{\includegraphics[height=1em]{figures/sklearn.png}}
\def\pandas{\includegraphics[height=1em]{figures/pandas.png}}
\def\numpy{\includegraphics[height=1em]{figures/numpy.png}}
\def\seaborn{\includegraphics[height=1em]{figures/seaborn.png}}
\def\colab{\includegraphics[height=0.85em]{figures/colab.png}}
