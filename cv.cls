\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2015/02/22 CV]

\LoadClass{article}
\RequirePackage[utf8]{inputenc}

\usepackage{ifthen}

\setlength\parindent{0pt}
\usepackage[top=.3in,bottom=.3in,right=.3in]{geometry}
\RequirePackage{progressbar}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{fontawesome}
\RequirePackage{hyperref}
\RequirePackage{datetime}
\pagenumbering{gobble}

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

\newenvironment{cvsection}[2]{
  \begin{center}
    \sectiontitle{#1}{#2}
  \end{center}
  \begin{justify}
}{\end{justify}}

\newenvironment{resume}{
  \newgeometry{margin=0.3in}
  \begin{minipage}[t][.99\textheight][t]{.35\textwidth}
    \vspace{-3em}
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
      \faPhone & \telephoneval\\
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
  \vrule
  \hfill
  \begin{minipage}[t][.99\textheight][t]{.6\textwidth}
}{
  \end{minipage}
  \restoregeometry
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
      \flushright
      #1
    \end{minipage}
    \hfill
    \begin{minipage}[t]{.8\textwidth}
      {#2}\\
      {#3}
      \ifthenelse{\equal{#4}{}}{}{
        \newline
        \vspace{.5em}
        #4
      }
    \end{minipage}
  \end{center}
}
