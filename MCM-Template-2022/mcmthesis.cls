%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This template is improved for undergraduates at    %%
%% Northeastern University at Qinhuangdao             %%
%% enrolled in MCM/ICM.                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This work may be distributed and/or modified under the            %%
%% conditions of the LaTeX Project Public License, either version 1.3%%
%% of this license or (at your option) any later version.            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Now, This template has been modified once again.   %%
%% It can be used for MCM/ICM in 2022 or later        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[2020/02/02]
\ProvidesClass{mcmthesis}
\RequirePackage{xkeyval}
\RequirePackage{etoolbox}
\define@boolkey{MCM}[MCM@opt@]{sheet}[true]{}
\define@boolkey{MCM}[MCM@opt@]{titleinsummary}[true]{}
\define@cmdkeys{MCM}[MCM@opt@]{tcn,problem}
\define@key{MCM}{tcn}[0000]{\gdef\MCM@opt@tcn{#1}}
\define@key{MCM}{problem}[A]{\gdef\MCM@opt@problem{#1}}
\setkeys{MCM}{tcn=0000,problem=B}
\define@key{mcmthesis.cls}{tcn}[0000]{\gdef\MCM@opt@tcn{#1}}
\define@key{mcmthesis.cls}{problem}[A]{\gdef\MCM@opt@problem{#1}}
\define@boolkey{mcmthesis.cls}[MCM@opt@]{sheet}{}
\define@boolkey{mcmthesis.cls}[MCM@opt@]{titleinsummary}{}
\define@boolkey{mcmthesis.cls}[MCM@opt@]{summary}{}
\MCM@opt@sheettrue
\MCM@opt@titleinsummarytrue
\MCM@opt@summarytrue

\newcommand{\mcmsetup}[1]{\setkeys{MCM}{#1}}
\ProcessOptionsX\relax
\LoadClass[a4paper, 12pt]{article}
\newcommand{\team}{Team\ \,\#\,\MCM@opt@tcn}
\RequirePackage{fancyhdr, fancybox}
\RequirePackage{ifthen}
\RequirePackage{lastpage}
\RequirePackage{listings}
\RequirePackage[toc, page, title, titletoc, header]{appendix}
\RequirePackage{paralist}
\RequirePackage{amsmath, amsfonts}
\RequirePackage{amsthm, bm}
\RequirePackage{amssymb, mathrsfs}
\RequirePackage{latexsym}
\RequirePackage{longtable, multirow, hhline, tabularx, array}
\RequirePackage{flafter}
\RequirePackage{pifont, calc}
\RequirePackage{colortbl, booktabs}
\RequirePackage{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage[scaled]{berasans}
\RequirePackage{hyperref}
\RequirePackage{ifpdf, ifxetex}

\ifpdf
  \RequirePackage{graphicx}
  \RequirePackage{epstopdf}
\else
  \ifxetex
    \RequirePackage{graphicx}
  \else
    \RequirePackage[dvipdfmx]{graphicx}
    \RequirePackage{bmpsize}
  \fi
\fi
\RequirePackage[svgnames]{xcolor}


\ifpdf
  \hypersetup{bookmarksopen=true,
            %colorlinks,      %注释掉此项则交叉引用为彩色边框(将colorlinks和pdfborder 同时注释掉)
            %pdfborder=001,   %注释掉此项则交叉引用为彩色边框
            allcolors=black}
\else
  \ifxetex
    \hypersetup{bookmarksopen=true,
            %colorlinks,      %注释掉此项则交叉引用为彩色边框(将colorlinks和pdfborder同时注释掉)
            %pdfborder=001,   %注释掉此项则交叉引用为彩色边框
            allcolors=black}
  \else
    \hypersetup{dvipdfm, hidelinks}
  \fi
\fi
\geometry{a4paper,top=1in,bottom=1in,left=1in,right=1in}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.75pt}
%\renewcommand{\footrulewidth}{0.75pt}
\lhead{\sffamily%\small
       \team}
\rhead{\sffamily%\small
       Page \thepage\ of \,\pageref{LastPage}}
                          %\pageref{LastPage2}}

\fancypagestyle{content}{
\fancyhf{}
\lhead{\sffamily%\small
       \team}
\rhead{\sffamily%\small
       Contents}
}

\renewcommand{\baselinestretch}{1.1}

\renewcommand\tableofcontents
{\thispagestyle{content}%
\centerline{\normalfont\Large\bfseries\contentsname}
\vskip 2ex%
\@starttoc{toc}%
\thispagestyle{content}
}

\setcounter{totalnumber}{4}
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\renewcommand{\figurename}{Figure}
\renewcommand{\tablename}{Table}
\graphicspath{{./}{./img/}{./fig/}{./image/}{./figure/}{./picture/}
            {./imgs/}{./figs/}{./images/}{./figures/}{./pictures/}}

\def\maketitle{%
  \let\saved@thepage\thepage
  \let\thepage\relax
  \makesheet
  \newpage
  \let\thepage\saved@thepage
  \setcounter{page}{1}
  \pagestyle{fancy}
  %\clearpage
}

\newbox\@summary%
\setbox\@summary\hbox{}%
\long\def\summary{\bgroup\global\setbox\@summary\vbox\bgroup\hsize\textwidth}%
\def\endsummary{\egroup\egroup}
\def\make@summary{\usebox\@summary\par}


\newcommand{\headset}{\the\year\\MCM/ICM\\Summary Sheet}
% \newcommand{\headset}{2022\\MCM/ICM\\Summary Sheet}         % 强行改为需要的年份
\newcommand{\problem}[1]{\mcmsetup{problem = #1}}
\def\makesheet{%
  \pagestyle{empty}%
  \null%
  \vspace*{-15ex}
  %\vspace*{-1in}%
  \begin{center}
  \begingroup
  \setlength{\parindent}{0pt}
  %\iffalse
  \begin{tabular}{m{.3\textwidth}<{\centering} m{.225\textwidth}<{\centering} m{.375\textwidth}<{\centering}}
  \textbf{\large Problem Chosen} &\textbf{\large\the\year} & \textbf{\large Control Team Number} \\
  % \textbf{\large Problem Chosen} &\textbf{\large 2022} & \textbf{\large Control Team Number} \\ % 强行改为需要的年份
  \multirow{2}{0.3\textwidth}{\centering\Huge\textcolor{red}{\textbf{\MCM@opt@problem}}}
         & \textbf{\large MCM/ICM}  &
   \multirow{2}{0.375\textwidth}{\centering\Huge\textcolor{red}{\textbf{\MCM@opt@tcn}}} \\
			                    & \textbf{\large Summary}  &  \\
  \end{tabular}
  %\fi
  \iffalse
  \begin{minipage}[t]{0.33\linewidth}
     \bfseries\centering%
      Problem Chosen\\[0.7pc]
      {\Huge\textbf{\MCM@opt@problem}}\\[2.8pc]
     \end{minipage}%
     \begin{minipage}[t]{0.33\linewidth}
      \centering%
      \textbf{\headset}%
     \end{minipage}%
     \begin{minipage}[t]{0.33\linewidth}
      \centering\bfseries%
       Team Control Number\\[0.7pc]
      {\Huge\textbf{\MCM@opt@tcn}}\\[2.8pc]
     \end{minipage}\par
   \fi
  \par
  \rule{\linewidth}{1.5pt}
  \par
  \endgroup
  %\vskip -1ex%
  \ifMCM@opt@titleinsummary
    \normalfont \LARGE \@title \vskip -1ex
    \par
    %\vskip -.5ex
  \fi
  \end{center}
  \make@summary
}



\newtheorem{Theorem}{Theorem}[section]
\newtheorem{Lemma}[Theorem]{Lemma}
\newtheorem{Corollary}[Theorem]{Corollary}
\newtheorem{Proposition}[Theorem]{Proposition}
\newtheorem{Definition}[Theorem]{Definition}
\newtheorem{Example}[Theorem]{Example}

\definecolor{grey}{rgb}{0.8,0.8,0.8}
\definecolor{darkgreen}{rgb}{0,0.3,0}
\definecolor{darkblue}{rgb}{0,0,0.3}
\definecolor{mymauve}{rgb}{0.58,0,0.82}
\def\lstbasicfont{\fontfamily{pcr}\selectfont\footnotesize}
\lstset {%
   %numbers=left,
   %numberstyle=\small,%
    showstringspaces=false,
    showspaces=false,%
    tabsize=4,%
    % frame=lines,%
    frame = lrbt,                     % 魔改
    basicstyle={\footnotesize\lstbasicfont},%
    % keywordstyle=\color{darkblue}\bfseries,%
    keywordstyle=\color{blue},        % 魔改
    identifierstyle=,%
    commentstyle=\color{darkgreen},%\itshape,%
    stringstyle=\color{black}%
    numbers = left,                             % 以下均是魔改
    breaklines = true,
    numbersep = -1em,
    columns = fixed,                            % 自动换行
    stringstyle = \color{mymauve},              % string literal style
    numberstyle = \color{gray}
}
\lstloadlanguages{C,C++,Java,Matlab,Mathematica}
\endinput