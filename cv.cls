\ProvidesClass{cv}[2010/07/10 v0.9 CV class]

\LoadClass[12pt, letterpaper]{article}

\usepackage[parfill]{parskip}
\usepackage{array} 
\usepackage{ifthen}

\pagestyle{empty}

\def \name#1{\def\@name{#1}}
\def \@name {}

\def \addressSep {$\diamond$}

\let \@addressone \relax
\let \@addresstwo \relax

\def \address #1
{
    \@ifundefined{@addresstwo}
    {
        \def \@addresstwo {#1}
    }
    
    \def \@addressone {#1}
}

\def \printaddress #1
{
    \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
    \endgroup
    \par
    \addressskip
}

\def \printname
{
    \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip
    \break
    \endgroup
}

\let\ori@document=\document

\renewcommand{\document}
{
    \ori@document
  
    \printname
  
    \@ifundefined{@addressone}{}
    {
        \printaddress{\@addressone}
    }
  
    \@ifundefined{@addresstwo}{}
    {
        \printaddress{\@addresstwo}
    }
    
    \@ifundefined{@addressthree}{}
    {
        \printaddress{\@addressthree}
    }
}

\newenvironment{rSection}[1]
{
    \sectionskip
    \MakeUppercase{\bf #1}
    \sectionlineskip
    \hrule
  
    \begin{list}{}
    {
        \setlength{\leftmargin}{1.5em}
    }
    
    \item[]
}
{
    \end{list}
}

\newenvironment{rSubsection}[4]
{
    {\bf #1} \hfill {#2}
    \ifthenelse{\equal{#3}{}}{}
    {
        \\
        {\em #3} \hfill {\em #4}
    }
    
    \smallskip
    \begin{list}{}{\leftmargin=0em}
    \itemsep -0.5em \vspace{-0.5em}
}
{
    \end{list}
    \vspace{0.5em}
}

\def\namesize{\huge}
\def\addressskip{\smallskip}
\def\sectionlineskip{\medskip}
\def\nameskip{\bigskip}
\def\sectionskip{\medskip}
