\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2015/02/22 CV]

\RequirePackage[utf8]{inputenc}
\LoadClass{article}

\usepackage[margin=0.3in]{geometry}
\RequirePackage{graphicx}
\RequirePackage{fontawesome}
\RequirePackage{hyperref}
\RequirePackage{datetime}
\renewcommand*{\familydefault}{\sfdefault}
\pagenumbering{gobble}

\fontspec[Path=fonts/]{FontAwesome.otf}

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
\providecommand\faSkype{{\FA\symbol{"F17E}}}

\newenvironment{resume}{
  \begin{minipage}[t][.99\textheight][t]{.35\textwidth}
    %%% Begin Title %%%
    \begin{center}
      \includegraphics[width=.4\textwidth]{\photoval}
    \end{center}
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
      \sectiontitle{\faUser}{About}
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
  \begin{minipage}{.65\textwidth}
}{
  \end{minipage}
}

%%% End resume page commands %%%

