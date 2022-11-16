\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PurdueThesisNL}[2022-10-05 Purdue thesis (LaFarge Update: 11/12)]
\newcommand{\PurdueThesisVersion}{PurdueThesis 2022-10-05-NLv1}

\LoadClass[12pt]{report}[2019/12/20]
\def\contentsname{TABLE OF CONTENTS}
\newlength{\ZZlengtha}



% Defines \AlphAlph so we can have over 26 appendices, chapter appendices, etc.
\usepackage{alphalph}

% ------------ BEGIN: UNOFFICIAL .CLS CHANGES ------------
%      Added by Nick LaFarge (11/12/2022)
% To enable a "quick" build process that doesn't need 
% LuaTeX or XeTeX by removing the fontspec dependency
\newboolean{usefontspec}
\usepackage{ifthen}
\RequirePackage{xkeyval}

% Set default values
\def\ZZshowgridlines{false}
\def\ZZshowmarginlines{false}
\def\ZZshowtimestamp{false}
\def\ZZtodonotes{false}
\setboolean{usefontspec}{false}
\newcommand{\@biblatex@backend}{bibtex}

% Draft watermark
\usepackage{draftwatermark}
\SetWatermarkScale{0.4}
\SetWatermarkLightness{0.93}
\SetWatermarkText{DRAFT}

% Set up each of the build modes
\ifthenelse{\equal{\ZZbuildmode}{quick}}
{
  \def\ZZtodonotes{true}
}{}
\ifthenelse{\equal{\ZZbuildmode}{debug}}
{
  \def\ZZtodonotes{true}
  % \def\ZZshowgridlines{true} % uncomment to include grid lines
  \def\ZZshowmarginlines{true}
  \def\ZZshowtimestamp{true}
}{}
\ifthenelse{\equal{\ZZbuildmode}{proof}}
{
  % \setboolean{usefontspec}{true}
  % \newcommand{\@biblatex@backend}{biber}
   
  \SetWatermarkText{PROOF}
}{}
\ifthenelse{\equal{\ZZbuildmode}{final}}
{
  \setboolean{usefontspec}{true}
  \newcommand{\@biblatex@backend}{biber} 
  \SetWatermarkText{}
}{}
% ------------ END: UNOFFICIAL .CLS CHANGES ------------


% The amsmath package is automatically loaded by the mathtools package.
% From
% http://ctan.mirrors.hoobly.com/macros/latex/required/amscls/doc/amsthdoc.pdf
%     The amsthm package provides an enhanced version of LATEX’s
%     \newtheoremcommand for defining theorem-like environments.  The
%     enhanced \newtheorem recognizes a\theoremstyle specification (as
%     in Mittelbach’stheorempackage) and has a * form for defining
%     unnumbered environments.  The amsthm package also defines a
%     proof environment that automatically adds a QED symbol at the
%     end.  AMS document classes incorporate the amsthm package, so
%     everything described here applies to them as well.
\usepackage{amsthm}

% Extend the array and tabular environments.
% See
%     https://www.ctan.org/pkg/array
\usepackage{array}

% Provide fancy boxes.
% See
%     https://ctan.org/pkg/fancybox?lang=en
\usepackage{fancybox}
  \newenvironment{CenteredBox}
    {\begin{Sbox}}%
    {%
      \end{Sbox}%
      \centerline{\parbox{\wd\@Sbox}{\TheSbox}}%
    }

% Provide color extensions.
% See
%     https://ctan.org/pkg/xcolor?lang=en
\usepackage{xcolor}

% Provides support for setting the spacing between lines in a docment.
% See
%     https://ctan.org/pkg/setspace?lang=en
\usepackage{setspace}

% Use hyperlinks for cross-references.
%
% Based on information in
% http://ftp.math.purdue.edu/mirrors/ctan.org/macros/latex/contrib/hyperref/doc/manual.pdf
%     Make sure [hyperref -mark] comes last of your loaded packages,
%     to give it a fighting chance of not being over-written, since
%     its job is to redefine many LATEX commands.
%
% From
% http://mirrors.ibiblio.org/CTAN/macros/latex/contrib/biblatex/doc/biblatex.pdf
%     When using the hyperref package, it is preferable to load it
%     after biblatex.
%
% This must be loaded before the breakurl package.
%
% The options and what they do:
%     OPTION            DESCRIPTION
%     breaklinks        (default false) Allow links to break across lines by
%                       making links over multiple lines into PDF links to
%                       the same target.
%     colorlinks        (default false) Colors the text of links and anchors
%                       instead of putting ugly colored boxes around them.
%                       See anchorcolor, citecolor, filecolor, linkcolor,
%                       menucolor, and runcolor for color of links.
%     hypertexnames     (default true) Use guessable names for links.  The
%                       hypertexnames=false option makes sure that the link
%                       to the, for example, second appendix doesn't go to
%                       the second chapter.
%     linktoc           (default section) Make text (section), page number
%                       (page), both (all), or nothing (none) be link on
%                        TOC, LOF, and LOT.
%     ocgcolorlinks      Use colored links when viewed, but don't print
%                        links in a separate color.  A better implementation
%                        which hasn't the disadvantage to prevent line breaks
%                        is in the ocgx2 package.
%     pdfencoding        What kind of encoding to use for bookmarks and
%                        information directory entries.  ``auto'' uses
%                        PDFDocEncoding or, if necessary, unicode.  ``pdfdoc''
%                        uses PDFDocEncoding.  ``unicode'' uses Unicode.
%     psdextra           Define more short names for PDF string commands.
%
%   I used "Sky blue" for every link color as ok'd by Ashlee Messersmith
% <amiley@purdue.edu> and Anita Sale <aasale@iupui.edu>.  See Figure 2 of
%     https://www.nature.com/articles/nmeth.1618
% Sky blue in RGB is (86/255, 180/255, 233/255) = (0.337, 0.706, 0.914).
%   Sky blue was too light a color.  I'm tried, from that same web page,
% "Blue".  "Blue" was still a little light.
%   Ashlee Messersmith suggested (0.129, 0.298, 0.808).
%   Ashlee Messersmith <amiley@purdue.edu> and Anita Sale <aasale@iupui.edu>
% both approved (0.129, 0.298, 0.808) after seeing it.
%
%   From section 3.5, "Extension Options", of
%     http://ctan.math.washington.edu/tex-archive/macros/latex/contrib/hyperref/doc/manual.pdf
%     OPTION       TYPE   COLOR      DESCRIPTION
%     linkcolor    color  red        Color for normal internal links.
%     anchorcolor  color  black      Color for anchor text.
%                                    Ignored by most drivers.
%     citecolor    color  green      Color for bibliographical citations
%                                    in text.
%     filecolor    color  cyan       Color for URLs which open local files.
%     menucolor    color  red        Color for Acrobat menu items.
%     runcolor     color  filecolor  Color for run links (launch annotations).
%     urlcolor     color  magenta    Color for linked URLs.
%     allcolors    color             Set all color options (without border and
%                                    field options).
%     Note that all color names must be defined before use, following the
%     normal system of the standard LaTeX color package.
%
%   I'm using the color name myblue to avoid any conflicts with any
% built-in LaTeX colors.
\definecolor{myblue}{rgb}{0.129, 0.298, 0.808}
\usepackage
  [
    allcolors     = myblue,
    breaklinks    = true,
    colorlinks    = true,
    hypertexnames = false,
    linktoc       = page,    % was "section"
    pdfencoding   = auto,
    psdextra      = true,
  ]
  {hyperref}
    % Put URLs in roman font to save space.
    \urlstyle{rm}

% ????
\usepackage[symbol=$\uparrow$]{footnotebackref}

% Let links wrap around line and page breaks.
\usepackage[ocgcolorlinks]{ocgx2}

% Tho Van Le <le39@purdue.edu> wrote on 2018-09-24 at 12:57:
% To: Thesis Help <thesishelp@purdue.edu>
% Subject: Codes to correct the unbreakable URL
% |  Hello Ashlee,
% |
% |  As mentioned after your presentation at Civil engineering, I am
% |  sending you codes to break url as below. Feel free to use it in the
% |  latex template.
% |
% |  \usepackage[hyphenbreaks]{breakurl}
% |  \usepackage[hyphens]{url}
% |  \sloppy
% I have not tested this.
% Define
%     toprule[<width>]
%     midrule[<width>]
%     bottomrule[<width>]
% for tables.
% See
%     https://www.ctan.org/pkg/booktabs?lang=en
\usepackage{booktabs}
% Break URLs between lines.
% This must be loaded after the hyperref package.
% xxx
% xxx This causes a
% xxx     Package breakurl Warning: You are using breakurl while processing via pdflatex.
% xxx error.  I'm going to comment it out.
% xxx
% xxx \usepackage{breakurl}
% Allow +, -, *, and / arithmetic in LaTeX.
% See
%     https://ctan.org/tex-archive/macros/latex/required/tools/calc.pdf
% \usepackage{calc}
% for DOI links in bibliography
% xxx
% xxx Trying to load this causes
% xxx     ! LaTeX Error: Command \maketitle already defined.
% xxx                    Or name \end.. illegal, see p.192 of the manual.
% xxx
% xxx \usepackage{doi}

% Frank Mittelbach <frank.mittelbach@latex-project.org> wrote on 2022-05-19:
%     expl3 (under the name of L3 programming layer) is now part of LaTeX,
%     so there is no need to load it as a package and you can say you are
%     programming LaTeX if you use it -- over time we will move more and
%     more of the internals to the new programming methodology
%     (I tested this and he apparently means in TeX Live 2022.)
% Use LaTeX 3 programming constructs in LaTeX 2e.
% See
%     https://ctan.math.illinois.edu/macros/latex/contrib/l3kernel/interface3.pdf

\ExplSyntaxOn
  \cs_generate_variant:Nn \prop_get:NnNTF {NV}
  \cs_generate_variant:Nn \regex_match:nnTF {nV}
  \cs_generate_variant:Nn \str_case:nnTF {V}
  \def\str_case:Vn#1#2{\str_case:VnTF{#1}{#2}{}{}}
\ExplSyntaxOff

% Allows \H{o} to work.
% ------------ BEGIN: UNOFFICIAL .CLS CHANGES ------------
%      Added by Nick LaFarge (11/12/2022)
% fontspec is not loaded if the quick-build option is enabled.
%      \usepackage{fontspec}
\ifthenelse{\boolean{usefontspec}}{\usepackage{fontspec}}{}
% ------------ END: UNOFFICIAL .CLS CHANGES ------------

% Provides the \ifpdf command.
% See
%     https://ctan.org/pkg/ifpdf?lang=en
\usepackage{ifpdf}

