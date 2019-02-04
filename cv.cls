\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

% Font size and paper type
\LoadClass[11pt,letterpaper]{article}

% Remove paragraph indentation
\usepackage[parfill]{parskip}

\usepackage{array} 
\usepackage{ifthen}

% Suppress page numbers
\pagestyle{empty}

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}}
\def \@name {}

\def \addressSep {$\diamond$}

% One or two address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1
{
    \@ifundefined{@addresstwo}
    {
        \def \@addresstwo {#1}
    }
    
    \def \@addressone {#1}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1
{
    \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
    \endgroup
    \par
    \addressskip
}

% \printname is used to print the name as a page header
\def \printname
{
    \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip
    \break
    \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

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

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
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

%----------------------------------------------------------------------------------------
%	EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

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

% The below commands define the white space after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge}
\def\addressskip{\smallskip}
\def\sectionlineskip{\medskip}
\def\nameskip{\bigskip}
\def\sectionskip{\medskip}
