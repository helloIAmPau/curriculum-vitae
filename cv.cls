\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2015/02/22 CV]

\LoadClass[a4paper]{article}
\RequirePackage[utf8]{inputenc}

\usepackage{xifthen}
\usepackage{etoolbox}

\setlength\parindent{0pt}
\usepackage[a4paper,total={210mm,297mm},top=20mm,left=30mm,bottom=20mm,right=7.5mm]{geometry}

\usepackage[strict]{changepage}

\RequirePackage{progressbar}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{fontawesome}
\RequirePackage{hyperref}
\RequirePackage{datetime}
%\pagenumbering{gobble}

\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\rfoot{\textcolor{gray}{\footnotesize page \thepage \hspace{1pt} of \pageref{LastPage}}}
%\usepackage{showframe}

\setmainfont[
  Path={fonts/},
  BoldFont={Aller_Bd.ttf},
  ItalicFont={Aller_It.ttf}
]{Aller_Rg.ttf}
\newfontfamily\FAW[Path=fonts/]{FontAwesome.otf}

\RequirePackage[document]{ragged2e}

\RequirePackage{float}

% Title with lines
\newcommand*\ruleline[1]{\par\noindent\raisebox{.8ex}{\makebox[.9\linewidth]{\hrulefill\hspace{1ex}\raisebox{-.8ex}{#1}\hspace{1ex}\hrulefill}}}

%%% Personal information commands %%%

\newcommand{\photo}[1] {
  \newcommand{\photoval}{#1}
}
\newcommand{\name}[1] {
  \newcommand{\nameval}{#1}
}
\newcommand{\surname}[1] {
  \newcommand{\surnameval}{#1}
}
\newcommand{\shortdesc}[1] {
  \newcommand{\shortdescval}{#1}
}
\newcommand{\telephone}[1] {
  \newcommand{\telephoneval}{#1}
}
\newcommand{\telephonemarkup}{
  \ifdef{\telephoneval}
    {\faPhone & \telephoneval\\}
    {}
}

\newcommand{\mobile}[1] {
  \newcommand{\mobileval}{#1}
}
\newcommand{\mail}[1] {
  \newcommand{\mailval}{#1}
}
\newcommand{\skypename}[1] {
  \newcommand{\skypenameval}{#1}
}
\newcommand{\githuburl}[1] {
  \newcommand{\githuburlval}{#1}
}
\newcommand{\linkedinurl}[1] {
  \newcommand{\linkedinurlvalue}{#1}
}
\newcommand{\borndate}[1] {
  \newcommand{\borndateval}{#1}
}
\newcommand{\location}[1] {
  \newcommand{\locationval}{#1}
}
\newcommand{\address}[1] {
  \newcommand{\addressval}{#1}
}
\newcommand{\qrcode}[1] {
  \newcommand{\qrcodeval}{#1}
}
\newcommand{\accademiclevel}[1] {
  \newcommand{\accademiclevelval}{#1}
}

%%% End personal information commands %%%

%%% Resume page commands %%%
\newcommand{\sectiontitle}[2]{
  \LARGE #1 \\ \large \ruleline{\uppercase{#2}} \\ \medskip \normalsize
}
\providecommand\faSkype{{\FAW\symbol{"F17E}}}
\providecommand\faUserSecret{{\FAW\symbol{"F21B}}}
\providecommand\faGraduationCap{{\FAW\symbol{"F19D}}}
\providecommand\faFlask{{\FAW\symbol{"F0C3}}}
\providecommand\faLinkedinSign{{\FAW\symbol{"F08C}}}
\providecommand\faCommentsAlt{{\FAW\symbol{"F0E6}}}

\newenvironment{cvsection}[2]{
  \medskip
  \begin{center}
    \sectiontitle{#1}{#2}
  \end{center}
  \begin{justify}
}{\end{justify}}

\newenvironment{resume}{
  \begin{adjustwidth}{-17.5mm}{}
    \begin{minipage}[c][.99\textheight][t]{.35\textwidth}
      \vspace{-2em}
      \begin{figure}[H]
        \centering
        \begin{tikzpicture}
          \node [inner sep=0pt] at (0,0) {\includegraphics[width=.4\textwidth]{\photoval}};
          \draw [white, rounded corners=.2cm, line width=.2cm] 
          (current bounding box.north west) --
          (current bounding box.north east) --
          (current bounding box.south east) --
          (current bounding box.south west) -- cycle
          ;
        \end{tikzpicture}
      \end{figure}
      \begin{center}
        \LARGE
        \MakeUppercase\nameval\\
        \MakeUppercase\surnameval
      \end{center}
      \begin{center}
        \small
        \MakeUppercase\shortdescval
      \end{center}
      %%% End Title %%%
      \bigskip
      %%% Begin About %%%
      \begin{center}
        \sectiontitle{\faUserSecret}{About}
      \end{center}
      \begin{tabular}{cl}
        \faCalendar & \borndateval\\
        \faHome & \addressval\\
        \faMapMarker & \locationval\\
        \faSignal & \accademiclevelval
      \end{tabular}
      %%% End About %%%
      \bigskip
      %%% Begin Contacts %%%
      \begin{center}
        \sectiontitle{\faBullhorn}{Contacts}
      \end{center}
      \begin{tabular}{cl}
        \telephonemarkup
        \faMobilePhone & \mobileval\\
        \faSkype & \skypenameval\\
        \faEnvelope & \url{\mailval}\\
        \faGithub & \url{\githuburlval}\\
        \faLinkedinSign & \url{\linkedinurlvalue}
      \end{tabular}
      %%% End Contacts %%%
      \vfill
      \begin{center}
        \includegraphics[width=.5\textwidth]{\qrcodeval}
      \end{center}
      \begin{center}
        \small Last update \today
      \end{center}
    \end{minipage}
    \hfill
    \vrule
    \hfill
    \begin{minipage}[c]{.6\textwidth}
  }{
  \end{minipage}
\end{adjustwidth}
\newpage
}

\newcommand{\level}[3]{
    \begin{minipage}[c]{.2\textwidth}
      #1
    \end{minipage}
    \begin{minipage}[c]{.5\textwidth}
      \centering
      \progressbar[roundnessa=2pt, ticksheight=0pt, width=\textwidth]{#3}
    \end{minipage}
    \begin{minipage}[c]{.1\textwidth}
      \textbf{#2}
    \end{minipage}
}

%%% End resume page commands %%%

\newcommand{\cvitem}[4]{
  \begin{center}
    \begin{minipage}[t]{.15\textwidth}
      \begin{flushright}
        #1
      \end{flushright}
    \end{minipage}
    \hfill
    \begin{minipage}[t]{.8\textwidth}
      {#2}\\
      {#3}
      \ifthenelse{\not\(\equal{#3}{} \or \equal{#4}{}\)}{
        \newline
      }{}
      \ifthenelse{\not \equal{#4}{}}{
        \vspace{.5em}
        #4
      }{}
    \end{minipage}
  \end{center}
}