% The ifthen package gets loaded by something else and defines the
%     \ifthenelse
%     \newboolean
%     \provideboolean
%     \setboolean
%     \whiledo
% commands.
% See
%     https://ctan.org/pkg/ifthen?lang=en
% This defines
%     \ifthen{condition}{do if true}
\newcommand{\ifthen}[2]{\ifthenelse{#1}{#2}{}}




% From
%     https://tex.stackexchange.com/questions/147194/is-it-still-useful-to-load-the-lmodern-package/147206#147206
% I understand it is still a good idea to load lmodern.
\usepackage{lmodern}

% Place selected parts of a document in landscape mode.
% See
%     https://ctan.org/pkg/lscape?lang=en
\usepackage{lscape}

%\usepackage[utf8]{luainputenc}

% Ltxtable provides the functionality of longtable and tabularx
% together inside a longtable environment.
% See
%     https://ctan.org/pkg/ltxtable?lang=en
\usepackage{ltxtable}

\usepackage{pgffor}

% Provide different sorts of rotation.
% See
%     https://ctan.org/pkg/rotating?lang=en
% \usepackage{rotating}

% Typeset SI units.
% See
%     https://mirror.math.princeton.edu/pub/CTAN/macros/latex/contrib/siunitx/siunitx.pdf
\usepackage{siunitx}
  \DeclareBinaryPrefix\kibi{Ki}{10}
  \DeclareBinaryPrefix\mebi{Mi}{20}
  \DeclareBinaryPrefix\gibi{Gi}{30}
  \DeclareBinaryPrefix\tebi{Ti}{40}
  \DeclareBinaryPrefix\pebi{Pi}{50}
  \DeclareBinaryPrefix\exbi{Ei}{60}
  \DeclareBinaryPrefix\zebi{Zi}{70}
  \DeclareBinaryPrefix\yobi{Yi}{80}
  % See page 61 of
  %     https://mirror.las.iastate.edu/tex-archive/macros/latex/contrib/siunitx/siunitx.pdf
  \DeclareSIUnit \nounit  {\relax}                              % no unit
  \DeclareSIUnit \AA      {\SIUnitSymbolAngstrom}               % \angstrom
  \DeclareSIUnit \arcmin  {\SIUnitSymbolArcminute}              % \arcminute
  \DeclareSIUnit \arcsec  {\SIUnitSymbolArcsecond}              % \arcsecond
  \DeclareSIUnit \au      {au}                                  % \astronomicalunit
  \DeclareSIUnit \b       {b}                                   % \barn
  % Unit macro \bar has been deprecated in release {2021-08-04} {3.0.24}.
  % The BIPM have removed this unit from the SI Brochure.
  % You should define it yourself using \DeclareSIUnit in
  % your source.  The current definition is
  \DeclareSIUnit \bar     {bar}                                 % bar
  \DeclareSIUnit \Bq      {Bq}                                  % \becquerel
  \DeclareSIUnit \B       {B}                                   % \bel
  % Unit macro \bohr has been deprecated in release {2021-08-04} {3.0.24}.
  % The BIPM have removed this unit from the SI Brochure.
  % You should define it yourself using \DeclareSIUnit in
  % your source.  The current definition is
  \DeclareSIUnit\bohr{\text {\ensuremath {a}}_{0}}
  \DeclareSIUnit \bu      {bu}                                  % bushel
  \DeclareSIUnit \cd      {cd}                                  % \candela
  \DeclareSIUnit \C       {C}                                   % \coulomb
  \DeclareSIUnit \Da      {Da}                                  % \dalton
  \DeclareSIUnit \d       {d}                                   % \day
  \DeclareSIUnit \ec      {\text{\ensuremath{e}}}               % \elementarychange
  \DeclareSIUnit \em      {\text{\ensuremath{m_{\textup{e}}}}}  % \electronmasss
  \DeclareSIUnit \ft      {ft}                                  % foot
  \DeclareSIUnit \Gy      {Gy}                                  % \Gy
  \DeclareSIUnit \H       {H}                                   % \henry
  \DeclareSIUnit \ha      {ha}                                  % \hectare
  % Unit macro \hartree has been deprecated in release {2021-08-04} {3.0.24}.
  % The BIPM have removed this unit from the SI Brochure.
  % You should define it yourself using \DeclareSIUnit in
  % your source.  The current definition is
  \DeclareSIUnit \hartree  {\text {\ensuremath {E}}_{\mathrm {h}}}  % \hartree
  \DeclareSIUnit \h       {h}                                   % \hour
  \DeclareSIUnit \hp      {hp}                                  % horsepower
  \DeclareSIUnit \in      {in}                                  % inch
  \DeclareSIUnit \kat     {kat}                                 % \katal
  \DeclareSIUnit \K       {K}                                   % \kelvin
  \DeclareSIUnit \kn      {kn}                                  % \knot
  \DeclareSIUnit \lb      {lb}                                  % pound
  \DeclareSIUnit \lm      {lm}                                  % \lumen
  \DeclareSIUnit \lx      {lx}                                  % \lux
  \DeclareSIUnit \MJ      {MJ}                                  % \mega\joule
  \DeclareSIUnit \mbar    {mbar}                                % \milli\bar
  \DeclareSIUnit \min     {min}                                 % \minute
  % Unit macro \hartree has been deprecated in release {2021-08-04} {3.0.24}.
  % The BIPM have removed this unit from the SI Brochure.
  % You should define it yourself using \DeclareSIUnit in
  % your source.  The current definition is
  \DeclareSIUnit \mmHg    {mmHg}                                % millimeter of mercury
  \DeclareSIUnit \M       {M}                                   % \nauticalmile
  \DeclareSIUnit \Np      {Np}                                  % \neper
  % Unit macro \planckbar has been deprecated in release {2021-08-04} {3.0.24}.
  % The BIPM have removed this unit from the SI Brochure.
  % You should define it yourself using \DeclareSIUnit in
  % your source.  The current definition is
  \DeclareSIUnit \planckbar  {\text {\ensuremath {\hbar}}}      % planckbar
  \DeclareSIUnit \rad     {rad}                                 % \radian
  \DeclareSIUnit \S       {S}                                   % \siemens
  % Unit macro \clight has been deprecated in release {2021-08-04} {3.0.24}.
  % The BIPM have removed this unit from the SI Brochure.
  % You should define it yourself using \DeclareSIUnit in
  % your source.  The current definition is
  \DeclareSIUnit \clight  {\text {\ensuremath {c}}_{0}}         % speed of light
  \DeclareSIUnit \SD      {SD}                                  % standard deviation
  \DeclareSIUnit \Sv      {Sv}                                  % \sievert
  \DeclareSIUnit \sr      {sr}                                  % \steradian
  \DeclareSIUnit \T       {T}                                   % \tesla
  \DeclareSIUnit \t       {t}                                   % \tonne
  \DeclareSIUnit \Wb      {Wb}                                  % \weber
  \DeclareSIUnit \yd      {yd}                                  % yard
  \DeclareSIUnit \y       {y}                                   % year

% Provide an interface to typeset subcaptions.
% See
%     https://ctan.org/pkg/subcaption?lang=en
\usepackage[labelsep=space]{subcaption}

  %%%% \usepackage{url}
  %%%% \usepackage{xkeyval}

% Provide longtable support with possible X column specifier.
% See
%     https://ctan.org/pkg/xltabular?lang=en
% \usepackage{xltabular}

% Patch existing commands.
% See
%     https://ctan.org/pkg/xpatch/?lang=en
\usepackage{xpatch}

% Provide a high-level interface for producing document-level commands.
% See
%     https://ctan.org/pkg/xparse?lang=en
% \usepackage{xparse}



\ExplSyntaxOn

% ------------ BEGIN: UNOFFICIAL .CLS CHANGES ------------
%      Added by Nick LaFarge (11/12/2022)
%
% The following lines were removed
%       \catcode`\▯=\active
%       \def▯{\space }
% All instances in this document of ▯ were replaced with ~
% ------------ END: UNOFFICIAL .CLS CHANGES ------------
   
  

  \newcommand{\ZZAbort}
    {
      \ZZM{ABORTING...}
      \ZZM{}
      \ZZM{}
      \stop
    }

  \newcommand{\ZZDebuggingMessage}{Debugging...}
  \newcounter{ZZcountersavedpagenumber}
  \newcounter{ZZprevindex}
  %%%% \newcommand{\ZZauthor}{\relax}
  %%%% \DeclareOptionX{author}{\renewcommand{\ZZauthor}{#1}}
  %%%% \newcommand{\ZZcampus}{\relax}
  %%%% \DeclareOptionX{campus}{\renewcommand{\ZZcampus}{#1}}
  %%%% \newcommand{\ZZdegree}{\relax}
  %%%% \DeclareOptionX{degree}{\renewcommand{\ZZdegree}{#1}}
  \newcommand{\ZZcommittee}{\relax}
  %%%% \DeclareOptionX{committee}{\renewcommand{\ZZcommittee}{#1}}
  %%%% \newcommand{\ZZdocument}{thesis}
  %%%% \DeclareOptionX{document}{\renewcommand{\ZZdocument}{#1}}
  \newcommand{\ZZexamcommittee}{\relax}
  %%%% \DeclareOptionX{examcommittee}{\renewcommand{\ZZexamcommittee}{#1}}
  %%%% \newcommand{\ZZgraduation}{\relax}
  %%%% \DeclareOptionX{graduation}{\renewcommand{\ZZgraduation}{#1}}
  %%%% \newcommand{\ZZinstitution}{\relax}
  %%%% \DeclareOptionX{institution}{\renewcommand{\ZZinstitution}{#1}}
  \newcommand{\ZZkeywords}{\relax}
  %%%% \DeclareOptionX{keywords}{\renewcommand{\ZZkeywords}{#1}}
  \newcommand{\ZZmajorprofs}{\relax}
  %%%% \DeclareOptionX{majorprofs}{\renewcommand{\ZZmajorprofs}{#1}}
  %%%% \newcommand{\ZZprogram}{\relax}
  %%%% \DeclareOptionX{program}{\renewcommand{\ZZprogram}{#1}}
  \newcommand{\ZZprogramhead}{\relax}
  %%%% \DeclareOptionX{programhead}{\renewcommand{\ZZprogramhead}{#1}}
  %%%% \newcommand{\ZZtitle}{\relax}
  %%%% \DeclareOptionX{title}{\renewcommand{\ZZtitle}{#1}}
  \newcommand{\ZZabbreviationsname}{ABBREVIATIONS}
  %%%% \DeclareOptionX{abbreviationsname}{\renewcommand{\ZZabbreviationsname}{#1}}
  \newcommand{\ZZabstractname}{ABSTRACT}
  %%%% \DeclareOptionX{abstractname}{\renewcommand{\ZZabstractname}{#1}}
  \newcommand{\ZZacknowledgmentsname}{ACKNOWLEDGMENTS}
  %%%% \DeclareOptionX{acknowledgmentsname}{\renewcommand{\ZZacknowledgmentsname}{#1}}
  \renewcommand{\baselinestretch}{1.5}
  %%%% \DeclareOptionX{baselinestretch}{\renewcommand{\baselinestretch}{#1}}
  \newcommand{\ZZchapterblankpages}{false}
  %%%% \DeclareOptionX{chapterblankpages}{\renewcommand{\ZZchapterblankpages}{#1}}
  \newcommand{\ZZcoversheets}{false}
  %%%% \DeclareOptionX{coversheets}{\renewcommand{\ZZcoversheets}{#1}}
  \newcommand{\ZZdebuglevel}{99}
  %%%% \DeclareOptionX{debuglevel}{\renewcommand{\ZZdebuglevel}{#1}}
  \newcommand{\ZZdebugoptions}{false}
  %%%% \DeclareOptionX{debugoptions}{\renewcommand{\ZZdebugoptions}{#1}}
  \newcommand{\ZZdebugorder}{false}
  %%%% \DeclareOptionX{debugorder}{\renewcommand{\ZZdebugorder}{#1}}
  \newcommand{\ZZdebugparameters}{false}
  %%%% \DeclareOptionX{debugparameters}{\renewcommand{\ZZdebugparameters}{#1}}
  %%%% \newcommand{\ZZshowdiagonalline}{false}
  %%%% \DeclareOptionX{showdiagonalline}{\renewcommand{\ZZshowdiagonalline}{#1}}
  \newcommand{\ZZendnotes}{false}
  %%%% \DeclareOptionX{endnotes}{\renewcommand{\ZZendnotes}{#1}}
  \newcommand{\ZZfrenchspacing}{false}
  %%%% \DeclareOptionX{frenchspacing}{\renewcommand{\ZZfrenchspacing}{#1}}
  %%%% \newcommand{\ZZshowgridlines}{false}
  %%%% \DeclareOptionX{showgridlines}{\renewcommand{\ZZshowgridlines}{#1}}
  \newcommand{\ZZglossaryname}{GLOSSARY}
  %%%% \DeclareOptionX{glossaryname}{\renewcommand{\ZZglossaryname}{#1}}
  \newcommand{\ZZiso}{false}
  %%%% \DeclareOptionX{iso80000-2}{\renewcommand{\ZZiso}{#1}}
  \newcommand{\ZZlistoffiguresname}{LIST~OF~FIGURES}
  \newcommand{\ZZlistoflistingsname}{LIST~OF~LISTINGS}
  %%%% \DeclareOptionX{listoffiguresname}{\renewcommand{\ZZlistoffiguresname}{#1}}
  \newcommand{\ZZlistofprotocolsname}{LIST~OF~PROTOCOLS}
  %%%% \DeclareOptionX{listofprotocolsname}{\renewcommand{\ZZlistofprotocolsname}{#1}}
  \newcommand{\ZZlistofschemesname}{LIST~OF~SCHEMES}
  %%%% \DeclareOptionX{listofschemesname}{\renewcommand{\ZZlistofschemesname}{#1}}
  \newcommand{\ZZlistoftablesname}{LIST~OF~TABLES}
  %%%% \DeclareOptionX{listoftablesname}{\renewcommand{\ZZlistoftablesname}{#1}}
  %%%% \newcommand{\ZZshowmarginlines}{false}
  %%%% \DeclareOptionX{showmarginlines}{\renewcommand{\ZZshowmarginlines}{#1}}
  \newcommand{\ZZnomenclaturename}{NOMENCLATURE}
  %%%% \DeclareOptionX{nomenclaturename}{\renewcommand{\ZZnomenclaturename}{#1}}
  \newcommand{\ZZoutput}{pdf}
  %%%% \DeclareOptionX{output}{\renewcommand{\ZZoutput}{#1}}
  \newcommand{\ZZprefacename}{PREFACE}
  %%%% \DeclareOptionX{prefacename}{\renewcommand{\ZZprefacename}{#1}}
  \newcommand{\ZZsymbolsname}{LIST~OF~SYMBOLS}
  %%%% \DeclareOptionX{symbolsname}{\renewcommand{\ZZsymbolsname}{#1}}
  \newcommand{\ZZtableofcontentsname}{TABLE~OF~CONTENTS}
  %%%% \DeclareOptionX{tableofcontentsname}{\renewcommand{\ZZtableofcontentsname}{#1}}
  %%%% \newcommand{\ZZshowtimestamp}{false}
  %%%% \DeclareOptionX{showtimestamp}{\renewcommand{\ZZshowtimestamp}{#1}}
  %%%% \newcommand{\ZZtodonotes}{false}
  %%%% \DeclareOptionX{todonotes}{\renewcommand{\ZZtodonotes}{#1}}
  \newcommand{\ZZvitaname}{VITA}
  %%%% \DeclareOptionX{vitaname}{\renewcommand{\ZZvitaname}{#1}}
  %%%% \ProcessOptionsX
  %%%% \str_replace_all:Nnn \ZZinstitution {@} {~}
  %%%% \str_replace_all:Nnn \ZZcampus {@} {~}
  %%%% \str_replace_all:Nnn \ZZprogram {@} {~}
  %%%% \str_replace_all:Nnn \ZZdegree {@} {~}
  %%%% \str_replace_all:Nnn \ZZauthor {@} {~}
  %%%% \str_replace_all:Nnn \ZZdocument {@} {~}
  %%%% \str_replace_all:Nnn \ZZgraduation {@} {~}
  %%%% \str_replace_all:Nnn \ZZtitle {@} {~}
  %
  %  The bibliography configuration can't be before the \documentclass
  %  line because
  %      ! LaTeX Error: \usepackage before \documentclass.
  %
  %  From https://www.overleaf.com/learn/latex/Writing_your_own_class
  %      \RequirePackage is very similar to the well-known \usepackage,
  %      adding optional parameters within brackets will also work. The
  %      only difference is that the \usepackage can not be used before
  %      \documentclass command. It's strongly recommended to use
  %      \RequirePackage when writing new classes or packages.
  %
  %  When I put this bibliography stuff before the \documentclass command
  %  on 2020-11-24 the first entry of the bibliography started with
  %  "[1]Sexton" instead of "[1] Sexton".  I don't know why.
  %
  %  CONFIGURE THE BIBLIOGRAPHY
  %
  %  BibLaTeX and BibTeX are available to compile your bibliography.
  %  BibLaTeX is newer and more flexible than BibTeX.  BibTeX is old and
  %  not as flexible.  There are more bibliography styles available for
  %  BibTeX than BibLaTeX.  Use BibLaTeX if you can.  You can use
  %  BibLaTeX or BibTeX but not both.
  %
  %  Search for "REQUIRED PARAMETERS" above.  Mentally compute the
  %  string consisting of your INSTITUTION CODE, followed by a "-",
  %  followed by your CAMPUS CODE, followed by a "-", followed by your
  %  PROGRAM CODE (e.g., "pu-wl-aae").  Find "% " followed by that
  %  string followed space(s) in the list below.  Make a copy of that
  %  line below the line you found and remove the "% " followed by that
  %  string followed by space(s) in the list below.
  %
  %  You should do 1 or 2 but not both below.
  %
  %  1.  If you removed the string in the "BIBLATEX" section you'll be
  %      running BibLaTeX.  You also need to change
  %          % \addbibresource{all-biblatex.bib}
  %      to
  %          \addbibresource{all-biblatex.bib}
  %      since the information for the references is in the all.bib file.
  %
  %  2.  If you did this in the "BIBTEX" section you'll be running BibTeX.
  %
  %  You'll also need to make some changes in the "PRINT THE BIBLIOGRAPHY"
  %  section below.
  %
  %
  %  Define \ConfigureBibliography.
  %
  % Set \ZZBibProcessor to "BibLaTeX" or "BibTeX".
  % For BibLaTeX, do the appropriate
  %     \usepackage[...]{biblatex}
  % command.
  % For BibTeX, do the appropriate
  %     \bibliographystyle{..}
  % command.
  %
  % BIBLATEX OPTION             DESCRIPTION
  % backend   = biber           Use biber to process the bibliography.
  % citestyle = numeric-comp    Change [1],[3] to [1,3] and [1]--[3] to [1--3].
  % dashed    = false           Reprint repeated names, don't use a dash.
  % sortcites = true            Sort multiple citations.
  % style     = ..              Use the ... bibliography style.
  %
  \newcommand\ConfigureBibliography
    {

      % ------------ BEGIN: UNOFFICIAL .CLS CHANGES ------------
      %      Added by Nick LaFarge (11/12/2022)
      % Removed non pu-wl-aae sections for simplicity
      % ------------ END: UNOFFICIAL .CLS CHANGES ------------
  
      \ifthen{\equal{pu-wl-aae}{\ZZinscampro}}
        {
          
          % ------------ BEGIN: UNOFFICIAL .CLS CHANGES ------------
          %      Added by Nick LaFarge (11/12/2022)
          % Adjust the backend to support local compilation with bibtex (faster)
          % \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \usepackage[backend=\@biblatex@backend, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          % ------------ END: UNOFFICIAL .CLS CHANGES ------------
          
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      
    }


    % ZZ backslash
    \newcommand{\ZZbs}{\\@@backslashchar}

    % ZZ immediate write
    \newcommand{\ZZIW}[1]{\immediate\write16{#1}}

    % ZZ message
    \newcommand{\ZZM}[1]{\immediate\write16{#1}}

  %
  %  Define \PrintBibliography.
  %

  % See
  %     https://tex.stackexchange.com/questions/198551/biblatex-using-shorthands-and-numeric-style-label-sizes#:~:text=As%20mentioned%20in%20Biblatex%2C%20Use%20of%20prefixnumber%20changes,makes%20the%20labelwidth%20calculation%20local%20for%20each%20printbibliography.
  % for how to control labelnumberwidth on a per bibliography basis.
  %

  \newcommand\PrintBibliography
    {

      \makeatletter
        \defbibenvironment{bibliography}
          {%
            \list
            {%
              \printtext
                [labelnumberwidth]%
                {%
                  \printfield{prefixnumber}%
                  \printfield{labelnumber}%
                }%
            }%
            {%
              % See page 113 of LaTeX User's Guide and Reference Manual,
              % Leslie Lamport, second edition, November, 1994.
              \settowidth{\labelwidth}{[123]}
              \setlength{\labelsep}{1em}
              \setlength{\itemindent}{0pt}
              \setlength{\leftmargin}{\labelwidth}  \addtolength{\leftmargin}{\labelsep}
              \setlength{\listparindent}{0pt}
              % From page 112 and 114 of LaTeX User's Guide and Reference Manual,
              % Leslie Lamport, second edition, November, 1994.
              \setlength{\parsep}{6pt plus 1pt minus 1pt}
              \setlength{\itemsep}{0pt}
              % Outer (level 0) \def uses one #, level 1 uses two #,
              % level 2 uses four #---each new level uses twice the
              % number of # as previous level.
              \renewcommand*{\makelabel}[1]{####1\hfil}
            }%
          }
          {\endlist}
          {\item}
      \makeatother
      \begin{singlespace}
        % From
        % https://tex.stackexchange.com/questions/17360/reduce-spacing-in-bibliography-using-biblatex
        \bibitemsep = \baselineskip  % length between two different entries
        \bibnamesep = \baselineskip  % length between two entries of different author
        \bibinitsep = \baselineskip  % length between two entries of authors with different first letter
        % Do not split a bibliography entry between pages.
        % See
        %     https://tex.stackexchange.com/questions/43260/biblatex-no-pagebreak-in-bibliography-entry
        % From
        % https://tex.stackexchange.com/questions/152773/please-tutor-the-usage-of-patchcmd-and-xpatch
        %     I would consider patchcmd and \patchcommand as obsolete: with
        %     etoolbox the complete functionality of \patchcommand can be
        %     obtained with \pretocmd and \apptocmd and much more is possible
        %     with \patchcmd.
        % From
        % "The xpatch package Extending etoolbox patching commands"
        % http://ctan.math.washington.edu/tex-archive/macros/latex/contrib/xpatch/xpatch.pdf
        %     The well known etoolbox package provides a bunch of functions
        %     for patching existing commands; in particular \patchcmd,
        %     \pretocmd and \apptocmd that do a wonderful job, but suffer
        %     from a limitation:
        % This uses the \xpatchcmd command in the xpatch package.
        % Change \interlinepenalty=5000 to \interlinepenalty=10000 in \bibsetup.
        \xpatchcmd
          \bibsetup
          {\interlinepenalty=5000}
          {\interlinepenalty=10000}
          {\immediate\write16{changed~\interlinepenalty~to~10000}}
          {\immediate\write16{can't change \interline penalty to 10000}\stop}
        \printbibliography
          [
            heading         = {bibintoc},    % Put an entry in the table of contents.
            locallabelwidth = {true},
            title           = {REFERENCES},  % The title of the bibliography should be "REFERENCES".
            % block         = {nbpar},
          ]
        \endgraf
      \end{singlespace}
    }


  %
  %  Define \PrintChapterBibliography.
  %

  \def\PrintChapterBibliography
    {

      \defbibenvironment{bibliography}
        {%
          \list
            {%
              \printtext[labelnumberwidth]%
              {%
                \printfield{prefixnumber}%
                \printfield{labelnumber}%
              }%
            }%
            {%
              % Bibliography entries must not be split between pages.
              \interlinepenalty=10000
              \setlength{\bibhang}{0pt}%
              % In a reference that begins with "[10] L. E. van Dijk"
              % it is 0.33in from the left edge of the paper to "L".
              \setlength{\itemindent}{0.33in}%
              \setlength{\itemsep}{\bibitemsep}%
              \setlength{\leftmargin}{0pt}%
              \setlength{\parsep}{\bibparsep}%
              \setlength{\rightmargin}{0pt}%
            }%
        }
        {\endlist}
        {\item}
      \printbibliography[heading=subbibintoc]
    }

  \regex_match:nVTF
    {.+}
    \ZZauthor
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZauthor"~option.}
      \ZZM{"\ZZauthor"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.+}
      \ZZAbort
    }

  % \ZZmake defines \ZZadd and \ZZcheck.
  %
  % For examplee, doing \ZZmake{ins}{institution}
  %     o   defines \l_ins_prop and \l_ins_seq
  %     o   creates \ZZadd to add to \l_ins_prop and \l_ins_seq
  %     o   creates \ZZcheck to check if the \ZZinstitution is legal
  \def\ZZmake#1#2
    {
      \prop_new:c {l_#1_prop}
      \seq_new:c  {l_#1_seq}
      \def\ZZadd##1##2
        {
          \prop_put:cnn     {l_#1_prop} {##1} {##2}
          \seq_put_right:cn {l_#1_seq}  {##1}
        }
      \def\ZZcheck
        {
          \xdef\temp{\csname ZZ#2\endcsname}
          \prop_get:cVNTF
            {l_#1_prop}
            \temp  % don't know how to use, for example, "{ZZ#2}" here offhand
            \l_tmpb_tl
            % TRUE CODE
            {
              \ZZM{Setting~\ZZbs ZZ#1~to~"\l_tmpb_tl".}
              \tl_new:c     {ZZ#1}
              \tl_set_eq:cN {ZZ#1} \l_tmpb_tl
            }
            % FALSE CODE
            {
              \ZZM{Bad~"\ZZbs ZZ#2"~option.}
              \ZZM{"\csname ZZ#2\endcsname"~is~not~on~this~list:}
              \seq_map_inline:cn {l_#1_seq} {\ZZM{~~~~####1}}
              \ZZabort
            }
        }
    }

  \ZZmake {cam} {campus}
  \ZZadd  {West~Lafayette} {wl}
  \ZZcheck

  % ------------ BEGIN: UNOFFICIAL .CLS CHANGES ------------
  %      Added by Nick LaFarge (11/12/2022)
  % Removed non relevent degrees/campus options
  \ZZmake {deg} {degree}
  \ZZadd {Doctor~of~Philosophy}                                         {phd}
  \ZZadd {Master~of~Science}                                            {ms}
  \ZZadd {Master~of~Science~in~Aeronautics~and~Astronautics}            {msaa}
  % ------------ END: UNOFFICIAL .CLS CHANGES ------------
  \ZZcheck

  \regex_match:nVTF
    {.*}
    \ZZcommittee
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZcommittee"~option.}
      \ZZM{"\ZZcommittee"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.*}
      \ZZAbort
    }

  \ZZmake {doc} {document}
  \ZZadd {A~Dissertation}              {dissertation}
  \ZZadd {A~Directed~Research~Project} {adrp}
  \ZZadd {A~Master's~Bypass~Report}    {ambr}
  \ZZadd {A~Preliminary~Report}        {prelim}
  \ZZadd {A~Thesis}                    {thesis}
  \ZZcheck

  \regex_match:nVTF
    {.+}
    \ZZexamcommittee
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad+"ZZexamcommittee"+option.}
      \ZZM{"\ZZexamcommittee"+does+not+match+this+regular+expression:}
      \ZZM{~~~~.+}
      \ZZAbort
    }

  \ZZmake {gra} {graduation}
  \ZZadd {August~2020}   {1}
  \ZZadd {August~2021}   {1}
  \ZZadd {August~2022}   {1}
  \ZZadd {August~2023}   {1}
  \ZZadd {August~2024}   {1}
  \ZZadd {August~2025}   {1}
  \ZZadd {August~2026}   {1}
  \ZZadd {August~2027}   {1}
  \ZZadd {August~2028}   {1}
  \ZZadd {August~2029}   {1}
  \ZZadd {August~2030}   {1}
  \ZZadd {December~2022} {1}
  \ZZadd {December~2023} {1}
  \ZZadd {December~2024} {1}
  \ZZadd {December~2025} {1}
  \ZZadd {December~2026} {1}
  \ZZadd {December~2027} {1}
  \ZZadd {December~2028} {1}
  \ZZadd {December~2029} {1}
  \ZZadd {December~2030} {1}
  \ZZadd {May~2020}      {1}
  \ZZadd {May~2021}      {1}
  \ZZadd {May~2022}      {1}
  \ZZadd {May~2023}      {1}
  \ZZadd {May~2024}      {1}
  \ZZadd {May~2025}      {1}
  \ZZadd {May~2026}      {1}
  \ZZadd {May~2027}      {1}
  \ZZadd {May~2028}      {1}
  \ZZadd {May~2029}      {1}
  \ZZadd {May~2030}      {1}
  \ZZcheck

  \ZZmake {ins} {institution}
  \ZZadd {Purdue~University}    {pu}
  \ZZadd {University~of~Hawaii} {uh}
  \ZZcheck

  \regex_match:nVTF
    {.*}
    \ZZkeywords
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad+"ZZkeywords"+option.}
      \ZZM{"\ZZkeywords"+does+not+match+this+regular+expression:}
      \ZZM{++++.*}
      \ZZAbort
    }

  \regex_match:nVTF
    {.+}
    \ZZmajorprofs
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad+"ZZmajorprofs"+option.}
      \ZZM{"\ZZmajorprofs"+does+not+match+this+regular+expression:}
      \ZZM{~~~~.+}
      \ZZAbort
    }

  \ZZmake {pro} {program}
  \ZZadd {Aeronautics~and~Astronautics}                          {aae}
  \ZZcheck


  \regex_match:nVTF
    {.+}
    \ZZprogramhead
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZprogramhead"~option.}
      \ZZM{"\ZZprogramhead"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.+}
      \ZZAbort
    }

  \regex_match:nVTF
    {.+}
    \ZZtitle
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZtitle"~option.}
      \ZZM{"\ZZtitle"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.+}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZabbreviationsname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZabbreviationsname"~option.}
      \ZZM{"\ZZabbreviationsname"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.*}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZabstractname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZabstractname"~option.}
      \ZZM{"\ZZabstractname"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.*}
      \ZZAbort
    }

  % Legal \ZZacknowledgmentsname?
  \regex_match:nVTF
    {.*}
    \ZZacknowledgmentsname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZacknowledgmentsname"~option.}
      \ZZM{"\ZZacknowledgmentsname"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.*}
      \ZZAbort
    }

  % Legal \baselinestretch?
  \regex_match:nVTF
    {\d+(\.\d+)?}
    \baselinestretch
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"baselinestretch"~option.}
      \ZZM{"\baselinestretch"~does~not~match~this~regular~expression:}
      \ZZM{~~~~\string\d+(\string\.\string\d+)?}
      \ZZAbort
    }

  \prop_clear:N \l_tmpa_prop
  \prop_put:Nnn \l_tmpa_prop {false} {\c_false_bool}
  \prop_put:Nnn \l_tmpa_prop {true}  {\c_true_bool}
  \prop_get:NVNTF
    \l_tmpa_prop
    {\ZZchapterblankpages}
    \l_tmpa_tl
    % TRUE CODE
    {
      \ZZM{set+is+'ZZchapterblankpagesB'}
      \bool_new:N \ZZchapterblankpagesB
      \bool_set_eq:NN \ZZchapterblankpagesB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad~"chapterblankpages"~option.}
      \ZZM{"\ZZchapterblankpages"~is~not~on~this~list:}
      \ZZM{~~~~false}
      \ZZM{~~~~true}
      \ZZAbort
    }

  \prop_clear:N \l_tmpa_prop
  \prop_put:Nnn \l_tmpa_prop {false} {\c_false_bool}
  \prop_put:Nnn \l_tmpa_prop {true}  {\c_true_bool}
  \prop_get:NVNTF
    \l_tmpa_prop
    {\ZZshowcolophon}
    \l_tmpa_tl
    % TRUE CODE
    {
      \ZZM{set~is~'ZZshowcolophonB'}
      \bool_new:N \ZZshowcolophonB
      \bool_set_eq:NN \ZZshowcolophonB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad~"showcolophon"~option.}
      \ZZM{"\ZZshowcolophon"~is~not~on~this~list:}
      \ZZM{~~~~false}
      \ZZM{~~~~true}
      \ZZAbort
    }

  \prop_clear:N \l_tmpa_prop
  \prop_put:Nnn \l_tmpa_prop {false} {\c_false_bool}
  \prop_put:Nnn \l_tmpa_prop {true}  {\c_true_bool}
  \prop_get:NVNTF
    \l_tmpa_prop
    {\ZZcoversheets}
    \l_tmpa_tl
    % TRUE CODE
    {
      \ZZM{set~is~'ZZcoversheetsB'}
      \bool_new:N \ZZcoversheetsB
      \bool_set_eq:NN \ZZcoversheetsB {\l_tmpa_tl}
    }
    % FALSE CODE
    {
      \ZZM{Bad~"coversheets"~option.}
      \ZZM{"\ZZcoversheets"~is~not~on~this~list:}
      \ZZM{~~~~false}
      \ZZM{~~~~true}
      \ZZAbort
    }

  \regex_match:nVTF
    {\d+}
    \ZZdebuglevel
    % TRUE CODE
    {
      \int_const:Nn \ZZdebuglevelI \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZdebuglevel"~option.}
      \ZZM{"\ZZdebuglevel"~does~not~match~this~regular~expression:}
      \ZZM{~~~~\string\d+}
      \ZZAbort
    }

  \prop_clear:N \l_tmpa_prop
  \prop_put:Nnn \l_tmpa_prop {false} {\c_false_bool}
  \prop_put:Nnn \l_tmpa_prop {true}  {\c_true_bool}
  \prop_get:NVNTF
    \l_tmpa_prop
    {\ZZdebugoptions}
    \l_tmpa_tl
    % TRUE CODE
    {
      \ZZM{set~is~'ZZdebugoptionsB'}
      \bool_new:N \ZZdebugoptionsB
      \bool_set_eq:NN \ZZdebugoptionsB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad~"debugoptions"~option.}
      \ZZM{"\ZZdebugoptions"~is~not~on~this~list:}
      \ZZM{~~~~false}
      \ZZM{~~~~true}
      \ZZAbort
    }

  \prop_clear:N \l_tmpa_prop
  \prop_put:Nnn \l_tmpa_prop {false} {\c_false_bool}
  \prop_put:Nnn \l_tmpa_prop {true}  {\c_true_bool}
  \prop_get:NVNTF
    \l_tmpa_prop
    {\ZZdebugorder}
    \l_tmpa_tl
    % TRUE CODE
    {
      \ZZM{set~is~'ZZdebugorderB'}
      \bool_new:N \ZZdebugorderB
      \bool_set_eq:NN \ZZdebugorderB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad~"debugorder"~option.}
      \ZZM{"\ZZdebugorder"~is~not~on~this~list:}
      \ZZM{~~~~false}
      \ZZM{~~~~true}
      \ZZAbort
    }

  \prop_clear:N \l_tmpa_prop
  \prop_put:Nnn \l_tmpa_prop {false} {\c_false_bool}
  \prop_put:Nnn \l_tmpa_prop {true}  {\c_true_bool}
  \prop_get:NVNTF
    \l_tmpa_prop
    {\ZZdebugparameters}
    \l_tmpa_tl
    % TRUE CODE
    {
      \ZZM{set~is~'ZZdebugparametersB'}
      \bool_new:N \ZZdebugparametersB
      \bool_set_eq:NN \ZZdebugparametersB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad~"debugparameters"~option.}
      \ZZM{"\ZZdebugparameters"~is~not~on~this~list:}
      \ZZM{~~~~false}
      \ZZM{~~~~true}
      \ZZAbort
    }

  \prop_clear:N \l_tmpa_prop
  \prop_put:Nnn \l_tmpa_prop {false} {\c_false_bool}
  \prop_put:Nnn \l_tmpa_prop {true}  {\c_true_bool}
  \prop_get:NVNTF
    \l_tmpa_prop
    {\ZZshowdiagonalline}
    \l_tmpa_tl
    % TRUE CODE
    {
      \ZZM{set~is~'ZZshowdiagonallineB'}
      \bool_new:N \ZZshowdiagonallineB
      \bool_set_eq:NN \ZZshowdiagonallineB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad~"showdiagonalline"~option.}
      \ZZM{"\ZZshowdiagonalline"~is~not~on~this~list:}
      \ZZM{~~~~false}
      \ZZM{~~~~true}
      \ZZAbort
    }

  \prop_clear:N \l_tmpa_prop
  \prop_put:Nnn \l_tmpa_prop {false} {\c_false_bool}
  \prop_put:Nnn \l_tmpa_prop {true}  {\c_true_bool}
  \prop_get:NVNTF
    \l_tmpa_prop
    {\ZZendnotes}
    \l_tmpa_tl
    % TRUE CODE
    {
      \ZZM{set~is~'ZZendnotesB'}
      \bool_new:N \ZZendnotesB
      \bool_set_eq:NN \ZZendnotesB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad~"endnotes"~option.}
      \ZZM{"\ZZendnotes"~is~not~on~this~list:}
      \ZZM{~~~~false}
      \ZZM{~~~~true}
      \ZZAbort
    }

  \prop_clear:N \l_tmpa_prop
  \prop_put:Nnn \l_tmpa_prop {false} {\c_false_bool}
  \prop_put:Nnn \l_tmpa_prop {true}  {\c_true_bool}
  \prop_get:NVNTF
    \l_tmpa_prop
    {\ZZfrenchspacing}
    \l_tmpa_tl
    % TRUE CODE
    {
      \ZZM{set~is~'ZZfrenchspacingB'}
      \bool_new:N \ZZfrenchspacingB
      \bool_set_eq:NN \ZZfrenchspacingB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad~"frenchspacing"~option.}
      \ZZM{"\ZZfrenchspacing"~is~not~on~this~list:}
      \ZZM{~~~~false}
      \ZZM{~~~~true}
      \ZZAbort
    }

  \prop_clear:N \l_tmpa_prop
  \prop_put:Nnn \l_tmpa_prop {false} {\c_false_bool}
  \prop_put:Nnn \l_tmpa_prop {true}  {\c_true_bool}
  \prop_get:NVNTF
    \l_tmpa_prop
    {\ZZshowgridlines}
    \l_tmpa_tl
    % TRUE CODE
    {
      \ZZM{set~is~'ZZshowgridlinesB'}
      \bool_new:N \ZZshowgridlinesB
      \bool_set_eq:NN \ZZshowgridlinesB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad~"showgridlines"~option.}
      \ZZM{"\ZZshowgridlines"~is~not~on~this~list:}
      \ZZM{~~~~false}
      \ZZM{~~~~true}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZglossaryname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZglossaryname"~option.}
      \ZZM{"\ZZglossaryname"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.*}
      \ZZAbort
    }

  \prop_clear:N \l_tmpa_prop
  \prop_put:Nnn \l_tmpa_prop {false} {\c_false_bool}
  \prop_put:Nnn \l_tmpa_prop {true}  {\c_true_bool}
  \prop_get:NVNTF
    \l_tmpa_prop
    {\ZZiso}
    \l_tmpa_tl
    % TRUE CODE
    {
      \ZZM{set~is~'ZZisoB'}
      \bool_new:N \ZZisoB
      \bool_set_eq:NN \ZZisoB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad~"iso80000-2"~option.}
      \ZZM{"\ZZiso80000-2"~is~not~on~this~list:}
      \ZZM{~~~~false}
      \ZZM{~~~~true}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZlistoffiguresname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZlistoffiguresname"~option.}
      \ZZM{"\ZZlistoffiguresname"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.*}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZlistoflistingsname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZlistoflistingsname"~option.}
      \ZZM{"\ZZlistoflistingsname"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.*}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZlistofprotocolsname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZlistofprotocolsname"~option.}
      \ZZM{"\ZZlistofprotocolsname"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.*}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZlistofschemesname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZlistofschemesname"~option.}
      \ZZM{"\ZZlistofschemesname"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.*}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZlistoftablesname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZlistoftablesname"~option.}
      \ZZM{"\ZZlistoftablesname"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.*}
      \ZZAbort
    }

  \prop_clear:N \l_tmpa_prop
  \prop_put:Nnn \l_tmpa_prop {false} {\c_false_bool}
  \prop_put:Nnn \l_tmpa_prop {true}  {\c_true_bool}
  \prop_get:NVNTF
    \l_tmpa_prop
    {\ZZshowmarginlines}
    \l_tmpa_tl
    % TRUE CODE
    {
      \ZZM{set~is~'ZZshowmarginlinesB'}
      \bool_new:N \ZZshowmarginlinesB
      \bool_set_eq:NN \ZZshowmarginlinesB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad~"showmarginlines"~option.}
      \ZZM{"\ZZshowmarginlines"~is~not~on~this~list:}
      \ZZM{~~~~false}
      \ZZM{~~~~true}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZnomenclaturename
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZnomenclaturename"~option.}
      \ZZM{"\ZZnomenclaturename"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.*}
      \ZZAbort
    }

  \prop_clear:N \l_tmpa_prop
  \prop_put:Nnn \l_tmpa_prop {oneside} {oneside}
  \prop_put:Nnn \l_tmpa_prop {pdf} {pdf}
  \prop_put:Nnn \l_tmpa_prop {twoside} {twoside}
  \prop_get:NVNTF
    \l_tmpa_prop
    {\ZZoutput}
    \l_tmpa_tl
    % TRUE CODE
    {
      \ZZM{set~is~''}
    }
    % FALSE CODE
    {
      \ZZM{Bad~"output"~option.}
      \ZZM{"\ZZoutput"~is~not~on~this~list:}
      \ZZM{~~~~oneside}
      \ZZM{~~~~pdf}
      \ZZM{~~~~twoside}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZprefacename
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZprefacename"~option.}
      \ZZM{"\ZZprefacename"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.*}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZsymbolsname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZsymbolsname"~option.}
      \ZZM{"\ZZsymbolsname"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.*}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZtableofcontentsname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZtableofcontentsname"~option.}
      \ZZM{"\ZZtableofcontentsname"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.*}
      \ZZAbort
    }

  \prop_clear:N \l_tmpa_prop
  \prop_put:Nnn \l_tmpa_prop {false} {\c_false_bool}
  \prop_put:Nnn \l_tmpa_prop {true}  {\c_true_bool}
  \prop_get:NVNTF
    \l_tmpa_prop
    {\ZZshowtimestamp}
    \l_tmpa_tl
    % TRUE CODE
    {
      \ZZM{set~is~'ZZshowtimestampB'}
      \bool_new:N \ZZshowtimestampB
      \bool_set_eq:NN \ZZshowtimestampB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad~"showtimestamp"~option.}
      \ZZM{"\ZZshowtimestamp"~is~not~on~this~list:}
      \ZZM{~~~~false}
      \ZZM{~~~~true}
      \ZZAbort
    }

  \regex_match:nVTF
    {\A(false|true|wide)\Z}
    \ZZtodonotes
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZtodonotes"~option.}
      \ZZM{"\ZZtodonotes"~does~not~match~this~regular~expression:}
      \ZZM{~~~~\string\A(false|true|wide)\string\Z}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZvitaname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad~"ZZvitaname"~option.}
      \ZZM{"\ZZvitaname"~does~not~match~this~regular~expression:}
      \ZZM{~~~~.*}
      \ZZAbort
    }

  \edef\ZZinscam{\ZZins-\ZZcam}
  \edef\ZZinscampro{\ZZins-\ZZcam-\ZZpro}
  \edef\ZZinscamprodeg{\ZZins-\ZZcam-\ZZpro-\ZZdeg}
  \ZZM{}
  \ZZM{OPTIONS}
  \ZZM{~~debuglevel~~~~~~~\ZZdebuglevel}
  \ZZM{~~debugoptions~~~~~\ZZdebugoptions}
  \ZZM{~~debugorder~~~~~~~\ZZdebugorder}
  \ZZM{~~debugparameters~~\ZZdebugparameters}
  \ZZM{}
  \ZZM{MANDATORY~PARAMETERS}
  \ZZM{~~INPUT}
  \ZZM{~~~~author~~~~~~~~~~"\ZZauthor"}
  \ZZM{~~~~campus~~~~~~~~~~"\ZZcampus"}
  \ZZM{~~~~degree~~~~~~~~~~"\ZZdegree"}
  \ZZM{~~~~document~~~~~~~~"\ZZdocument"}
  \ZZM{~~~~graduation~~~~~~"\ZZgraduation"}
  \ZZM{~~~~institution~~~~~"\ZZinstitution"}
  \ZZM{~~~~program~~~~~~~~~"\ZZprogram"}
  \ZZM{~~SHORTENED}
  \ZZM{~~~~ZZcam~~~~~~~~~~~"\ZZcam"}
  \ZZM{~~~~ZZdeg~~~~~~~~~~~"\ZZdeg"}
  \ZZM{~~~~ZZins~~~~~~~~~~~"\ZZins"}
  \ZZM{~~~~ZZpro~~~~~~~~~~~"\ZZpro"}
  \ZZM{~~DERIVED}
  \ZZM{~~~~ZZinscam~~~~~~~~"\ZZinscam"}
  \ZZM{~~~~ZZinscampro~~~~~"\ZZinscampro"}
  \ZZM{~~~~ZZinscamprodeg~~"\ZZinscamprodeg"}

  % ------------ BEGIN: UNOFFICIAL .CLS CHANGES -----------
  %      Added by Nick LaFarge (11/12/2022)-
  % Removed non aae options all checking for speed 
  \prop_clear:N \l_tmpa_prop
  \prop_put:Nnn \l_tmpa_prop {pu-wl-aae-ms}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-aae-msaa}    {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-aae-phd}     {3}
  \prop_get:NVNTF
    \l_tmpa_prop
    \ZZinscamprodeg
    \ZZtemplate
    % TRUE CODE
    {
      \ZZM{}
      \ZZM{(}
      \ZZM{~~~~\ZZDebuggingMessage}
      \ZZM{~~~~This~institution/campus/program/degree~combination~is~ok:}
      \ZZM{~~~~~~~~\ZZinstitution}
      \ZZM{~~~~~~~~~~~~\ZZcampus}
      \ZZM{~~~~~~~~~~~~~~~~\ZZprogram}
      \ZZM{~~~~~~~~~~~~~~~~~~~~\ZZdegree}
      \ZZM{)}
    }
    % FALSE CODE
    {
      \ZZM{}
      \ZZM{THIS~IS~A~BAD~INSTITUTION/CAMPUS/PROGRAM/DEGREE~COMBINATION:}
      \ZZM{}
      \ZZM{~~~~\ZZinstitution}
      \ZZM{~~~~~~~~\ZZcampus}
      \ZZM{~~~~~~~~~~~~\ZZprogram}
      \ZZM{~~~~~~~~~~~~~~~~\ZZdegree}
      \ZZM{}
      \ZZM{THE~LEGAL~INSTITUTION/CAMPUS/PROGRAM/DEGREE~COMBINATIONS~ARE:}
      \ZZM{}
      \ZZM{~~~~Purdue~University}
      \ZZM{~~~~~~~~West~Lafayette}
      \ZZM{~~~~~~~~~~~~Aeronautics~and~Astronautics}
      \ZZM{~~~~~~~~~~~~~~~~Master~of~Science}
      \ZZM{}
      \ZZM{~~~~Purdue~University}
      \ZZM{~~~~~~~~West~Lafayette}
      \ZZM{~~~~~~~~~~~~Aeronautics~and~Astronautics}
      \ZZM{~~~~~~~~~~~~~~~~Master~of~Science~in~Aeronautics~and~Astronautics}
      \ZZM{}
      \ZZM{~~~~Purdue~University}
      \ZZM{~~~~~~~~West~Lafayette}
      \ZZM{~~~~~~~~~~~~Aeronautics~and~Astronautics}
      \ZZM{~~~~~~~~~~~~~~~~Doctor~of~Philosophy}
      \ZZM{}
      \ZZAbort
    }
  % ------------ END: UNOFFICIAL .CLS CHANGES ------------

  \bool_new:N \ZZCenterCaptionB
  \bool_set_true:N \ZZCenterCaptionB

  \newboolean{ZZChapterBlankPagesB}
  \setboolean{ZZChapterBlankPagesB}{false}

  \newboolean{ZZCoverSheetsB}
  \setboolean{ZZCoverSheetsB}{false}

  \newboolean{ZZFoundB}
  \setboolean{ZZFoundB}{false}

  \bool_new:N \ZZinappendixb
  \bool_set_false:N \ZZinappendixb

  \newboolean{ZZInChaptersB}
  \setboolean{ZZInChaptersB}{false}

  \newboolean{ZZinotherb}
  \setboolean{ZZinotherb}{false}

  \newboolean{ZZNonChapterBlankPagesB}
  \setboolean{ZZNonChapterBlankPagesB}{false}

  \newboolean{ZZNumberAllVolumesB}
  \setboolean{ZZNumberAllVolumesB}{false}

  \newboolean{ZZUnsetB}
  \setboolean{ZZUnsetB}{false}

  \setcounter{ZZprevindex}{0}
  \bool_new:N \ZZtitlepresent
  \newcommand{\ZZtitlemessage}{\string \maketitle}
  \newcounter{ZZtitlepos}   \setcounter{ZZtitlepos}{1}
  \newcounter{ZZtitleincr}  \setcounter{ZZtitleincr}{1}

  \bool_new:N \ZZdedicationpresent
  \newcommand{\ZZdedicationmessage}{\string dedication}
  \newcounter{ZZdedicationpos}   \setcounter{ZZdedicationpos}{2}
  \newcounter{ZZdedicationincr}  \setcounter{ZZdedicationincr}{1}

  \bool_new:N \ZZacknowledgmentspresent
  \newcommand{\ZZacknowledgmentsmessage}{\string acknowledgments}
  \newcounter{ZZacknowledgmentspos}   \setcounter{ZZacknowledgmentspos}{3}
  \newcounter{ZZacknowledgmentsincr}  \setcounter{ZZacknowledgmentsincr}{1}

  \bool_new:N \ZZprefacepresent
  \newcommand{\ZZprefacemessage}{\string preface}
  \newcounter{ZZprefacepos}   \setcounter{ZZprefacepos}{4}
  \newcounter{ZZprefaceincr}  \setcounter{ZZprefaceincr}{1}

  \bool_new:N \ZZtableofcontentspresent
  \newcommand{\ZZtableofcontentsmessage}{\string \tableofcontents}
  \newcounter{ZZtableofcontentspos}   \setcounter{ZZtableofcontentspos}{5}
  \newcounter{ZZtableofcontentsincr}  \setcounter{ZZtableofcontentsincr}{1}

  \bool_new:N \ZZlistoftablespresent
  \newcommand{\ZZlistoftablesmessage}{\string \listoftables}
  \newcounter{ZZlistoftablespos}   \setcounter{ZZlistoftablespos}{6}
  \newcounter{ZZlistoftablesincr}  \setcounter{ZZlistoftablesincr}{1}

  \bool_new:N \ZZlistoffigurespresent
  \newcommand{\ZZlistoffiguresmessage}{\string \listoffigures}
  \newcounter{ZZlistoffigurespos}   \setcounter{ZZlistoffigurespos}{7}
  \newcounter{ZZlistoffiguresincr}  \setcounter{ZZlistoffiguresincr}{1}

  \bool_new:N \ZZZZlistoflistingspresent
  \newcommand{\ZZZZlistoflistingsmessage}{\string \ZZlistoflistings}
  \newcounter{ZZZZlistoflistingspos}   \setcounter{ZZZZlistoflistingspos}{8}
  \newcounter{ZZZZlistoflistingsincr}  \setcounter{ZZZZlistoflistingsincr}{1}

  \bool_new:N \ZZlistofprotocolspresent
  \newcommand{\ZZlistofprotocolsmessage}{\string \ZZlistofprotocols}
  \newcounter{ZZlistofprotocolspos}   \setcounter{ZZlistofprotocolspos}{9}
  \newcounter{ZZlistofprotocolsincr}  \setcounter{ZZlistofprotocolsincr}{1}

  \bool_new:N \ZZlistofschemespresent
  \newcommand{\ZZlistofschemesmessage}{\string \ZZlistofschemes}
  \newcounter{ZZlistofschemespos}   \setcounter{ZZlistofschemespos}{10}
  \newcounter{ZZlistofschemesincr}  \setcounter{ZZlistofschemesincr}{1}

  \bool_new:N \ZZsymbolspresent
  \newcommand{\ZZsymbolsmessage}{\string symbols}
  \newcounter{ZZsymbolspos}   \setcounter{ZZsymbolspos}{11}
  \newcounter{ZZsymbolsincr}  \setcounter{ZZsymbolsincr}{1}

  \bool_new:N \ZZabbreviationspresent
  \newcommand{\ZZabbreviationsmessage}{\string abbreviations}
  \newcounter{ZZabbreviationspos}   \setcounter{ZZabbreviationspos}{12}
  \newcounter{ZZabbreviationsincr}  \setcounter{ZZabbreviationsincr}{1}

  \bool_new:N \ZZnomenclaturepresent
  \newcommand{\ZZnomenclaturemessage}{\string nomenclature}
  \newcounter{ZZnomenclaturepos}   \setcounter{ZZnomenclaturepos}{13}
  \newcounter{ZZnomenclatureincr}  \setcounter{ZZnomenclatureincr}{1}

  \bool_new:N \ZZglossarypresent
  \newcommand{\ZZglossarymessage}{\string glossary}
  \newcounter{ZZglossarypos}   \setcounter{ZZglossarypos}{14}
  \newcounter{ZZglossaryincr}  \setcounter{ZZglossaryincr}{1}

  \bool_new:N \ZZabstractpresent
  \newcommand{\ZZabstractmessage}{\string abstract}
  \newcounter{ZZabstractpos}   \setcounter{ZZabstractpos}{15}
  \newcounter{ZZabstractincr}  \setcounter{ZZabstractincr}{1}

  \bool_new:N \ZZchapterpresent
  \newcommand{\ZZchaptermessage}{\string chapter}
  \newcounter{ZZchapterpos}   \setcounter{ZZchapterpos}{16}
  \newcounter{ZZchapterincr}  \setcounter{ZZchapterincr}{0}

  \bool_new:N \ZZbibliographypresent
  \newcommand{\ZZbibliographymessage}{\string bibliography}
  \newcounter{ZZbibliographypos}   \setcounter{ZZbibliographypos}{17}
  \newcounter{ZZbibliographyincr}  \setcounter{ZZbibliographyincr}{1}

  \bool_new:N \ZZappendixpresent
  \newcommand{\ZZappendixmessage}{\string appendix}
  \newcounter{ZZappendixpos}   \setcounter{ZZappendixpos}{18}
  \newcounter{ZZappendixincr}  \setcounter{ZZappendixincr}{1}

  \bool_new:N \ZZappendicespresent
  \newcommand{\ZZappendicesmessage}{\string appendices}
  \newcounter{ZZappendicespos}   \setcounter{ZZappendicespos}{19}
  \newcounter{ZZappendicesincr}  \setcounter{ZZappendicesincr}{1}

  \bool_new:N \ZZachapterpresent
  \newcommand{\ZZachaptermessage}{\string chapter}
  \newcounter{ZZachapterpos}   \setcounter{ZZachapterpos}{20}
  \newcounter{ZZachapterincr}  \setcounter{ZZachapterincr}{0}

  \bool_new:N \ZZnotesandfootnotespresent
  \newcommand{\ZZnotesandfootnotesmessage}{\string notesandfootnotes}
  \newcounter{ZZnotesandfootnotespos}   \setcounter{ZZnotesandfootnotespos}{21}
  \newcounter{ZZnotesandfootnotesincr}  \setcounter{ZZnotesandfootnotesincr}{1}

  \bool_new:N \ZZvitapresent
  \newcommand{\ZZvitamessage}{\string vita}
  \newcounter{ZZvitapos}   \setcounter{ZZvitapos}{22}
  \newcounter{ZZvitaincr}  \setcounter{ZZvitaincr}{1}

  \bool_new:N \ZZpublicationpresent
  \newcommand{\ZZpublicationmessage}{\string publication}
  \newcounter{ZZpublicationpos}   \setcounter{ZZpublicationpos}{23}
  \newcounter{ZZpublicationincr}  \setcounter{ZZpublicationincr}{1}

  \bool_new:N \ZZpublicationspresent
  \newcommand{\ZZpublicationsmessage}{\string publications}
  \newcounter{ZZpublicationspos}   \setcounter{ZZpublicationspos}{24}
  \newcounter{ZZpublicationsincr}  \setcounter{ZZpublicationsincr}{1}

  \newcommand{\ZZpresentandinorder}[1]
    {
      \bool_set_true:c {ZZ#1present}
      \setcounter{ZZnameindex}{\arabic{ZZ#1pos}}
      \ifthenelse{\value{ZZnameindex} < \value{ZZprevindex}}
        {
          \ZZM{}
          \ZZM{}
          \ZZM{The~"#1"~part~of~the~document~is~out~of~order.}
          \ZZM{The~existing~parts~of~the~document~should~be~in~this~order:}
          \ZZM{~~~~\ZZbs maketitle}
          \ZZM{~~~~\ZZbs begin{dedication}~~~~~~~~...~\ZZbs end{dedication}}
          \ZZM{~~~~\ZZbs begin{acknowledgments}~~~...~\ZZbs end{acknowledgments}}
          \ZZM{~~~~\ZZbs begin{preface}~~~~~~~~~~~...~\ZZbs end{preface}}
          \ZZM{~~~~\ZZbs tableofcontents}
          \ZZM{~~~~\ZZbs listoftables}
          \ZZM{~~~~\ZZbs listoffigures}
          \ZZM{~~~~\ZZbs ZZlistofprotocols}
          \ZZM{~~~~\ZZbs ZZlistofschemes}
          \ZZM{~~~~\ZZbs begin{symbols}~~~~~~~~~~~...~\ZZbs end{symbols}}
          \ZZM{~~~~\ZZbs begin{abbreviations}~~~~~...~\ZZbs end{abbreviations}}
          \ZZM{~~~~\ZZbs begin{nomenclature}~~~~~~...~\ZZbs end{nomenclature}}
          \ZZM{~~~~\ZZbs begin{glossary}~~~~~~~~~~...~\ZZbs end{glossary}}
          \ZZM{~~~~\ZZbs begin{abstract}~~~~~~~~~~...~\ZZbs end{abstract}}
          \ZZM{~~~~\ZZbs chapter}
          \ZZM{~~~~bibliography}
          \ZZM{~~~~\ZZbs appendix~~or~~\ZZbs appendices}
          \ZZM{~~~~\ZZbs chapter}
          \ZZM{~~~~\ZZbs begin{notesandfootnotes}~...~\ZZbs end{notesandfootnotes}}
          \ZZM{~~~~\ZZbs begin{vita}~~~~~~~~~~~~~~...~\ZZbs end{vita}}
          \ZZM{~~~~~~~~\ZZbs begin{publication}~~~...~\ZZbs end{publication}}
          \ZZM{~~~~or~~\ZZbs begin{publications}~~...~\ZZbs end{publications}}
          \see_error_immediately_above
        }
        {\setcounter{ZZprevindex}{\value{ZZnameindex}}}
    }

  \newcommand{\bcaption}
    {
      \bool_set_true:N \ZZCenterCaptionB
      \refstepcounter\@captype \@dblarg{\@caption\@captype}
    }

  \DeclareRobustCommand{\okina}
    {
      \raisebox
        {\dimexpr\fontcharht\font`A-\height}
        {\scalebox{0.8}{`}}
    }

  \newcommand{\ZZnottableofcontents}{}

  \NeedsTeXFormat{LaTeX2e}

  \ifpdf
  \else
    \ZZM{This~document~must~be~processed~using~pdflatex}
    \ZZM{so~figures~are~processed~correctly.}
    \ZZAbort
  \fi

  \clubpenalty         = 10000
  \displaywidowpenalty = 10000
  \widowpenalty        = 10000

  \def\@dottedtocline#1#2#3#4#5#6
    {
      \ifnum #1>\c@tocdepth
      \else
        \vskip #2
        {
          \leftskip #3
          \rightskip \@tocrmarg
          \parfillskip -\rightskip
          \parindent = #3
          \@afterindenttrue
          \interlinepenalty\@M
          \leavevmode
          \@tempdima = #4
          \advance\@tempdima \ZZpaddinglength
          \advance\leftskip \@tempdima
          \hbox{}\hskip -\leftskip
          #5\nobreak
          \leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern \@dotsep mu$}\hfill
          \nobreak
          \renewcommand{\@pnumwidth}{1.55em}
          \setlength{\ZZtl}{\@pnumwidth}
          \settowidth{\ZZtlb}{\reset@font \rm #6}
          \ifdim \ZZtlb>\ZZtl
            \hbox to\ZZtlb{\hfil\reset@font \rm #6}\par
          \else
            \hbox to\ZZtl{\hfil\reset@font \rm #6}\par
          \fi
        }
      \fi
    }

  \def\big@toc@skip{0.5\baselineskip plus 0.2\p@}

  \def\small@toc@skip{0pt}

  \newcommand{\l@protocol}{SET}
  \newcommand{\l@scheme}{SET}

  \bool_if:nT
    {(\ZZshowdiagonallineB || \ZZshowgridlinesB || \ZZshowmarginlinesB)}
    % TRUE CODE
    {
      \usepackage{wallpaper}
      \bool_if:NT
        \ZZshowdiagonallineB
        {\ULCornerWallPaper{1}{gr-diagonalline.pdf}}
      \bool_if:NT
        \ZZshowgridlinesB
        {\ULCornerWallPaper{1}{gr-gridlines.pdf}}
      \bool_if:NT
        \ZZshowmarginlinesB
        {\ULCornerWallPaper{1}{gr-marginlines.pdf}}
    }

    \usepackage[calc,en-US,useregional]{datetime2}
      \DTMsavenow{ttime}
      \newcommand{\ZZDateRun}{\DTMfetchyear{ttime}-\DTMfetchmonth{ttime}-\DTMfetchday{ttime}}
      \newcommand{\ZZTimeRun}{\DTMfetchhour{ttime}:\DTMfetchminute{ttime}:\DTMfetchsecond{ttime}}
      \bool_if:NT
        \ZZshowtimestampB
        % TRUE CODE
        {
          \newcommand{\MyDateDayTimeStamp}
            {
              compiled~on~\ZZDateRun\quad
              \DTMenglishweekdayname{\DTMfetchdow{ttime}}\quad
              \ZZTimeRun
            }
          \def\@evenhead{\hfil\tt\MyDateDayTimeStamp}
          \def\@oddhead{\hfil\tt\MyDateDayTimeStamp}
        }
      \str_case:VnTF
        \ZZtodonotes
        {
          {false}
            {
              \usepackage[letterpaper,left=1in,top=1.1in,bottom=1in,right=1in]{geometry}
              \usepackage[disable]{todonotes}
            }
          {true}
            {
              \usepackage[letterpaper,left=1in,top=1.1in,bottom=1in,right=1in]{geometry}
              \usepackage[color=white,textwidth=0.8in]{todonotes}
            }
          {wide}
            {
              \usepackage[papersize={11.5in,11in},left=1in,top=1.1in,bottom=1in,right=4in]{geometry}
              \usepackage[color=white,textwidth=3.8in]{todonotes}
            }
        }
        % TRUE CODE
        { }
        % FALSE CODE
        { }

  \newcommand{\todocomment}[1]{\renewcommand{\baselinestretch}{1}\todo[color=green!90,tickmarkheight=6pt]{\small #1}}
  \newcommand{\todowarn}[1]{\renewcommand{\baselinestretch}{1}\todo[color=yellow!90,tickmarkheight=6pt]{\small #1}}
  \newcommand{\todoerror}[1]{\renewcommand{\baselinestretch}{1}\todo[color=red!55,tickmarkheight=6pt]{\small #1}}
  % Originally I was going to use gray for index entries, but the
  % lines to where they occur in the text didn't show up well enough.
  \newcommand{\todoindex}[1]{\renewcommand{\baselinestretch}{1}\todo[color=white,linecolor=black,tickmarkheight=6pt]{\small #1}}
  \seq_new:N \l_index_seq
  \def\ix#1
    {
      \seq_set_split:Nnn \l_index_seq {//} {#1}
      \def\ttt{\seq_use:Nn \l_index_seq {\penalty-100\kern0.3ex $\Rightarrow$\nobreak\kern0.3ex}}
      \todoindex{\ttt}
      % This is a comment.
      \seq_map_inline:Nn \l_index_seq
      {
        \index{##1}
      }
    }

  \newcommand{\ZZbaselinestretch}[1]
    {
      \renewcommand{\baselinestretch}{#1}
      \reset@font
    }

  \newcommand{\ZZBlankPage}
    {
      \clearpage
      \mbox{}
      \clearpage
    }

  \AtBeginDocument
    {
      \usepackage{notoccite}
      \def\@evenfoot{\hfil\textrm{\thepage}\hfil}
      \def\@oddfoot{\hfil\textrm{\thepage}\hfil}
    }

  \def\ZZtitlefont{\large\bf}
  \def\ZZauthorfont{\bf}
  \def\ZZdocumentfont{\bf}
  \def\ZZsubmittedfont{\it}
  \def\ZZdegreefont{\bf}
  \newbox\ZZboxa
  \prop_clear:N \l_tmpa_prop
  \prop_put:Nnn \l_tmpa_prop {pu-wl-aae}     {School~of~Aeronautics~and~Astronautics}
  \prop_get:NVNTF
    \l_tmpa_prop
    \ZZinscampro
    \ZZwholename
    % TRUE CODE
    { }
    % FALSE CODE
    { }

  \renewcommand*{\maketitle}
    {
      \pdfbookmark{TITLE~PAGE}{titlepage}
      \str_case:VnTF
        {\ZZins}
        {
          %
          %  Purdue University cover page.
          %
          {pu}
            {
              \ZZpresentandinorder{title}%
                {
                  \setcounter{ZZcountersavedpagenumber}{\value{page}}%
                  \thispagestyle{empty}%
                  \setbox\ZZboxa\vbox
                    {%
                      \centering
                        {\ZZtitlefont\uppercase\expandafter{\ZZtitle}}\\
                        by\\
                        {\ZZauthorfont\ZZauthor}\\
                        \vspace*{25pt}
                        {\ZZdocumentfont \ZZdocument}\\
                        {\ZZsubmittedfont Submitted~to~the~Faculty~of~Purdue~University}\\
                        {\ZZsubmittedfont In~Partial~Fulfillment~of~the~Requirements~for~the~degree~of}\\
                        \vspace*{25pt}
                        {\ZZdegreefont\ZZdegree}\\
                        \vspace*{35pt}
                        % Use the improved vector Purdue seal from Ting-Wei Liu.
                        \hbox to\textwidth{\hss\includegraphics[width=7.9cm]{gr-pu-seal-vector.pdf}\hss}
                        \vspace*{25pt}
                        \ZZwholename\ZZatinformation\\
                        \ZZcampus,~Indiana\\
                        \ZZgraduation
                    }
                  \setlength{\ZZlengtha}{\textheight}%
                  \addtolength{\ZZlengtha}{-\ht\ZZboxa}%
                  \setlength{\ZZlengtha}{0.5\ZZlengtha}%
                  \vspace*{\ZZlengtha}%
                  \vspace*{-0.15in}%
                  \box\ZZboxa
                }
            }
            % ------------ BEGIN: UNOFFICIAL .CLS CHANGES ------------
            %      Added by Nick LaFarge (11/12/2022)
            % Removed hawaii as an option
            % ------------ End: UNOFFICIAL .CLS CHANGES ------------
        }
        % TRUE CODE
        { }
        % FALSE CODE
        { }
      \setcounter{page}{\value{ZZcountersavedpagenumber}}%
    }

  \newcommand{\ZZnonchapter}[4]
    {
      {
        \ZZnottableofcontents
        \group_begin:
          \bool_set_true:N \ZZinotherb
          \chapter*{#2}
          \ifthen{\equal{y}{#3}}
            {\addcontentsline{toc}{chapter}{#2}}
        \group_end:
        \vspace{#4}
      }
      \if_bool:N \ZZinappendixb
        \renewcommand{\thesection}{\thechapter.\arabic{section}}
      \else:
        \renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
      \fi:
    }

  \def\@starttoc#1
    {
      \begingroup
        \@input{\jobname.#1}
        \if@filesw \expandafter\newwrite\csname tf@#1\endcsname
          \immediate\openout \csname tf@#1\endcsname \jobname.#1\relax
        \fi
        \tex_global:D\@nobreakfalse
      \endgroup
    }

  \renewcommand*{\tableofcontents}
    {
      \ZZpresentandinorder{tableofcontents}
      \ZZnonchapter{odd}{\ZZtableofcontentsname}{n}{0pt}
      {
        \output=
          {
            % \let \par \ZZpar
            \ifnum \outputpenalty<-\@M
              \@specialoutput
            \else
              \@makecol
              \@opcol
              \@startcolumn
              \@whilesw \if@fcolmade \fi
              {\@opcol\@startcolumn}
            \fi
            \ifnum \outputpenalty>-\@Miv
              \ifdim \@colroom<1.5\baselineskip
                \ifdim \@colroom<\textheight
                  \@latex@warning@no@line{Text page \thepage+contains only floats}
                  \@emptycol
                \else
                  \tex_global:D \vsize \@colroom
                \fi
              \else
                \tex_global:D \vsize \@colroom
              \fi
            \else
              \tex_global:D \vsize \maxdimen
            \fi
            % {\leftskip=0pt \noindent\hbox to\textwidth{\hfil Page}\endgraf}
          }
          \ZZbaselinestretch{1}
          \@starttoc{toc}
      }
    }

  \renewcommand*{\listoftables}
    {
      \ZZpresentandinorder{listoftables}
      \ZZnonchapter{next}{\ZZlistoftablesname}{y}{0pt}
      {
        \output=
          {
            % \let \par \ZZpar
            \ifnum \outputpenalty<-\@M
              \@specialoutput
            \else
              \@makecol
              \@opcol
              \@startcolumn
              \@whilesw \if@fcolmade \fi
              {\@opcol\@startcolumn}
            \fi
            \ifnum \outputpenalty>-\@Miv
              \ifdim \@colroom<1.5\baselineskip
                \ifdim \@colroom<\textheight
                  \@latex@warning@no@line{Text page \thepage+contains only floats}
                  \@emptycol
                \else
                  \tex_global:D \vsize \@colroom
                \fi
              \else
                \tex_global:D \vsize \@colroom
              \fi
            \else
              \tex_global:D \vsize \maxdimen
            \fi
          }
        \ZZbaselinestretch{1}
        \@starttoc{lot}
      }
    }

  \newcommand*{\ZZlistoflistings}
    {
      \ZZpresentandinorder{ZZlistoflistings}
      \ZZnonchapter{next}{\ZZlistoflistingsname}{y}{0pt}
      {
        \output=
          {
            % \let \par \ZZpar
            \ifnum \outputpenalty<-\@M
              \@specialoutput
            \else
              \@makecol
              \@opcol
              \@startcolumn
              \@whilesw \if@fcolmade \fi
              {\@opcol\@startcolumn}
            \fi
            \ifnum \outputpenalty>-\@Miv
              \ifdim \@colroom<1.5\baselineskip
                \ifdim \@colroom<\textheight
                  \@latex@warning@no@line{Text page \thepage+contains only floats}
                  \@emptycol
                \else
                  \tex_global:D \vsize \@colroom
                \fi
              \else
                \tex_global:D \vsize \@colroom
              \fi
            \else
              \tex_global:D \vsize \maxdimen
            \fi
          }
        \ZZbaselinestretch{1}
        \@starttoc{lol}
      }
    }

  \newcommand*{\listofprotocols}
    {
      \ZZpresentandinorder{listofprotocols}
      \ZZnonchapter{next}{\ZZlistofprotocolsname}{y}{0pt}
      {
        \output=
          {
            % \let \par \ZZpar
            \ifnum \outputpenalty<-\@M
              \@specialoutput
            \else
              \@makecol
              \@opcol
              \@startcolumn
              \@whilesw \if@fcolmade \fi
              {\@opcol\@startcolumn}
            \fi
            \ifnum \outputpenalty>-\@Miv
              \ifdim \@colroom<1.5\baselineskip
                \ifdim \@colroom<\textheight
                  \@latex@warning@no@line{Text page \thepage+contains only floats}
                  \@emptycol
                \else
                  \tex_global:D \vsize \@colroom
                \fi
              \else
                \tex_global:D \vsize \@colroom
              \fi
            \else
              \tex_global:D \vsize \maxdimen
            \fi
          }
        \ZZbaselinestretch{1}
        \@starttoc{lop}
      }
    }

  \newcommand*{\listofschemes}
    {
      \ZZpresentandinorder{listofschemes}
      \ZZnonchapter{next}{\ZZlistofschemesname}{y}{0pt}
      {
        \output=
          {
            % \let \par \ZZpar
            \ifnum \outputpenalty<-\@M
              \@specialoutput
            \else
              \@makecol
              \@opcol
              \@startcolumn
              \@whilesw \if@fcolmade \fi
              {\@opcol\@startcolumn}
            \fi
            \ifnum \outputpenalty>-\@Miv
              \ifdim \@colroom<1.5\baselineskip
                \ifdim \@colroom<\textheight
                  \@latex@warning@no@line{Text page \thepage\space contains only floats}
                  \@emptycol
                \else
                  \tex_global:D \vsize \@colroom
                \fi
              \else
                \tex_global:D \vsize \@colroom
              \fi
            \else
              \tex_global:D \vsize \maxdimen
            \fi
          }
        \ZZbaselinestretch{1}
        \@starttoc{los}
      }
    }

  \newcommand{\ZZStartList}[1]
    {
      \ZZnonchapter{odd}{#1}{y}{0pt}
      \setlength{\LTleft}{0truein}
      \setlength{\LTright}{0truein}
      %% ! change to \setlength[\ZZtl}{\textwidth - \LTleft - \LTright - 2*\tabcolsep - 1truein} later
      \setlength{\ZZtl}{\textwidth}
      \addtolength{\ZZtl}{-\LTleft}
      \addtolength{\ZZtl}{-\LTright}
      \addtolength{\ZZtl}{-\tabcolsep}
      \addtolength{\ZZtl}{-\tabcolsep}
      \addtolength{\ZZtl}{-1truein}
      %% ! Get real width of first column.
      %% ! \setcounter{\ZZcount@temp}{\c@LT@tables}
      %% ! \addtocounter(\ZZcount@temp){1}
      %% ! \def\stuff{\csname LT@\romannumeral\ZZcount@temp\endcsname}
      %% ! \showthe\stuff
      %% ! \addtolength{\ZZtl}{-?}
    }

  \newcommand{\chapterappendix}
    {
      \par
      \bool_set_true:N \ZZinchapterappendixb
      \setcounter{section}{0}
      \if_bool:N \ZZinappendixb
        \renewcommand{\thesection}{\thechapter.\AlphAlph{\value{section}}}
      \else:
        \renewcommand{\thesection}{\thechapter.\arabic{section}}
      \fi:
    }

  \newcommand{\chapterappendices}
    {
      \par
      \bool_set_true:N \ZZinchapterappendixb
      \setcounter{section}{0}
      \if_bool:N \ZZinappendixb
        \renewcommand{\thesection}{\thechapter.\AlphAlph{\value{section}}}
      \else:
        \renewcommand{\thesection}{\thechapter.\arabic{section}}
      \fi:
    }

  \renewcommand*{\listoffigures}
    {
      \ZZpresentandinorder{listoffigures}
      \ZZnonchapter{next}{\ZZlistoffiguresname}{y}{0pt}
      {
        \output=
          {
            %%%%                \let \par \ZZpar
            \ifnum \outputpenalty<-\@M
              \@specialoutput
            \else
              \@makecol
              \@opcol
              \@startcolumn
              \@whilesw \if@fcolmade \fi
              {\@opcol\@startcolumn}
            \fi
            \ifnum \outputpenalty>-\@Miv
              \ifdim \@colroom<1.5\baselineskip
                \ifdim \@colroom<\textheight
                  \@latex@warning@no@line{Text page \thepage\space contains only floats}
                  \@emptycol
                \else
                  \tex_global:D \vsize \@colroom
                \fi
              \else
                \tex_global:D \vsize \@colroom
              \fi
            \else
              \tex_global:D \vsize \maxdimen
            \fi
          }
        \ZZbaselinestretch{1}
        \@starttoc{lof}
      }
    }

  \newcommand{\ZZPause}
    {
      \immediate\message{Press Enter key to continue: }
      \read -1 to \trash
    }

  \newcommand{\ZZRepeat}[2]
    {
      \foreach \ZZATemp in {1,..,#2}
      {
        #1
      }
    }

  \newenvironment{abbreviations}
    {
      \ZZpresentandinorder{abbreviations}
      \ZZStartList{\ZZabbreviationsname}
      \xltabular{\textwidth}{@{}lX@{}}
    }
    {
      \endxltabular
    }

  \renewenvironment{abstract}
    {
      \ZZpresentandinorder{abstract}
      \ZZnonchapter{next}{\ZZabstractname}{y}{0pt}
      %%%%        \vspace*{\baselineskip}
    }
    {
      \endgraf
    }

  \newenvironment{acknowledgments}
    {
      \pdfbookmark{ACKNOWLEDGMENTS}{acknowledments}
      \ZZpresentandinorder{acknowledgments}
      \ZZnonchapter{next}{\ZZacknowledgmentsname}{n}{0pt}
    }
    { }

  \newenvironment{cabstract}
    {
      \begin{quote}
        \textbf{\ZZabstractname}\quad
    }
    {
      \end{quote}
    }

  \newenvironment{cland}
    {
      \begin{landscape}
        \hbox\bgroup
          \hss
          \vbox\bgroup
    }
    {
          \egroup
          \hss
        \egroup
      \end{landscape}
    }

  \newenvironment{dedication}
    {
      \pdfbookmark{DEDICATION}{dedication}
      \ZZpresentandinorder{dedication}
      \newpage
      \mbox{}
      \vfil
      \begin{center}
    }
    {
      \end{center}
      \vfil
      \eject
      \ZZnottableofcontents
    }

  \newtheorem{definition}{Definition}[section]

  \renewenvironment{glossary}
    {
      \ZZpresentandinorder{glossary}
      \ZZStartList{\ZZglossaryname}
      \xltabular{\textwidth}{@{}lX@{}}
    }
    {
      \endxltabular
    }

  \newenvironment{nomenclature}
    {
      \ZZpresentandinorder{nomenclature}
      \ZZStartList{\ZZnomenclaturename}
      \xltabular{\textwidth}{@{}lX@{}}
    }
    {
      \endxltabular
    }

  \newenvironment{lquotation}
    {
      \begin{quotation}
        \ZZbaselinestretch{1}
    }
    {
      \end{quotation}
    }

  \newtheorem{observation}{Observation}[section]

  \newenvironment{preface}
    {
      \pdfbookmark{PREFACE}{preface}
      \ZZpresentandinorder{preface}
      \ZZnonchapter{next}{\ZZprefacename}{n}{0pt}
    }
    { }

  \newtheorem{proposition}{Proposition}[section]

  \newenvironment{statement}
    {
      \pdfbookmark{COMMITTEE~APPROVAL}{committeeapproval}
      \def\approvedby##1
        {
          \vspace*{35pt}
          \centering
            \textbf{Approved~by:}\\
            ##1
          \endgraf
        }
      \def\entry##1##2
        {
          \vspace*{25pt}
          \centering
            \textbf{##1}\\
            ##2\\
            \endgraf
        }
      \newpage
      \vspace*{1.1cm}%
      \centering
        {\large\bf THE~PURDUE~UNIVERSITY~GRADUATE~SCHOOL}\\
        {\large\bf STATEMENT~OF~COMMITTEE~APPROVAL}\\
        \vspace*{10pt}
    }
    { }

  \newenvironment{symbols}
    {
      \ZZpresentandinorder{symbols}
      \ZZStartList{\ZZsymbolsname}
      \xltabular{\textwidth}{@{}lX@{}}
    }
    {
      \endxltabular
    }

  \newtheorem{theorem}{Theorem}[section]
  \renewcommand{\bottomfraction}{1}
  \renewcommand{\floatpagefraction}{0}
  \renewcommand{\topfraction}{1}
  \setcounter{bottomnumber}{10}
  \setcounter{topnumber}{10}
  \setcounter{totalnumber}{10}
  \newboolean{ZZFigureCaptionsB}
  \setboolean{ZZFigureCaptionsB}{false}

  \renewcommand{\chapter}
    {
      \ifthenelse
        {
           \(\boolean{ZZinotherb}  \and  \boolean{ZZNonChapterBlankPagesB}\)
          \or
          \(\NOT\boolean{ZZinotherb}  \and  \boolean{ZZChapterBlankPagesB}\)
        }
        {\cleardoublepage}
        {\clearpage}
      \ZZnottableofcontents
      \tex_global:D \@topnum=\z@
      \@afterindentfalse
      \if_bool:N \ZZinappendixb
        \renewcommand{\thesection}{\thechapter.\arabic{section}}
      \else:
        \renewcommand{\thesection}{\thechapter.\arabic{section}}
      \fi:
      \secdef \@chapter \@schapter
    }

  \newcommand{\coversheet}[1]
    {
      {
        \ifthen{\boolean{ZZCoverSheetsB}}
          {
            \if_bool:N \ZZChapterBlankPagesB
              \clearpage
            \else:
              \clearpage
            \fi:
            \pagestyle{empty}
            \mbox{}
            \ZZCoversheetSpace
            \begin{center}
              #1
            \end{center}
            \vfill
            \newpage
            \addtocounter{page}{-1}
          }
        \ZZnottableofcontents
      }
    }

  \renewcommand{\appendix}
    {
      \ZZpresentandinorder{appendix}
      \par
      \bool_set_true:N \ZZinappendixb
      \setcounter{chapter}{0}
      \setcounter{section}{0}
      \coversheet{\uppercase\expandafter{\ZZAppendixName}}
      \renewcommand{\@chapapp}{\ZZAppendixName}
      \renewcommand{\thechapter}{\AlphAlph{\value{chapter}}}
    }

  \newcommand{\ZZAppendicesName}{Appendices}
  \newcommand{\appendices}
    {
      \ZZpresentandinorder{appendices}
      \par
      \bool_set_true:N \ZZinappendixb
      \setcounter{chapter}{0}
      \setcounter{section}{0}
      \coversheet{\uppercase\expandafter{\ZZAppendicesName}}
      \renewcommand{\@chapapp}{\ZZAppendicesName}
      \renewcommand{\thechapter}{\AlphAlph{\value{chapter}}}
    }

  \newenvironment{notesandfootnotes}
    {\ZZpresentandinorder{notesandfootnotes}}
    {\par}

  \newenvironment{vita}
    {
      \ZZpresentandinorder{vita}
      \ZZVitaStart
      \ZZnonchapter{odd}{\ZZVitaName}{y}{0pt}
    }
    { }

  \newenvironment{publication}
    {
      \ZZpresentandinorder{publication}
      \ZZPublicationStart
      \ZZnonchapter{odd}{\ZZPublicationName}{y}{0pt}
    }
    { }

  \newenvironment{publications}
    {
      \ZZpresentandinorder{publications}
      \ZZPublicationStart
      \ZZnonchapter{odd}{\ZZPublicationsName}{y}{0pt}
    }
    { }

  \def\ZZthreea#1#2#3{#1}
  \def\ZZthreeb#1#2#3{#2}
  \def\ZZthreec#1#2#3{#3}
  \def\ZZtwoa#1#2{#1}
  \def\ZZtwob#1#2{#2}
  \newcounter{ZZi}
  \newcounter{ZZnameindex}
  \newlength{\ZZcaptionwidth}
  \newlength{\ZZpaddinglength}
  \newlength{\ZZparindent}
  \setlength{\ZZparindent}{\parindent}
  \newlength{\ZZtl}
  \newlength{\ZZtlb}
  \setlength{\evensidemargin}{0.5truein}
  \settoheight{\headheight}{- ivx1 -}
  \setlength{\headsep}{0.5truein}
  \addtolength{\headsep}{-\headheight}
  \addtolength{\headsep}{-0.0625truein}
  \def\ZZauthor@a{\expandafter\ZZthreea\ZZauthor}
  \def\ZZauthor@b{\expandafter\ZZthreeb\ZZauthor}
  \def\ZZauthor@c{\expandafter\ZZthreec\ZZauthor}

  \def\@makechapterhead#1
    {
      % !!! \ZZchapterheadspacea is now 0pt.
      % !!! \vspace*{\ZZchapterheadspacea}
      {
        \centering
          \ZZmake@chapter@head{#1}
          \endgraf
      }
      \vspace*{\ZZchapterheadspaceb}
    }

  \long\def\@makefntext#1
    {
      \baselineskip=12pt
      \noindent
      \@makefnmark #1
    }

  \def\@makeschapterhead#1
    {
      % !!! \ZZschapterheadspacea is now 0pt.
      % !!! \vspace*{\ZZschapterheadspacea}
      {
        \centering
          \ZZmake@schapter@head{#1}
          \endgraf
      }
      \vspace*{\ZZschapterheadspaceb}
    }

  \def\@sect#1#2#3#4#5#6[#7]#8
    {
      \ifnum #2>\c@secnumdepth
        \let\@svsec\@empty
      \else
        \refstepcounter{#1}
        \edef\@svsec{\csname the#1\endcsname\hskip 1em}
      \fi
      \ifthen{\equal{che}{\ZZprogram}}
        {
          \ifnum #2=3
            \refstepcounter{#1}
            \edef\@svsec{\csname the#1\endcsname\hskip 1em}
          \fi
        }
      \@tempskipa #5\relax
      \ifdim \@tempskipa>\z@
        \begingroup
          #6\relax
          \@hangfrom{\hskip #3\relax\@svsec}
          {\interlinepenalty \@M #8\par}
        \endgroup
        \csname #1mark\endcsname{#7}
        \addcontentsline{toc}{#1}
          {
            \ifnum #2>\c@secnumdepth
            \else
              \protect\numberline{\csname the#1\endcsname}
            \fi
            #7
          }
      \else
        \def\@svsechd
          {
            #6
            \hskip #3\relax
            \@svsec #8\csname #1mark\endcsname
            {#7}
            \addcontentsline{toc}{#1}
            {
              \ifnum #2>\c@secnumdepth
              \else
                \protect\numberline{\csname the#1\endcsname}
              \fi
              #7
            }
          }
      \fi
      \@xsect{#5}
    }

  \def\@startsection#1#2#3#4#5#6
    {
      \if@noskipsec
        \leavevmode
      \fi
      \par
      \@tempskipa #4\relax
      \@afterindenttrue
      \ifdim \@tempskipa <\z@
        \@tempskipa -\@tempskipa
      \fi
      \if@nobreak
        \everypar{}
      \else
        \addpenalty{\@secpenalty}
        \addvspace{\@tempskipa}
      \fi
      \@ifstar
        {\@ssect{#3}{#4}{#5}{#6}}
        {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}
    }

  \renewcommand{\section}{\@startsection{section}{1}{\z@}{24pt}{12pt}{\ZZbaselinestretch{1}\ZZsectionseries}}
  \renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}{24pt}{12pt}{\ZZbaselinestretch{1}\ZZsubsectionseries}}
  \renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}{24pt}{12pt}{\ZZbaselinestretch{1}\ZZsubsubsectionseries}}
  \renewcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}{24pt}{12pt}{\ZZbaselinestretch{1}\ZZparagraphseries}}
  \renewcommand{\subparagraph}{\@startsection{subparagraph}{5}{\parindent}{24pt}{12pt}{\ZZbaselinestretch{1}\ZZsubparagraphseries}}
  \def\baselinestretch{1.5}
  \pagenumbering{arabic}
  \raggedbottom

  \NeedsTeXFormat{LaTeX2e}

  \setcounter{chapter}{0}
  \newcommand{\ZZAppendixName}{Appendix}

  \newcommand{\articlepages}[1]
    {
      \ZZRepeat{\ZZBlankPage}{#1}
    }

  \newcommand{\articleinclude}[1]
    {
      \def\ZZATemp{#1}
      \foreach \ZZBTemp in {1,..,1000}
        {
          \def\ZZCTemp{\ZZATemp\ZZBTemp.eps}
          \ZZIW{\ZZCTemp}
          \IfFileExists{\ZZCTemp}
            {\noindent\includegraphics[width=\textwidth]{\ZZCTemp}\newpage}
            {\breakforeach}
        }
    }

  \def\@chapter[#1]#2
    {
      \if_bool:N \ZZinappendixb
        \ZZpresentandinorder{achapter}
      \else:
        \ZZpresentandinorder{chapter}
      \fi:
      \ifnum \c@secnumdepth >\m@ne
        \refstepcounter{chapter}
        \typeout{\@chapapp\space\thechapter.}
        \bool_set_true:N \ZZUnsetB
        \ifthen{\equal{agec}{\ZZprogram}}
          {\bool_set_false:N \ZZUnsetB\addcontentsline{toc}{chapter}{\protect\uppercase{\@chapapp\ \thechapter. #1}}}
        \ifthen{\equal{ce}{\ZZprogram}}
          {\bool_set_false:N \ZZUnsetB\addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}\uppercase{#1}}}
        \ifthen{\equal{mse}{\ZZprogram}}
          {\bool_set_false:N \ZZUnsetB\addcontentsline{toc}{chapter}{\protect\uppercase{\@chapapp\ \thechapter. #1}}}
        \if_bool:N \ZZUnsetB
          \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}{#1}}
        \fi:
      \else
        \addcontentsline{toc}{chapter}{#1}
      \fi
      \chaptermark{#1}
      % \addtocontents{lof}{\protect\addvspace{10\p@}}
      % \addtocontents{lot}{\protect\addvspace{10\p@}}
      \@makechapterhead{#2}
      \@afterheading
      \ifthen{\NOT \boolean{ZZInChaptersB}}
        {
          %% xx \pagenumbering{arabic}
          \bool_set_true:N \ZZInChaptersB
        }
    }

  \newcommand{\nonchapterblankpages}{\bool_set_true:N \ZZNonChapterBlankPagesB}
  \newcommand{\nononchapterblankpages}{\bool_set_false:N \ZZNonChapterBlankPagesB}
  \newcommand{\chapterblankpages}{\bool_set_true:N \ZZChapterBlankPagesB}
  \newcommand{\nochapterblankpages}{\bool_set_false:N \ZZChapterBlankPagesB}
  \newcommand{\coversheets}{\bool_set_true:N \ZZCoverSheetsB}
  \newcommand{\nocoversheets}{\bool_set_false:N \ZZCoverSheetsB}

  \def\LT@makecaption#1#2#3
    {
      \LT@mcol\LT@cols c{\hbox to\z@{\hss\parbox[t]\LTcapwidth{
        \sbox\@tempboxa{#1{#2 }#3}
        \ifdim\wd\@tempboxa>\hsize
          #1{#2 }#3
        \else
          \hbox to\hsize{\hfil\box\@tempboxa\hfil}
        \fi
        \endgraf\vskip\baselineskip
      }\hss}}
    }

  \newcommand{\ZZoptionendnotes}
    {
      \let\footnote=\endnote
      \renewcommand{\pendnotes}
      {
        \newpage
        \begingroup
          % \Baselinestretch{0.9}
          \setlength{\parindent}{0pt}
          \setlength{\parskip}{1.5ex}
          \renewcommand{\enotesize}{\normalsize}
          \theendnotes
        \endgroup
      }
    }

  \renewcommand*{\l@chapter}{\@dottedtocline{0}{\big@toc@skip}{0em}{1.4em}}
  \renewcommand*{\l@section}{\@dottedtocline{1}{\small@toc@skip}{1.5em}{2.3em}}
  \renewcommand*\l@subsection{\@dottedtocline{2}{\small@toc@skip}{3.8em}{3.2em}}
  \renewcommand*{\l@subsubsection}{\@dottedtocline{3}{\small@toc@skip}{7em}{4.1em}}
  \renewcommand*{\l@paragraph}{\@dottedtocline{4}{\small@toc@skip}{10em}{5em}}
  \renewcommand*{\l@subparagraph}{\@dottedtocline{5}{\small@toc@skip}{12em}{6em}}
  \renewcommand*\l@figure{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
  \newcommand*\l@ZZlisting{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
  \renewcommand*\l@protocol{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
  \renewcommand*\l@scheme{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
  \renewcommand*\l@table{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
  \setboolean{ZZFigureCaptionsB}{true}
  \def\ZZCoversheetSpace{\vfill}
  \def\AppendixFigure{\relax}
  \def\AppendixTable{\relax}
  \def\AppendixFigure{\relax}
  \def\AppendixTable{\relax}
  \def\ZZVitaStart{\coversheet{\ZZVitaName}}
  \def\ZZVitaName{VITA}
  \def\ZZPublicationStart{\coversheet{\ZZPublicationName}}
  \def\ZZPublicationName{PUBLICATION}
  \def\ZZPublicationsStart{\coversheet{\ZZPublicationsName}}
  \def\ZZPublicationsName{PUBLICATIONS}
  \setlength{\dblfloatsep}{18pt plus 3pt minus 3pt}
  \setlength{\dbltextfloatsep}{30pt plus 3pt minus 6pt}
  \setlength{\floatsep}{18pt plus 3pt minus 3pt}
  \setlength{\intextsep}{18pt plus 3pt minus 3pt}
  \setlength{\textfloatsep}{30pt plus 3pt minus 6pt}
  \newcommand{\ZZlistingname}{Listing~}
  \newcommand{\ZZprotocolname}{Protocol~}
  \newcommand{\ZZschemename}{Scheme~}
  \renewcommand{\tablename}{Table~}
  \def\fnum@ZZlisting{{\ZZlistingseries\ZZlistingname\space\theZZlisting.}~}
  \def\fnum@protocol{{\ZZprotocolseries\ZZprotocolname\space\theprotocol.}~}
  \def\fnum@scheme{{\ZZschemeseries\ZZschemename\space\thescheme.}~}
  \def\fnum@table{{\ZZtableseries\tablename~\thetable.}~}
  \def\ZZmake@chapter@head#1{\ZZchapterseries \ZZchaptersize \thechapter.~#1}
  \def\ZZmake@schapter@head#1{\ZZchapterseries \ZZchaptersize #1}
  \def\ZZtitleseries{\bf}
  \def\ZZauthorseries{\bf}
  \def\ZZdocumentseries{\bf}
  \def\ZZsubmittedseries{\it}
  \def\ZZdegreeseries{\bf}
  \def\ZZtitlesize{\large}
  \def\ZZauthorsize{\normalsize}
  \def\ZZdocumentsize{\normalsize}
  \def\ZZsubmittedsize{\normalsize}
  \def\ZZdegreesize{\normalsize}
  \def\ZZchapterseries{\bfseries}
  \def\ZZchaptersize{\large}
  \def\ZZfigureseries{\bfseries}
  \def\ZZfiguresize{\large}
  \def\ZZlistingseries{\bfseries}
  \def\ZZlistingsize{\large}
  \def\ZZparagraphseries{\bfseries}
  \def\ZZparagraphsize{\large}
  \def\ZZprotocolseries{\bfseries}
  \def\ZZprotocolsize{\large}
  \def\ZZschemeseries{\bfseries}
  \def\ZZschemesize{\large}
  \def\ZZsectionseries{\bfseries}
  \def\ZZsectionsize{\large}
  \def\ZZsubsectionseries{\bfseries}
  \def\ZZsubsectionsize{\large}
  \def\ZZsubsubsectionseries{\bfseries}
  \def\ZZsubsubsectionsize{\large}
  \def\ZZsubsubsubsectionseries{\bfseries}
  \def\ZZsubsubsubsectionsize{\large}
  \def\ZZsubparagraphseries{\bfseries}
  \def\ZZsubparagraphsize{\large}
  \def\ZZtableseries{\bfseries}
  \def\ZZtablesize{\large}
  \def\ZZFigurePunct{. }
  \def\ZZTablePunct{. }

  % ------------ BEGIN: UNOFFICIAL .CLS CHANGES ------------
  %      Added by Nick LaFarge (11/12/2022)
  % Reduce the toc depth in the class file (rather than document)
  %      Previously: \setcounter{tocdepth}{4}
  \setcounter{tocdepth}{3}
  % ------------ END: UNOFFICIAL .CLS CHANGES ------------

  \def\undertext#1{$\underline{\smash{\hbox{#1}}}$}
  \renewcommand{\figurename}{Figure~}
  \renewcommand{\fnum@figure}{{\ZZfigureseries\figurename~\thefigure.}~}
  \def\ZZchapterheadspacea{0.6truein}
  \def\ZZchapterheadspaceb{0.5\baselineskip}
  \def\ZZschapterheadspacea{0.6truein}
  \def\ZZschapterheadspaceb{0.5\baselineskip}
  \str_case:Vn {\ZZinscampro}
  {
    % ------------ BEGIN: UNOFFICIAL .CLS CHANGES ------------
    %      Added by Nick LaFarge (11/12/2022)
    % Removed non-aae degrees (for simplicity)
     % ------------ END: UNOFFICIAL .CLS CHANGES ------------
    {pu-wl-aae}
    {
      \setboolean{ZZFigureCaptionsB}{true}
      \def\fnum@protocol{{\ZZprotocolseries\protocolname\space\theprotocol}.~}
      \def\fnum@scheme{{\ZZschemeseries\schemename\space\thescheme}.~}
      \def\fnum@table{{\ZZtableseries\tablename~\thetable}.~}

    }
  }

  \long\def\@makecaption#1#2
    {
      \vspace*{\abovecaptionskip}
      \if_true:  %%%% if_bool:N \ZZCenterCaptionB    changed 2021-07-27 by mark
        % center caption
        \setlength{\ZZcaptionwidth}{\textwidth}
        \addtolength{\ZZcaptionwidth}{-4\ZZparindent}

        \ifthen{\equal{figure}{\@captype} \or \equal{table}{\@captype}}  %%%%  \or \boolean{ZZFigureCaptionsB}}
          {
            \sbox\@tempboxa{#1 #2}
            \ZZbaselinestretch{1}
            \ifdim \wd\@tempboxa >\hsize
              \centerline{\parbox[t]{\ZZcaptionwidth}{#1 #2}}
            \else
              \centerline{#1 #2}
            \fi
          }

          % ------------ BEGIN: UNOFFICIAL .CLS CHANGES -----------
          %      Added by Nick LaFarge (11/12/2022)-
          % Removed some of the things I am not using
          % ------------ END: UNOFFICIAL .CLS CHANGES ------------
        \vspace*{\belowcaptionskip}
      \else:
        \setlength{\topsep}{0pt}
        \setlength{\parskip}{0pt}
        \setlength{\partopsep}{0pt}
        \begin{quote}
          \renewcommand{\\}{}
          \ZZbaselinestretch{1}
          \ifthenelse{\equal{aae}{\ZZprogram}}
            {#1. #2\par}
            {
              \ifthenelse{\equal{table}{\@captype}}
                {\hfil\strut #1\hfil\break #2\par}
                {#1 #2\par}
            }
        \end{quote}
      \fi:
      \vskip\belowcaptionskip
    }

  % ------------ BEGIN: UNOFFICIAL .CLS CHANGES -----------
  %      Added by Nick LaFarge (11/12/2022)
  % protocol, scheme, listings, ZZlisting
  % ------------- END: UNOFFICIAL .CLS CHANGES ------------

\ExplSyntaxOff

%!!!! Change when the new biber and biblatex are available.
% Use 'c' instead of 'ca. ' for approximate (circa) dates.
% See
%     https://tex.stackexchange.com/questions/224617/what-is-the-correct-way-to-handle-approximate-dates-in-biblatex
% \renewcommand{\datecircadelim}{}
% \DefineBibliographyStrings{english}{circa = c}
