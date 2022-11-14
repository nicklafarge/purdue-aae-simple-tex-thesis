\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PurdueThesis}[2022-10-05 Purdue University thesis document class]
\newcommand{\PurdueThesisVersion}{PurdueThesis 2022-10-05}

% REFERENCES
%   [PU]
%     I forget what this is off-hand.
%   [TCMOS17]
%     The Chicago Manual of  Style Online,
%     17th edition.
%     https://www.chicagomanualofstyle.org/home.html,
%     retrieved on 2020-02-29.
%   [TEMPLATE1]
%     Template-One.docx Microsoft Word thesis template,
%     Thesis & Dissertation Office,
%     The Graduate School,
%     Purdue University.
%     https://www.purdue.edu/gradschool/documents/thesis/Template-One.docx,
%     retrieved on 2020-08-25.
%   [TEMPLATE2]
%     Template-Two.docx Microsoft Word thesis template,
%     Thesis & Dissertation Office,
%     The Graduate School,
%     Purdue University.
%     https://www.purdue.edu/gradschool/documents/thesis/Template-Two.docx,
%     retrieved on 2020-08-25.
%   [TEMPLATE3]
%     Template-Three.docx Microsoft Word thesis template,
%     Thesis & Dissertation Office,
%     The Graduate School,
%     Purdue University.
%     https://www.purdue.edu/gradschool/documents/thesis/Template-Three.docx,
%     retrieved on 2020-08-25.
%   [WEB9]
%     Webster's Ninth New Collegiate Dictionary.
%

% UNICODE    GLYPH    UNICODE NAME                COMMENT
% U+25AF     ▯        BLACK VERTICAL RECTANGLE    I use this to print a visible space between \ExplSyntaxOn and \ExplSyntaxOff.

\LoadClass[12pt]{report}[2019/12/20]
\def\contentsname{TABLE OF CONTENTS}
\newlength{\ZZlengtha}

% Defines \AlphAlph so we can have over 26 appendices, chapter appendices, etc.
\usepackage{alphalph}

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
\usepackage{fontspec}

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
\usepackage{rotating}

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
\usepackage{xltabular}

% Patch existing commands.
% See
%     https://ctan.org/pkg/xpatch/?lang=en
\usepackage{xpatch}

% Provide a high-level interface for producing document-level commands.
% See
%     https://ctan.org/pkg/xparse?lang=en
\usepackage{xparse}

\ExplSyntaxOn
  % Spaces are ignored inside \ExplSyntaxOn.
  % USE ▯ (Unicode U+25AF) instead of \space for a space.
  \catcode`\▯=\active
  \def▯{\space }

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
      \ifthen{\equal{pu-fw-bio}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-fw-cme?}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-fw-comm}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-fw-ece}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-fw-engl}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=apa,          dashed=false, locallabelwidth=true, sortcites=true, style=apa]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-fw-sped}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-ha-bio}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-ha-cdfs}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-ha-cit}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-ha-ece}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-ha-hist}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-ha-mce}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-in-bio}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-in-bme}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-in-ccb?}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-in-cis?}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-in-ece}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-in-fis?}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-in-math}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-in-me}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-in-mste}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-in-neu?}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-in-phys}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-we-bio}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-we-cdfs}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-we-ece}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-we-hist}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-we-mce}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-aae}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-abe}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-ad}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-agecon}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-agry}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-amst}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-ansc}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-anth}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-bchm}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-bcm}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-biol}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-bme}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-bms}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-btny}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-ce}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-cgt}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-chem}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-che}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-cit}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-cmpl}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-com}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-cpb}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-csr}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-cs}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, bibstyle=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-eaps}{\ZZinscampro}}
        {
          % I understand from Susan Beveridge <sbeverid@purdue.edu> (on
          % 2020-08-27) and Milind Sharma <sharm261@purdue.edu> (on
          % ~2020-08-28), both in Earth, Atmospheric, and Planetary Sciences
          % that they would like to use the ametsoc2014 BibTeX style.  On
          % 2022-01-18 Milind wrote they'd rather use ametsocV6.bst than
          % ametsoc2014.bst.  On 2022-01-19 Milind wrote Susan graduated in
          % summer, 2021.
          \newcommand{\ZZBibProcessor}{BibTeX}
          \usepackage{natbib}
        }
      \ifthen{\equal{pu-wl-ece}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      %   % From
      %   % https://tex.stackexchange.com/questions/561338/biblatex-with-ieee-style-not-working-anymore-biblatex-ieee
      %   % regarding why
      %   %     ! Package biblatex-ieee Error: Failed to update citation style.
      %   %     See the biblatex-ieee package documentation for explanation.
      %   %     Type  H <return>  for immediate help.
      %   %     ..
      %   %     l.62 \docsvlist{cite:comp:inset,cite:dump:inset}
      %   % happens with 2020 bibtex-ieee but old bibtex.
      %   %
      %   % For the present, you could add
      %     % The second step is to replace \multicitedelim and
      %     % \multicitesubentrydelim with a version wrapped in
      %     % the appropriate delimiter.
      %     \renewcommand*{\do}[1]{%
      %       \expandafter\patchcmd\expandafter
      %         {\csname abx@macro@\detokenize{#1}\endcsname}%
      %         {\multicitedelim}
      %         {\bibclosebracket\multicitedelim\bibopenbracket}
      %         { }
      %         {%
      %         % \PackageError{biblatex-ieee}{Failed to update citation style}\@ehc
      %         }%
      %       }
      %     \docsvlist{cite:comp:end,cite:comp:inset,cite:comp:shand,cite:dump}
      %
      %     \renewcommand*{\do}[1]{%
      %       \expandafter\patchcmd\expandafter
      %         {\csname abx@macro@\detokenize{#1}\endcsname}%
      %         {\multicitesubentrydelim}
      %         {\bibclosebracket\multicitesubentrydelim\bibopenbracket}
      %         { }
      %         {%
      %         % \PackageError{biblatex-ieee}{Failed to update citation style}\@ehc
      %         }%
      %       }
      %     \docsvlist{cite:comp:inset,cite:dump:inset}
      %
      %     % There's also one \multiciterangedelim and one
      %     % \multicitesubentryrangedelimto alter.
      %     \expandafter\patchcmd\expandafter
      %       {\csname abx@macro@\detokenize{cite:dump}\endcsname}%
      %       {\multiciterangedelim}
      %       {\bibclosebracket\multiciterangedelim\bibopenbracket}
      %       { }
      %       {%
      %       %  \PackageError{biblatex-ieee}{Failed to update citation style}\@ehc
      %       }%
      %
      %     \expandafter\patchcmd\expandafter
      %       {\csname abx@macro@\detokenize{cite:dump:inset}\endcsname}%
      %       {\multicitesubentryrangedelim}
      %       {\bibclosebracket\multicitesubentryrangedelim\bibopenbracket}
      %       { }
      %       {%
      %       %  \PackageError{biblatex-ieee}{Failed to update citation style}\@ehc
      %       }%
      %   % after loading biblatex to get the right behaviour; you'll still have the warning at point-of-loading,
      %   % but the output would be fixed.
      \ifthen{\equal{pu-wl-econ}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-edci}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-edst}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-eee}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-ene}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-engl}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=apa,          dashed=false, locallabelwidth=true, sortcites=true, style=apa]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-entm}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-fnr}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-fs}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-hdfs}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-hist}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-hk}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-hort}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-hsci}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-htm}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-ibsc}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-ie}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-ipph}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-lc}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-ling}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-math}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-mcmp}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-me}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-mgmt}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-ne}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-nur}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-nutr}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-obhr}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-owl}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-phillit}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-phil}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-phpr}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-phys}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-pol}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-psd}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-psy}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-satt}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-slhs}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-soc}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-stat}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-tech}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-tdo}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-thtr}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-tli}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{pu-wl-vcs}{\ZZinscampro}}
        {
          % Dr. Sandra Lefebvre <SLefebvre@avma.org> wrote on 2020-09-01 at 15:10+00:
          %     Thank you for thinking of the JAVMA/AJVR for incorporation in
          %     the reference formats that you're developing. We do not seem to
          %     have a BibTeX or BibLaTeX format per se (we have our own unique
          %     style), but in the near future (by 2021) we will be following
          %     the JAMA format, which you're probably planning to include. My
          %     suggestion would be to use that for the AVMA journals.
          \bibliographystyle{ama}
        }
      \ifthen{\equal{pu-wl-ydae}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
          \addbibresource{all-biblatex.bib}
          % See
          % https://tex.stackexchange.com/questions/134191/line-breaks-of-long-urls-in-biblatex-bibliography
          \setcounter{biburllcpenalty}{7000}
          \setcounter{biburlucpenalty}{8000}
        }
      \ifthen{\equal{uh-manoa-econ}{\ZZinscampro}}
        {
          \usepackage[backend=biber, citestyle=numeric-comp, dashed=false, locallabelwidth=true, sortcites=true, style=ieee]{biblatex}
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
      \ZZM{Bad▯"ZZauthor"▯option.}
      \ZZM{"\ZZauthor"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.+}
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
              \ZZM{Setting▯\ZZbs ZZ#1▯to▯"\l_tmpb_tl".}
              \tl_new:c     {ZZ#1}
              \tl_set_eq:cN {ZZ#1} \l_tmpb_tl
            }
            % FALSE CODE
            {
              \ZZM{Bad▯"\ZZbs ZZ#2"▯option.}
              \ZZM{"\csname ZZ#2\endcsname"▯is▯not▯on▯this▯list:}
              \seq_map_inline:cn {l_#1_seq} {\ZZM{▯▯▯▯####1}}
              \ZZabort
            }
        }
    }

  \ZZmake {cam} {campus}
  \ZZadd  {Bloomington}    {bl}
  \ZZadd  {Fort~Wayne}     {fw}
  \ZZadd  {Hammond}        {ha}
  \ZZadd  {Indianapolis}   {in}
  \ZZadd  {Manoa}          {ma}
  \ZZadd  {Reno}           {re}
  \ZZadd  {Westville}      {we}
  \ZZadd  {West~Lafayette} {wl}
  \ZZcheck

  \ZZmake {deg} {degree}
  \ZZadd {Doctor~of~Audiology}                                          {aud}
  \ZZadd {Doctor~of~Nursing~Practice}                                   {dnp}
  \ZZadd {Doctor~of~Philosophy}                                         {phd}
  \ZZadd {Doctor~of~Technology}                                         {dtech}
  \ZZadd {Master~of~Arts}                                               {ma}
  \ZZadd {Master~of~Fine~Arts}                                          {mfa}
  \ZZadd {Master~of~Library~Science}                                    {mls}
  \ZZadd {Master~of~Science}                                            {ms}
  \ZZadd {Master~of~Science~in~Aeronautics~and~Astronautics}            {msaa}
  \ZZadd {Master~of~Science~in~Agricultural~and~Biological~Engineering} {msabe}
  \ZZadd {Master~of~Science~in~Agriculture}                             {msa}
  \ZZadd {Master~of~Science~in~Aviation~and~Aerospace~Management}       {msaam}
  \ZZadd {Master~of~Science~in~Biomedical~Engineering}                  {msbme}
  \ZZadd {Master~of~Science~in~Building~Construction~Management}        {msbcm}
  \ZZadd {Master~of~Science~in~Chemical~Engineering}                    {msche}
  \ZZadd {Master~of~Science~in~Civil~Engineering}                       {msce}
  \ZZadd {Master~of~Science~in~Education}                               {msed}
  \ZZadd {Master~of~Science~in~Electrical~and~Computer~Engineering}     {msece}
  \ZZadd {Master~of~Science~in~Engineering}                             {mse}
  \ZZadd {Master~of~Science~in~Engineering~Technology}                  {mset}
  \ZZadd {Master~of~Science~in~Human~Resources~Management}              {mshrm}
  \ZZadd {Master~of~Science~in~Industrial~Engineering}                  {msie}
  \ZZadd {Master~of~Science~in~Industrial~Technology}                   {msit}
  \ZZadd {Master~of~Science~in~Materials~Engineering}                   {msmse}
  \ZZadd {Master~of~Science~in~Mechanical~Engineering}                  {msme}
  \ZZadd {Master~of~Science~in~Nuclear~Engineering}                     {msne}
  \ZZcheck

  \regex_match:nVTF
    {.*}
    \ZZcommittee
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad▯"ZZcommittee"▯option.}
      \ZZM{"\ZZcommittee"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.*}
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
      \ZZM{▯▯▯▯.+}
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
  \ZZadd {December~2020} {1}
  \ZZadd {December~2021} {1}
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
  \ZZadd {Indiana~University}   {iu}
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
      \ZZM{▯▯▯▯.+}
      \ZZAbort
    }

  \ZZmake {pro} {program}
  \ZZadd {Aeronautics~and~Astronautics}                          {aae}
  \ZZadd {Agricultural~Economics}                                {agecon}
  \ZZadd {Agricultural~and~Biological~Engineering}               {abe}
  \ZZadd {Agronomy}                                              {agry}
  \ZZadd {American~Studies}                                      {amst}
  \ZZadd {Animal~Sciences}                                       {ansc}
  \ZZadd {Anthropology}                                          {anth}
  \ZZadd {Art~and~Design}                                        {ad}
  \ZZadd {Aviation~and~Transportation~Technology}                {satt}
  \ZZadd {Basic~Medical~Sciences}                                {bms}
  \ZZadd {Biochemistry}                                          {bchm}
  \ZZadd {Biological~Sciences}                                   {biol}
  \ZZadd {Biology}                                               {bio}
  \ZZadd {Biomedical~Engineering}                                {bme}
  \ZZadd {Botany~and~Plant~Pathology}                            {btny}
  \ZZadd {Chemical~Engineering}                                  {che}
  \ZZadd {Chemistry}                                             {chem}
  \ZZadd {Chemistry~and~Chemical~Biology}                        {ccb?}
  \ZZadd {Child~Development~and~Family~Studies}                  {cdfs}
  \ZZadd {Civil~Engineering}                                     {ce}
  \ZZadd {Civil~and~Mechanical~Engineering}                      {cme?}
  \ZZadd {Communication}                                         {comm}
  \ZZadd {Communications}                                        {com}
  \ZZadd {Comparitive~Pathobiology}                              {cpb}
  \ZZadd {Computer~Graphics~Technology}                          {cgt}
  \ZZadd {Computer~Science}                                      {cs}
  \ZZadd {Computer~and~Information~Science}                      {cis?}
  \ZZadd {Computer~and~Information~Technology}                   {cit}
  \ZZadd {Construction~Management~Technology}                    {cm}
  \ZZadd {Consumer~Science}                                      {csr}
  \ZZadd {Curriculum~and~Instruction}                            {edci}
  \ZZadd {Earth,~Atmospheric,~and~Planetary~Sciences}            {eaps}
  \ZZadd {Economics}                                             {econ}
  \ZZadd {Educational~Studies}                                   {edst}
  \ZZadd {Electrical~and~Computer~Engineering}                   {ece}
  \ZZadd {Engineering~Education}                                 {ene}
  \ZZadd {English}                                               {engl}
  \ZZadd {Entomology}                                            {entm}
  \ZZadd {Environmental~and~Ecological~Engineering}              {eee}
  \ZZadd {Food~Science}                                          {fs}
  \ZZadd {Forensic~and~Investigative~Sciences}                   {fis?}
  \ZZadd {Forestry~and~Natural~Resources}                        {fnr}
  \ZZadd {Health~Sciences}                                       {hsci}
  \ZZadd {Health~and~Kinesiology}                                {hk}
  \ZZadd {History}                                               {hist}
  \ZZadd {History~and~Philosphy}                                 {hist}
  \ZZadd {Horticulture}                                          {hort}
  \ZZadd {Hospitality~and~Tourism~Management}                    {htm}
  \ZZadd {Human~Development~and~Family~Studies}                  {hdfs}
  \ZZadd {Industrial~Engineering}                                {ie}
  \ZZadd {Industrial~and~Physical~Pharmacy}                      {ipph}
  \ZZadd {Interdisciplinary~Biomedical~Studies~Program}          {ibsc}
  \ZZadd {Interdisciplinary~Studies~(Comparitive~Literature)}    {cmpl}
  \ZZadd {Languages~and~Cultures}                                {lc}
  \ZZadd {Linguistics}                                           {ling}
  \ZZadd {Management}                                            {mgmt}
  \ZZadd {Materials~Engineering}                                 {mse}
  \ZZadd {Mathematical~Sciences}                                 {math}
  \ZZadd {Mathematics}                                           {math}
  \ZZadd {Mechanical~Engineering}                                {me}
  \ZZadd {Mechnical~and~Civil~Engineering}                       {mce}
  \ZZadd {Medicinal~Chemistry~and~Molecular~Pharmacology}        {mcmp}
  \ZZadd {Motorsports~Engineering}                               {mste}
  \ZZadd {Musicology}                                            {musico}
  \ZZadd {Music~Education}                                       {musice}
  \ZZadd {Music~Theory}                                          {musict}
  \ZZadd {Nuclear~Engineering}                                   {ne}
  \ZZadd {Nursing}                                               {nur}
  \ZZadd {Nutrition~Science}                                     {nutr}
  \ZZadd {Organizational~Behavior~and~Human~Resource~Management} {obhr}
  \ZZadd {Pharmacy~Practice}                                     {phpr}
  \ZZadd {Philosophy}                                            {phil}
  \ZZadd {Philosophy~and~Literature}                             {phillit}
  \ZZadd {Physics}                                               {phys}
  \ZZadd {Physics~and~Astronomy}                                 {phys}
  \ZZadd {Political~Science}                                     {pol}
  \ZZadd {Psychological~Sciences}                                {psy}
  \ZZadd {Purdue~Thesis~Software~Development}                    {psd}
  \ZZadd {Sociology}                                             {soc}
  \ZZadd {Speech,~Language,~and~Hearing~Sciences}                {slhs}
  \ZZadd {Statistics}                                            {stat}
  \ZZadd {Technology}                                            {tech}
  \ZZadd {Technology~Leadership~and~Innovation}                  {tli}
  \ZZadd {Theatre}                                               {thtr}
  \ZZadd {Thesis~and~Dissertation~Office}                        {tdo}
  \ZZadd {Veterinary~Clinical~Sciences}                          {vcs}
  \ZZadd {Writing~Lab}                                           {owl}
  \ZZadd {Youth~Development~and~Agricultural~Education}          {ydae}
  \ZZcheck

%  \prop_clear:N \l_tmpa_prop
%  \prop_put:Nnn \l_tmpa_prop {Aeronautics~and~Astronautics}                          {AAE}
%  \prop_put:Nnn \l_tmpa_prop {Agricultural~Economics}                                {AGECON}
%  \prop_put:Nnn \l_tmpa_prop {Agricultural~and~Biological~Engineering}               {ABE}
%  \prop_put:Nnn \l_tmpa_prop {Agronomy}                                              {AGRY}
%  \prop_put:Nnn \l_tmpa_prop {American~Studies}                                      {AMST}
%  \prop_put:Nnn \l_tmpa_prop {Animal~Sciences}                                       {ANSC}
%  \prop_put:Nnn \l_tmpa_prop {Anthropology}                                          {ANTH}
%  \prop_put:Nnn \l_tmpa_prop {Art~and~Design}                                        {AD}
%  \prop_put:Nnn \l_tmpa_prop {Aviation~and~Transportation~Technology}                {SATT}
%  \prop_put:Nnn \l_tmpa_prop {Basic~Medical~Sciences}                                {BMS}
%  \prop_put:Nnn \l_tmpa_prop {Biochemistry}                                          {BCHM}
%  \prop_put:Nnn \l_tmpa_prop {Biological~Sciences}                                   {BIOL}
%  \prop_put:Nnn \l_tmpa_prop {Biology}                                               {BIO}
%  \prop_put:Nnn \l_tmpa_prop {Biomedical~Engineering}                                {BME}
%  \prop_put:Nnn \l_tmpa_prop {Botany~and~Plant~Pathology}                            {BTNY}
%  \prop_put:Nnn \l_tmpa_prop {Chemical~Engineering}                                  {CHE}
%  \prop_put:Nnn \l_tmpa_prop {Chemistry}                                             {CHEM}
%  \prop_put:Nnn \l_tmpa_prop {Chemistry~and~Chemical~Biology}                        {CCB?}
%  \prop_put:Nnn \l_tmpa_prop {Child~Development~and~Family~Studies}                  {CDFS}
%  \prop_put:Nnn \l_tmpa_prop {Civil~Engineering}                                     {CE}
%  \prop_put:Nnn \l_tmpa_prop {Civil~and~Mechanical~Engineering}                      {CME?}
%  \prop_put:Nnn \l_tmpa_prop {Communication}                                         {COMM}
%  \prop_put:Nnn \l_tmpa_prop {Communications}                                        {COM}
%  \prop_put:Nnn \l_tmpa_prop {Comparitive~Pathobiology}                              {CPB}
%  \prop_put:Nnn \l_tmpa_prop {Computer~Graphics~Technology}                          {CGT}
%  \prop_put:Nnn \l_tmpa_prop {Computer~Science}                                      {CS}
%  \prop_put:Nnn \l_tmpa_prop {Computer~and~Information~Science}                      {CIS?}
%  \prop_put:Nnn \l_tmpa_prop {Computer~and~Information~Technology}                   {CIT}
%  \prop_put:Nnn \l_tmpa_prop {Construction~Management~Technology}                    {CM}
%  \prop_put:Nnn \l_tmpa_prop {Consumer~Science}                                      {CSR}
%  \prop_put:Nnn \l_tmpa_prop {Curriculum~and~Instruction}                            {EDCI}
%  \prop_put:Nnn \l_tmpa_prop {Earth,~Atmospheric,~and~Planetary~Sciences}            {EAPS}
%  \prop_put:Nnn \l_tmpa_prop {Economics}                                             {ECON}
%  \prop_put:Nnn \l_tmpa_prop {Educational~Studies}                                   {EDST}
%  \prop_put:Nnn \l_tmpa_prop {Electrical~and~Computer~Engineering}                   {ECE}
%  \prop_put:Nnn \l_tmpa_prop {Engineering~Education}                                 {ENE}
%  \prop_put:Nnn \l_tmpa_prop {English}                                               {ENGL}
%  \prop_put:Nnn \l_tmpa_prop {Entomology}                                            {ENTM}
%  \prop_put:Nnn \l_tmpa_prop {Environmental~and~Ecological~Engineering}              {EEE}
%  \prop_put:Nnn \l_tmpa_prop {Food~Science}                                          {FS}
%  \prop_put:Nnn \l_tmpa_prop {Forensic~and~Investigative~Sciences}                   {FIS?}
%  \prop_put:Nnn \l_tmpa_prop {Forestry~and~Natural~Resources}                        {FNR}
%  \prop_put:Nnn \l_tmpa_prop {Health~Sciences}                                       {HSCI}
%  \prop_put:Nnn \l_tmpa_prop {Health~and~Kinesiology}                                {HK}
%  \prop_put:Nnn \l_tmpa_prop {History}                                               {HIST}
%  \prop_put:Nnn \l_tmpa_prop {History~and~Philosphy}                                 {HIST}
%  \prop_put:Nnn \l_tmpa_prop {Horticulture}                                          {HORT}
%  \prop_put:Nnn \l_tmpa_prop {Hospitality~and~Tourism~Management}                    {HTM}
%  \prop_put:Nnn \l_tmpa_prop {Human~Development~and~Family~Studies}                  {HDFS}
%  \prop_put:Nnn \l_tmpa_prop {Industrial~Engineering}                                {IE}
%  \prop_put:Nnn \l_tmpa_prop {Industrial~and~Physical~Pharmacy}                      {IPPH}
%  \prop_put:Nnn \l_tmpa_prop {Interdisciplinary~Biomedical~Studies~Program}          {IBSC}
%  \prop_put:Nnn \l_tmpa_prop {Interdisciplinary~Studies~(Comparitive~Literature)}    {CMPL}
%  \prop_put:Nnn \l_tmpa_prop {Languages~and~Cultures}                                {LC}
%  \prop_put:Nnn \l_tmpa_prop {Linguistics}                                           {LING}
%  \prop_put:Nnn \l_tmpa_prop {Management}                                            {MGMT}
%  \prop_put:Nnn \l_tmpa_prop {Materials~Engineering}                                 {MSE}
%  \prop_put:Nnn \l_tmpa_prop {Mathematical~Sciences}                                 {MATH}
%  \prop_put:Nnn \l_tmpa_prop {Mathematics}                                           {MATH}
%  \prop_put:Nnn \l_tmpa_prop {Mechanical~Engineering}                                {ME}
%  \prop_put:Nnn \l_tmpa_prop {Mechnical~and~Civil~Engineering}                       {MCE}
%  \prop_put:Nnn \l_tmpa_prop {Medicinal~Chemistry~and~Molecular~Pharmacology}        {MCMP}
%  \prop_put:Nnn \l_tmpa_prop {Motorsports~Engineering}                               {MSTE}
%  \prop_put:Nnn \l_tmpa_prop {Musicology}                                            {MUSICO}
%  \prop_put:Nnn \l_tmpa_prop {Music~Education}                                       {MUSICE}
%  \prop_put:Nnn \l_tmpa_prop {Music~Theory}                                          {MUSICT}
%  \prop_put:Nnn \l_tmpa_prop {Nuclear~Engineering}                                   {NE}
%  \prop_put:Nnn \l_tmpa_prop {Nursing}                                               {NUR}
%  \prop_put:Nnn \l_tmpa_prop {Nutrition~Science}                                     {NUTR}
%  \prop_put:Nnn \l_tmpa_prop {Organizational~Behavior~and~Human~Resource~Management} {OBHR}
%  \prop_put:Nnn \l_tmpa_prop {Pharmacy~Practice}                                     {PHPR}
%  \prop_put:Nnn \l_tmpa_prop {Philosophy}                                            {PHIL}
%  \prop_put:Nnn \l_tmpa_prop {Philosophy~and~Literature}                             {PHILLIT}
%  \prop_put:Nnn \l_tmpa_prop {Physics}                                               {PHYS}
%  \prop_put:Nnn \l_tmpa_prop {Physics~and~Astronomy}                                 {PHYS}
%  \prop_put:Nnn \l_tmpa_prop {Political~Science}                                     {POL}
%  \prop_put:Nnn \l_tmpa_prop {Psychological~Sciences}                                {PSY}
%  \prop_put:Nnn \l_tmpa_prop {Purdue~Thesis~Software~Development}                    {PSD}
%  \prop_put:Nnn \l_tmpa_prop {Sociology}                                             {SOC}
%  \prop_put:Nnn \l_tmpa_prop {Speech,~Language,~and~Hearing~Sciences}                {SLHS}
%  \prop_put:Nnn \l_tmpa_prop {Statistics}                                            {STAT}
%  \prop_put:Nnn \l_tmpa_prop {Technology}                                            {TECH}
%  \prop_put:Nnn \l_tmpa_prop {Technology~Leadership~and~Innovation}                  {TLI}
%  \prop_put:Nnn \l_tmpa_prop {Theatre}                                               {THTR}
%  \prop_put:Nnn \l_tmpa_prop {Thesis~and~Dissertation~Office}                        {TDO}
%  \prop_put:Nnn \l_tmpa_prop {Veterinary~Clinical~Sciences}                          {VCS}
%  \prop_put:Nnn \l_tmpa_prop {Writing~Lab}                                           {OWL}
%  \prop_put:Nnn \l_tmpa_prop {Youth~Development~and~Agricultural~Education}          {YDAE}
%  \prop_get:NVNTF
%    \l_tmpa_prop
%    {\ZZprogram}
%    \l_tmpa_tl
%    % TRUE CODE
%    {
%      \ZZM{set+is+'ZZproabb'}
%      \bool_new:N \ZZproabb
%      \bool_set_eq:NN \ZZproabb \l_tmpa_tl
%    }
%    % FALSE CODE
%    {
%      \ZZM{Bad+"program"+option.}
%      \ZZM{"\ZZprogram"+is+not+on+this+list:}
%      \ZZM{++++Aeronautics+and+Astronautics}
%      \ZZM{++++Agricultural+Economics}
%      \ZZM{++++Agricultural+and+Biological+Engineering}
%      \ZZM{++++Agronomy}
%      \ZZM{++++American+Studies}
%      \ZZM{++++Animal+Sciences}
%      \ZZM{++++Anthropology}
%      \ZZM{++++Art+and+Design}
%      \ZZM{++++Aviation+and+Transportation+Technology}
%      \ZZM{++++Basic+Medical+Sciences}
%      \ZZM{++++Biochemistry}
%      \ZZM{++++Biological+Sciences}
%      \ZZM{++++Biology}
%      \ZZM{++++Biomedical+Engineering}
%      \ZZM{++++Botany+and+Plant+Pathology}
%      \ZZM{++++Chemical+Engineering}
%      \ZZM{++++Chemistry}
%      \ZZM{++++Chemistry+and+Chemical+Biology}
%      \ZZM{++++Child+Development+and+Family+Studies}
%      \ZZM{++++Civil+Engineering}
%      \ZZM{++++Civil+and+Mechanical+Engineering}
%      \ZZM{++++Communication}
%      \ZZM{++++Communications}
%      \ZZM{++++Comparitive+Pathobiology}
%      \ZZM{++++Computer+Graphics+Technology}
%      \ZZM{++++Computer+Science}
%      \ZZM{++++Computer+and+Information+Science}
%      \ZZM{++++Computer+and+Information+Technology}
%      \ZZM{++++Construction+Management+Technology}
%      \ZZM{++++Consumer+Science}
%      \ZZM{++++Curriculum+and+Instruction}
%      \ZZM{++++Earth,+Atmospheric,+and+Planetary+Sciences}
%      \ZZM{++++Economics}
%      \ZZM{++++Educational+Studies}
%      \ZZM{++++Electrical+and+Computer+Engineering}
%      \ZZM{++++Engineering+Education}
%      \ZZM{++++English}
%      \ZZM{++++Entomology}
%      \ZZM{++++Environmental+and+Ecological+Engineering}
%      \ZZM{++++Food+Science}
%      \ZZM{++++Forensic+and+Investigative+Sciences}
%      \ZZM{++++Forestry+and+Natural+Resources}
%      \ZZM{++++Health+Sciences}
%      \ZZM{++++Health+and+Kinesiology}
%      \ZZM{++++History}
%      \ZZM{++++History+and+Philosphy}
%      \ZZM{++++Horticulture}
%      \ZZM{++++Hospitality+and+Tourism+Management}
%      \ZZM{++++Human+Development+and+Family+Studies}
%      \ZZM{++++Industrial+Engineering}
%      \ZZM{++++Industrial+and+Physical+Pharmacy}
%      \ZZM{++++Interdisciplinary+Biomedical+Studies+Program}
%      \ZZM{++++Interdisciplinary+Studies+(Comparitive+Literature)}
%      \ZZM{++++Languages+and+Cultures}
%      \ZZM{++++Linguistics}
%      \ZZM{++++Management}
%      \ZZM{++++Materials+Engineering}
%      \ZZM{++++Mathematical+Sciences}
%      \ZZM{++++Mathematics}
%      \ZZM{++++Mechanical+Engineering}
%      \ZZM{++++Mechnical+and+Civil+Engineering}
%      \ZZM{++++Medicinal+Chemistry+and+Molecular+Pharmacology}
%      \ZZM{++++Motorsports+Engineering}
%      \ZZM{++++Musicology}
%      \ZZM{++++Music+Education}
%      \ZZM{++++Music+Theory}
%      \ZZM{++++Nuclear+Engineering}
%      \ZZM{++++Nursing}
%      \ZZM{++++Nutrition+Science}
%      \ZZM{++++Organizational+Behavior+and+Human+Resource+Management}
%      \ZZM{++++Pharmacy+Practice}
%      \ZZM{++++Philosophy}
%      \ZZM{++++Philosophy+and+Literature}
%      \ZZM{++++Physics}
%      \ZZM{++++Physics+and+Astronomy}
%      \ZZM{++++Political+Science}
%      \ZZM{++++Psychological+Sciences}
%      \ZZM{++++Purdue+Thesis+Software+Development}
%      \ZZM{++++Sociology}
%      \ZZM{++++Speech,+Language,+and+Hearing+Sciences}
%      \ZZM{++++Statistics}
%      \ZZM{++++Technology}
%      \ZZM{++++Technology+Leadership+and+Innovation}
%      \ZZM{++++Theatre}
%      \ZZM{++++Thesis+and+Dissertation+Office}
%      \ZZM{++++Veterinary+Clinical+Sciences}
%      \ZZM{++++Writing+Lab}
%      \ZZM{++++Youth+Development+and+Agricultural+Education}
%      \ZZAbort
%    }

  \regex_match:nVTF
    {.+}
    \ZZprogramhead
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad▯"ZZprogramhead"▯option.}
      \ZZM{"\ZZprogramhead"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.+}
      \ZZAbort
    }

  \regex_match:nVTF
    {.+}
    \ZZtitle
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad▯"ZZtitle"▯option.}
      \ZZM{"\ZZtitle"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.+}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZabbreviationsname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad▯"ZZabbreviationsname"▯option.}
      \ZZM{"\ZZabbreviationsname"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.*}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZabstractname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad▯"ZZabstractname"▯option.}
      \ZZM{"\ZZabstractname"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.*}
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
      \ZZM{Bad▯"ZZacknowledgmentsname"▯option.}
      \ZZM{"\ZZacknowledgmentsname"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.*}
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
      \ZZM{Bad▯"baselinestretch"▯option.}
      \ZZM{"\baselinestretch"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯\string\d+(\string\.\string\d+)?}
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
      \ZZM{Bad▯"chapterblankpages"▯option.}
      \ZZM{"\ZZchapterblankpages"▯is▯not▯on▯this▯list:}
      \ZZM{▯▯▯▯false}
      \ZZM{▯▯▯▯true}
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
      \ZZM{set▯is▯'ZZshowcolophonB'}
      \bool_new:N \ZZshowcolophonB
      \bool_set_eq:NN \ZZshowcolophonB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad▯"showcolophon"▯option.}
      \ZZM{"\ZZshowcolophon"▯is▯not▯on▯this▯list:}
      \ZZM{▯▯▯▯false}
      \ZZM{▯▯▯▯true}
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
      \ZZM{set▯is▯'ZZcoversheetsB'}
      \bool_new:N \ZZcoversheetsB
      \bool_set_eq:NN \ZZcoversheetsB {\l_tmpa_tl}
    }
    % FALSE CODE
    {
      \ZZM{Bad▯"coversheets"▯option.}
      \ZZM{"\ZZcoversheets"▯is▯not▯on▯this▯list:}
      \ZZM{▯▯▯▯false}
      \ZZM{▯▯▯▯true}
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
      \ZZM{Bad▯"ZZdebuglevel"▯option.}
      \ZZM{"\ZZdebuglevel"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯\string\d+}
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
      \ZZM{set▯is▯'ZZdebugoptionsB'}
      \bool_new:N \ZZdebugoptionsB
      \bool_set_eq:NN \ZZdebugoptionsB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad▯"debugoptions"▯option.}
      \ZZM{"\ZZdebugoptions"▯is▯not▯on▯this▯list:}
      \ZZM{▯▯▯▯false}
      \ZZM{▯▯▯▯true}
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
      \ZZM{set▯is▯'ZZdebugorderB'}
      \bool_new:N \ZZdebugorderB
      \bool_set_eq:NN \ZZdebugorderB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad▯"debugorder"▯option.}
      \ZZM{"\ZZdebugorder"▯is▯not▯on▯this▯list:}
      \ZZM{▯▯▯▯false}
      \ZZM{▯▯▯▯true}
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
      \ZZM{set▯is▯'ZZdebugparametersB'}
      \bool_new:N \ZZdebugparametersB
      \bool_set_eq:NN \ZZdebugparametersB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad▯"debugparameters"▯option.}
      \ZZM{"\ZZdebugparameters"▯is▯not▯on▯this▯list:}
      \ZZM{▯▯▯▯false}
      \ZZM{▯▯▯▯true}
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
      \ZZM{set▯is▯'ZZshowdiagonallineB'}
      \bool_new:N \ZZshowdiagonallineB
      \bool_set_eq:NN \ZZshowdiagonallineB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad▯"showdiagonalline"▯option.}
      \ZZM{"\ZZshowdiagonalline"▯is▯not▯on▯this▯list:}
      \ZZM{▯▯▯▯false}
      \ZZM{▯▯▯▯true}
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
      \ZZM{set▯is▯'ZZendnotesB'}
      \bool_new:N \ZZendnotesB
      \bool_set_eq:NN \ZZendnotesB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad▯"endnotes"▯option.}
      \ZZM{"\ZZendnotes"▯is▯not▯on▯this▯list:}
      \ZZM{▯▯▯▯false}
      \ZZM{▯▯▯▯true}
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
      \ZZM{set▯is▯'ZZfrenchspacingB'}
      \bool_new:N \ZZfrenchspacingB
      \bool_set_eq:NN \ZZfrenchspacingB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad▯"frenchspacing"▯option.}
      \ZZM{"\ZZfrenchspacing"▯is▯not▯on▯this▯list:}
      \ZZM{▯▯▯▯false}
      \ZZM{▯▯▯▯true}
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
      \ZZM{set▯is▯'ZZshowgridlinesB'}
      \bool_new:N \ZZshowgridlinesB
      \bool_set_eq:NN \ZZshowgridlinesB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad▯"showgridlines"▯option.}
      \ZZM{"\ZZshowgridlines"▯is▯not▯on▯this▯list:}
      \ZZM{▯▯▯▯false}
      \ZZM{▯▯▯▯true}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZglossaryname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad▯"ZZglossaryname"▯option.}
      \ZZM{"\ZZglossaryname"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.*}
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
      \ZZM{set▯is▯'ZZisoB'}
      \bool_new:N \ZZisoB
      \bool_set_eq:NN \ZZisoB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad▯"iso80000-2"▯option.}
      \ZZM{"\ZZiso80000-2"▯is▯not▯on▯this▯list:}
      \ZZM{▯▯▯▯false}
      \ZZM{▯▯▯▯true}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZlistoffiguresname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad▯"ZZlistoffiguresname"▯option.}
      \ZZM{"\ZZlistoffiguresname"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.*}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZlistoflistingsname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad▯"ZZlistoflistingsname"▯option.}
      \ZZM{"\ZZlistoflistingsname"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.*}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZlistofprotocolsname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad▯"ZZlistofprotocolsname"▯option.}
      \ZZM{"\ZZlistofprotocolsname"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.*}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZlistofschemesname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad▯"ZZlistofschemesname"▯option.}
      \ZZM{"\ZZlistofschemesname"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.*}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZlistoftablesname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad▯"ZZlistoftablesname"▯option.}
      \ZZM{"\ZZlistoftablesname"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.*}
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
      \ZZM{set▯is▯'ZZshowmarginlinesB'}
      \bool_new:N \ZZshowmarginlinesB
      \bool_set_eq:NN \ZZshowmarginlinesB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad▯"showmarginlines"▯option.}
      \ZZM{"\ZZshowmarginlines"▯is▯not▯on▯this▯list:}
      \ZZM{▯▯▯▯false}
      \ZZM{▯▯▯▯true}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZnomenclaturename
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad▯"ZZnomenclaturename"▯option.}
      \ZZM{"\ZZnomenclaturename"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.*}
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
      \ZZM{set▯is▯''}
    }
    % FALSE CODE
    {
      \ZZM{Bad▯"output"▯option.}
      \ZZM{"\ZZoutput"▯is▯not▯on▯this▯list:}
      \ZZM{▯▯▯▯oneside}
      \ZZM{▯▯▯▯pdf}
      \ZZM{▯▯▯▯twoside}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZprefacename
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad▯"ZZprefacename"▯option.}
      \ZZM{"\ZZprefacename"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.*}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZsymbolsname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad▯"ZZsymbolsname"▯option.}
      \ZZM{"\ZZsymbolsname"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.*}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZtableofcontentsname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad▯"ZZtableofcontentsname"▯option.}
      \ZZM{"\ZZtableofcontentsname"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.*}
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
      \ZZM{set▯is▯'ZZshowtimestampB'}
      \bool_new:N \ZZshowtimestampB
      \bool_set_eq:NN \ZZshowtimestampB \l_tmpa_tl
    }
    % FALSE CODE
    {
      \ZZM{Bad▯"showtimestamp"▯option.}
      \ZZM{"\ZZshowtimestamp"▯is▯not▯on▯this▯list:}
      \ZZM{▯▯▯▯false}
      \ZZM{▯▯▯▯true}
      \ZZAbort
    }

  \regex_match:nVTF
    {\A(false|true|wide)\Z}
    \ZZtodonotes
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad▯"ZZtodonotes"▯option.}
      \ZZM{"\ZZtodonotes"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯\string\A(false|true|wide)\string\Z}
      \ZZAbort
    }

  \regex_match:nVTF
    {.*}
    \ZZvitaname
    % TRUE CODE
    { }
    % FALSE CODE
    {
      \ZZM{Bad▯"ZZvitaname"▯option.}
      \ZZM{"\ZZvitaname"▯does▯not▯match▯this▯regular▯expression:}
      \ZZM{▯▯▯▯.*}
      \ZZAbort
    }

  \edef\ZZinscam{\ZZins-\ZZcam}
  \edef\ZZinscampro{\ZZins-\ZZcam-\ZZpro}
  \edef\ZZinscamprodeg{\ZZins-\ZZcam-\ZZpro-\ZZdeg}
  \ZZM{}
  \ZZM{OPTIONS}
  \ZZM{▯▯debuglevel▯▯▯▯▯▯▯\ZZdebuglevel}
  \ZZM{▯▯debugoptions▯▯▯▯▯\ZZdebugoptions}
  \ZZM{▯▯debugorder▯▯▯▯▯▯▯\ZZdebugorder}
  \ZZM{▯▯debugparameters▯▯\ZZdebugparameters}
  \ZZM{}
  \ZZM{MANDATORY▯PARAMETERS}
  \ZZM{▯▯INPUT}
  \ZZM{▯▯▯▯author▯▯▯▯▯▯▯▯▯▯"\ZZauthor"}
  \ZZM{▯▯▯▯campus▯▯▯▯▯▯▯▯▯▯"\ZZcampus"}
  \ZZM{▯▯▯▯degree▯▯▯▯▯▯▯▯▯▯"\ZZdegree"}
  \ZZM{▯▯▯▯document▯▯▯▯▯▯▯▯"\ZZdocument"}
  \ZZM{▯▯▯▯graduation▯▯▯▯▯▯"\ZZgraduation"}
  \ZZM{▯▯▯▯institution▯▯▯▯▯"\ZZinstitution"}
  \ZZM{▯▯▯▯program▯▯▯▯▯▯▯▯▯"\ZZprogram"}
  \ZZM{▯▯SHORTENED}
  \ZZM{▯▯▯▯ZZcam▯▯▯▯▯▯▯▯▯▯▯"\ZZcam"}
  \ZZM{▯▯▯▯ZZdeg▯▯▯▯▯▯▯▯▯▯▯"\ZZdeg"}
  \ZZM{▯▯▯▯ZZins▯▯▯▯▯▯▯▯▯▯▯"\ZZins"}
  \ZZM{▯▯▯▯ZZpro▯▯▯▯▯▯▯▯▯▯▯"\ZZpro"}
  \ZZM{▯▯DERIVED}
  \ZZM{▯▯▯▯ZZinscam▯▯▯▯▯▯▯▯"\ZZinscam"}
  \ZZM{▯▯▯▯ZZinscampro▯▯▯▯▯"\ZZinscampro"}
  \ZZM{▯▯▯▯ZZinscamprodeg▯▯"\ZZinscamprodeg"}

  \prop_clear:N \l_tmpa_prop
  \prop_put:Nnn \l_tmpa_prop {uh-ma-econ-phd}    {0}
  \prop_put:Nnn \l_tmpa_prop {iu-bl-musice-ma}   {0}
  \prop_put:Nnn \l_tmpa_prop {iu-bl-musice-mls}  {0}
  \prop_put:Nnn \l_tmpa_prop {iu-bl-musice-phd}  {0}
  \prop_put:Nnn \l_tmpa_prop {iu-bl-musict-ma}   {0}
  \prop_put:Nnn \l_tmpa_prop {iu-bl-musict-mls}  {0}
  \prop_put:Nnn \l_tmpa_prop {iu-bl-musict-phd}  {0}
  \prop_put:Nnn \l_tmpa_prop {iu-bl-musico-ma}   {0}
  \prop_put:Nnn \l_tmpa_prop {iu-bl-musico-mls}  {0}
  \prop_put:Nnn \l_tmpa_prop {iu-bl-musico-phd}  {0}
  \prop_put:Nnn \l_tmpa_prop {unr-re-me-ms}      {0}
  \prop_put:Nnn \l_tmpa_prop {unr-re-me-phd}     {0}
  \prop_put:Nnn \l_tmpa_prop {pu-fw-bio-ms}      {1}
  \prop_put:Nnn \l_tmpa_prop {pu-fw-cme?-mse}    {3}
  \prop_put:Nnn \l_tmpa_prop {pu-fw-comm-ma}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-fw-comm-ms}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-fw-cs-ms}       {1}
  \prop_put:Nnn \l_tmpa_prop {pu-fw-ece-mse}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-fw-engl-ma}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-ha-bio-ms}      {1}
  \prop_put:Nnn \l_tmpa_prop {pu-ha-cdfs-ms}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-ha-cit-ms}      {2}
  \prop_put:Nnn \l_tmpa_prop {pu-ha-ece-ms}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-ha-ece-msece}   {3}
  \prop_put:Nnn \l_tmpa_prop {pu-ha-hist-ma}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-ha-mce-ms}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-ha-mce-mse}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-in-bio-ms}      {1}
  \prop_put:Nnn \l_tmpa_prop {pu-in-bme-msbme}   {3}
  \prop_put:Nnn \l_tmpa_prop {pu-in-bme-phd}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-in-ccb?-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-in-ccb?-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-in-cis?-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-in-cis?-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-in-ece-ms}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-in-ece-mse}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-in-ece-msece}   {3}
  \prop_put:Nnn \l_tmpa_prop {pu-in-ece-phd}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-in-fis?-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-in-math-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-in-math-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-in-me-ms}       {3}
  \prop_put:Nnn \l_tmpa_prop {pu-in-me-mse}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-in-me-msme}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-in-me-phd}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-in-mste-mse}    {3}
  \prop_put:Nnn \l_tmpa_prop {pu-in-phys-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-in-phys-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-we-bio-ms}      {1}
  \prop_put:Nnn \l_tmpa_prop {pu-we-cdfs-ms}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-we-ece-ms}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-we-hist-ma}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-we-mce-ms}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-we-mce-mse}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-aae-ms}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-aae-msaa}    {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-aae-phd}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-abe-ms}      {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-abe-msabe}   {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-abe-mse}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-abe-phd}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-agecon-ms}   {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-agecon-phd}  {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-agry-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-agry-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-amst-ma}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-amst-phd}    {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ansc-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ansc-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-anth-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-anth-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ad-ma}       {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ad-mfa}      {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ad-phd}      {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-satt-ms}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-satt-msaam}  {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-satt-phd}    {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-bms-ms}      {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-bms-phd}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-bchm-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-bchm-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-bme-msbme}   {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-bme-phd}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-biol-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-biol-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-btny-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-btny-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-chem-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-chem-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-che-msche}   {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-che-phd}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ce-ms}       {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ce-msce}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ce-mse}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ce-phd}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-com-ma}      {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-com-ms}      {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-com-phd}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-cpb-ms}      {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-cpb-phd}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-cit-ms}      {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-cgt-ms}      {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-cgt-phd}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-cs-ms}       {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-cs-phd}      {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-cm-ms}       {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-csr-ms}      {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-csr-phd}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-edci-ms}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-edci-msed}   {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-edci-phd}    {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-eaps-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-eaps-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-econ-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-econ-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-edst-ms}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-edst-msed}   {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-edst-phd}    {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-eee-ms}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-eee-phd}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ece-ms}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ece-msece}   {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ece-mse}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ece-phd}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ene-ms}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ene-mse}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ene-phd}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-engl-ma}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-engl-mfa}    {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-engl-phd}    {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-entm-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-entm-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-fs-ms}       {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-fs-phd}      {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-fnr-ms}      {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-fnr-phd}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-hk-ms}       {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-hk-phd}      {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-hsci-ms}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-hsci-phd}    {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-hdfs-ms}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-hdfs-phd}    {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-hist-ma}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-hist-phd}    {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-hort-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-hort-msa}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-hort-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-htm-ms}      {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-htm-phd}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ipph-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ipph-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ie-ms}       {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ie-msie}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ie-phd}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ibsc-phd}    {u}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-cmpl-ma}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-cmpl-phd}    {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-lc-ma}       {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-lc-phd}      {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ling-ma}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ling-phd}    {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-mgmt-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-mgmt-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-math-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-math-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-mse-ms}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-mse-msmse}   {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-mse-phd}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-me-ms}       {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-me-mse}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-me-msme}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-me-phd}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-mcmp-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-mcmp-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ne-msne}     {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ne-phd}      {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-nur-dnp}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-nur-ms}      {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-nur-phd}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-nutr-ms}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-nutr-phd}    {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-obhr-mshrm}  {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-obhr-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-phil-ma}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-phil-phd}    {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-phillit-phd} {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-phpr-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-phpr-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-phys-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-phys-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-pol-ma}      {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-pol-phd}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-psy-ms}      {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-psy-phd}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-soc-ms}      {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-soc-phd}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-slhs-aud}    {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-slhs-ms}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-slhs-phd}    {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-stat-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-stat-phd}    {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-tech-dtech}  {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-tech-phd}    {3}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-tli-ms}      {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-tli-msit}    {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-tli-phd}     {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-thtr-mfa}    {2}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-vcs-ms}      {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-vcs-phd}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ydae-ms}     {1}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ydae-phd}    {1}
  \prop_get:NVNTF
    \l_tmpa_prop
    \ZZinscamprodeg
    \ZZtemplate
    % TRUE CODE
    {
      \ZZM{}
      \ZZM{(}
      \ZZM{▯▯▯▯\ZZDebuggingMessage}
      \ZZM{▯▯▯▯This▯institution/campus/program/degree▯combination▯is▯ok:}
      \ZZM{▯▯▯▯▯▯▯▯\ZZinstitution}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯\ZZcampus}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯\ZZprogram}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯\ZZdegree}
      \ZZM{)}
    }
    % FALSE CODE
    {
      \ZZM{}
      \ZZM{THIS▯IS▯A▯BAD▯INSTITUTION/CAMPUS/PROGRAM/DEGREE▯COMBINATION:}
      \ZZM{}
      \ZZM{▯▯▯▯\ZZinstitution}
      \ZZM{▯▯▯▯▯▯▯▯\ZZcampus}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯\ZZprogram}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯\ZZdegree}
      \ZZM{}
      \ZZM{THE▯LEGAL▯INSTITUTION/CAMPUS/PROGRAM/DEGREE▯COMBINATIONS▯ARE:}
      \ZZM{}
      \ZZM{▯▯▯▯University▯of▯Hawaii}
      \ZZM{▯▯▯▯▯▯▯▯Manoa}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Economics}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Indiana▯University}
      \ZZM{▯▯▯▯▯▯▯▯Bloomington}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Music▯Education}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Indiana▯University}
      \ZZM{▯▯▯▯▯▯▯▯Bloomington}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Music▯Education}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Library▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Indiana▯University}
      \ZZM{▯▯▯▯▯▯▯▯Bloomington}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Music▯Education}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Indiana▯University}
      \ZZM{▯▯▯▯▯▯▯▯Bloomington}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Music▯Theory}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Indiana▯University}
      \ZZM{▯▯▯▯▯▯▯▯Bloomington}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Music▯Theory}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Library▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Indiana▯University}
      \ZZM{▯▯▯▯▯▯▯▯Bloomington}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Music▯Theory}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Indiana▯University}
      \ZZM{▯▯▯▯▯▯▯▯Bloomington}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Musicology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Indiana▯University}
      \ZZM{▯▯▯▯▯▯▯▯Bloomington}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Musicology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Library▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Indiana▯University}
      \ZZM{▯▯▯▯▯▯▯▯Bloomington}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Musicology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯?????}
      \ZZM{▯▯▯▯▯▯▯▯Reno}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mechanical▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯?????}
      \ZZM{▯▯▯▯▯▯▯▯Reno}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mechanical▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Fort▯Wayne}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Biological▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Fort▯Wayne}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Civil▯and▯Mechanical▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Fort▯Wayne}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Communication}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Fort▯Wayne}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Communication}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Fort▯Wayne}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Computer▯Science}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Fort▯Wayne}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Electrical▯and▯Computer▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Fort▯Wayne}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯English}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Hammond}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Biology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Hammond}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Child▯Development▯and▯Family▯Studies}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Hammond}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Electrical▯and▯Computer▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Hammond}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Electrical▯and▯Computer▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Electrical▯and▯Computer▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Hammond}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯History▯and▯Philosphy}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Hammond}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mechnical▯and▯Civil▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Hammond}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mechnical▯and▯Civil▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Biology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Biomedical▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Biomedical▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Chemistry▯and▯Chemical▯Biology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Chemistry▯and▯Chemical▯Biology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Computer▯and▯Information▯Science}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Computer▯and▯Information▯Science}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Electrical▯and▯Computer▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Electrical▯and▯Computer▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Electrical▯and▯Computer▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Forensic▯and▯Investigative▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mathematical▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mathematical▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mechanical▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mechanical▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mechanical▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Mechanical▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mechanical▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Motorsports▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Physics}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Indianapolis}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Physics}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Westville}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Biology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Westville}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Child▯Development▯and▯Family▯Studies}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Westville}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Electrical▯and▯Computer▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Westville}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯History▯and▯Philosphy}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Westville}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mechnical▯and▯Civil▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯Westville}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mechnical▯and▯Civil▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Aeronautics▯and▯Astronautics}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Aeronautics▯and▯Astronautics}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Aeronautics▯and▯Astronautics}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Aeronautics▯and▯Astronautics}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Agricultural▯and▯Biological▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Agricultural▯and▯Biological▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Agricultural▯and▯Biological▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Agricultural▯and▯Biological▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Agricultural▯and▯Biological▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Agricultural▯Economics}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Agricultural▯Economics}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Agronomy}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Agronomy}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯American▯Studies}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯American▯Studies}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Animal▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Animal▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Anthropology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Anthropology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Art▯and▯Design}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Art▯and▯Design}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Fine▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Art▯and▯Design}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Aviation▯and▯Transportation▯Technology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Aviation▯and▯Transportation▯Technology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Aviation▯and▯Aerospace▯Management}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Aviation▯and▯Transportation▯Technology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Basic▯Medical▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Basic▯Medical▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Biochemistry}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Biochemistry}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Biomedical▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Biomedical▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Biomedical▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Biological▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Biological▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Botany▯and▯Plant▯Pathology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Botany▯and▯Plant▯Pathology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Chemistry}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Chemistry}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Chemical▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Chemical▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Chemical▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Civil▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Civil▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Civil▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Civil▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Civil▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Communications}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Communications}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Communications}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Comparitive▯Pathobiology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Comparitive▯Pathobiology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Computer▯and▯Information▯Technology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Computer▯Graphics▯Technology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Computer▯Graphics▯Technology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Computer▯Science}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Computer▯Science}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Construction▯Management▯Technology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Consumer▯Science}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Consumer▯Science}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Curriculum▯and▯Instruction}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Curriculum▯and▯Instruction}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Education}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Curriculum▯and▯Instruction}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Earth,▯Atmospheric,▯and▯Planetary▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Earth,▯Atmospheric,▯and▯Planetary▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Economics}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Economics}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Educational▯Studies}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Educational▯Studies}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Education}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Educational▯Studies}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Environmental▯and▯Ecological▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Environmental▯and▯Ecological▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Electrical▯and▯Computer▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Electrical▯and▯Computer▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Electrical▯and▯Computer▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Electrical▯and▯Computer▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Electrical▯and▯Computer▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Engineering▯Education}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Engineering▯Education}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Engineering▯Education}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯English}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯English}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Fine▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯English}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Entomology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Entomology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Food▯Science}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Food▯Science}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Forestry▯and▯Natural▯Resources}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Forestry▯and▯Natural▯Resources}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Health▯and▯Kinesiology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Health▯and▯Kinesiology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Health▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Health▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Human▯Development▯and▯Family▯Studies}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Human▯Development▯and▯Family▯Studies}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯History}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯History}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Horticulture}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Horticulture}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Agriculture}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Horticulture}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Hospitality▯and▯Tourism▯Management}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Hospitality▯and▯Tourism▯Management}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Industrial▯and▯Physical▯Pharmacy}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Industrial▯and▯Physical▯Pharmacy}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Industrial▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Industrial▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Industrial▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Industrial▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Interdisciplinary▯Biomedical▯Studies▯Program}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Interdisciplinary▯Studies▯(Comparitive▯Literature)}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Interdisciplinary▯Studies▯(Comparitive▯Literature)}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Languages▯and▯Cultures}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Languages▯and▯Cultures}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Linguistics}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Linguistics}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Management}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Management}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mathematics}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mathematics}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Materials▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Materials▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Materials▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Materials▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mechanical▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mechanical▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mechanical▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Mechanical▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Mechanical▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Medicinal▯Chemistry▯and▯Molecular▯Pharmacology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Medicinal▯Chemistry▯and▯Molecular▯Pharmacology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Nuclear▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Nuclear▯Engineering}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Nuclear▯Engineering}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Nursing}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Nursing▯Practice}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Nursing}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Nursing}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Nutrition▯Science}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Nutrition▯Science}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Organizational▯Behavior▯and▯Human▯Resource▯Management}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Human▯Resources▯Management}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Organizational▯Behavior▯and▯Human▯Resource▯Management}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Philosophy}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Philosophy}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Philosophy▯and▯Literature}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Pharmacy▯Practice}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Pharmacy▯Practice}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Physics▯and▯Astronomy}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Physics▯and▯Astronomy}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Political▯Science}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Political▯Science}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Psychological▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Psychological▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Sociology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Sociology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Speech,▯Language,▯and▯Hearing▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Audiology}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Speech,▯Language,▯and▯Hearing▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Speech,▯Language,▯and▯Hearing▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Statistics}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Statistics}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Technology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Technology}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Technology}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Technology▯Leadership▯and▯Innovation}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Technology▯Leadership▯and▯Innovation}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science▯in▯Industrial▯Technology}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Technology▯Leadership▯and▯Innovation}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Theatre}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Fine▯Arts}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Veterinary▯Clinical▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Veterinary▯Clinical▯Sciences}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Youth▯Development▯and▯Agricultural▯Education}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Master▯of▯Science}
      \ZZM{}
      \ZZM{▯▯▯▯Purdue▯University}
      \ZZM{▯▯▯▯▯▯▯▯West▯Lafayette}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯Youth▯Development▯and▯Agricultural▯Education}
      \ZZM{▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯▯Doctor▯of▯Philosophy}
      \ZZM{}
      \ZZAbort
    }

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
          \ZZM{The▯"#1"▯part▯of▯the▯document▯is▯out▯of▯order.}
          \ZZM{The▯existing▯parts▯of▯the▯document▯should▯be▯in▯this▯order:}
          \ZZM{▯▯▯▯\ZZbs maketitle}
          \ZZM{▯▯▯▯\ZZbs begin{dedication}▯▯▯▯▯▯▯▯...▯\ZZbs end{dedication}}
          \ZZM{▯▯▯▯\ZZbs begin{acknowledgments}▯▯▯...▯\ZZbs end{acknowledgments}}
          \ZZM{▯▯▯▯\ZZbs begin{preface}▯▯▯▯▯▯▯▯▯▯▯...▯\ZZbs end{preface}}
          \ZZM{▯▯▯▯\ZZbs tableofcontents}
          \ZZM{▯▯▯▯\ZZbs listoftables}
          \ZZM{▯▯▯▯\ZZbs listoffigures}
          \ZZM{▯▯▯▯\ZZbs ZZlistofprotocols}
          \ZZM{▯▯▯▯\ZZbs ZZlistofschemes}
          \ZZM{▯▯▯▯\ZZbs begin{symbols}▯▯▯▯▯▯▯▯▯▯▯...▯\ZZbs end{symbols}}
          \ZZM{▯▯▯▯\ZZbs begin{abbreviations}▯▯▯▯▯...▯\ZZbs end{abbreviations}}
          \ZZM{▯▯▯▯\ZZbs begin{nomenclature}▯▯▯▯▯▯...▯\ZZbs end{nomenclature}}
          \ZZM{▯▯▯▯\ZZbs begin{glossary}▯▯▯▯▯▯▯▯▯▯...▯\ZZbs end{glossary}}
          \ZZM{▯▯▯▯\ZZbs begin{abstract}▯▯▯▯▯▯▯▯▯▯...▯\ZZbs end{abstract}}
          \ZZM{▯▯▯▯\ZZbs chapter}
          \ZZM{▯▯▯▯bibliography}
          \ZZM{▯▯▯▯\ZZbs appendix▯▯or▯▯\ZZbs appendices}
          \ZZM{▯▯▯▯\ZZbs chapter}
          \ZZM{▯▯▯▯\ZZbs begin{notesandfootnotes}▯...▯\ZZbs end{notesandfootnotes}}
          \ZZM{▯▯▯▯\ZZbs begin{vita}▯▯▯▯▯▯▯▯▯▯▯▯▯▯...▯\ZZbs end{vita}}
          \ZZM{▯▯▯▯▯▯▯▯\ZZbs begin{publication}▯▯▯...▯\ZZbs end{publication}}
          \ZZM{▯▯▯▯or▯▯\ZZbs begin{publications}▯▯...▯\ZZbs end{publications}}
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
    \ZZM{This▯document▯must▯be▯processed▯using▯pdflatex}
    \ZZM{so▯figures▯are▯processed▯correctly.}
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
  \prop_put:Nnn \l_tmpa_prop {iu-bl-musice}  {Department~of~Music~Education}
  \prop_put:Nnn \l_tmpa_prop {iu-bl-musico}  {Department~of~Musicology}
  \prop_put:Nnn \l_tmpa_prop {iu-bl-musict}  {Department~of~Music~Theory}
  \prop_put:Nnn \l_tmpa_prop {pu-fw-bio}     {Department~of~Biological~Sciences}
  \prop_put:Nnn \l_tmpa_prop {pu-fw-cme?}    {Department~of~Civil~and~Mechanical~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-fw-comm}    {Department~of~Communication}
  \prop_put:Nnn \l_tmpa_prop {pu-fw-cs}      {Department~of~Computer~Science}
  \prop_put:Nnn \l_tmpa_prop {pu-fw-ece}     {Department~of~Electrical~and~Computer~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-fw-engl}    {Department~of~English}
  \prop_put:Nnn \l_tmpa_prop {pu-ha-bio}     {Department~of~Biology}
  \prop_put:Nnn \l_tmpa_prop {pu-ha-cdfs}    {Department~of~Child~Development~and~Family~Studies}
  \prop_put:Nnn \l_tmpa_prop {pu-ha-cit}     {Department~of~Computer~and~Information~Technology}
  \prop_put:Nnn \l_tmpa_prop {pu-ha-ece}     {Department~of~Electrical~and~Computer~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-ha-hist}    {Department~of~History~and~Philosphy}
  \prop_put:Nnn \l_tmpa_prop {pu-ha-mce}     {Department~of~Mechnical~and~Civil~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-in-bio}     {Department~of~Biology}
  \prop_put:Nnn \l_tmpa_prop {pu-in-bme}     {Department~of~Biomedical~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-in-ccb?}    {Department~of~Chemistry~and~Chemical~Biology}
  \prop_put:Nnn \l_tmpa_prop {pu-in-cis?}    {Department~of~Computer~and~Information~Science}
  \prop_put:Nnn \l_tmpa_prop {pu-in-ece}     {Department~of~Electrical~and~Computer~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-in-fis?}    {Department~of~Forensic~and~Investigative~Sciences}
  \prop_put:Nnn \l_tmpa_prop {pu-in-math}    {Department~of~Mathematical~Sciences}
  \prop_put:Nnn \l_tmpa_prop {pu-in-me}      {Department~of~Mechanical~and~Energy~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-in-mste}    {School~of~Engineering~and~Technology}
  \prop_put:Nnn \l_tmpa_prop {pu-in-phys}    {Department~of~Physics}
  \prop_put:Nnn \l_tmpa_prop {pu-we-bio}     {Department~of~Biology}
  \prop_put:Nnn \l_tmpa_prop {pu-we-cdfs}    {Department~of~Child~Development~and~Family~Studies}
  \prop_put:Nnn \l_tmpa_prop {pu-we-ece}     {Department~of~Electrical~and~Computer~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-we-hist}    {Department~of~History~and~Philosphy}
  \prop_put:Nnn \l_tmpa_prop {pu-we-mce}     {Department~of~Mechnical~and~Civil~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-aae}     {School~of~Aeronautics~and~Astronautics}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-abe}     {School~of~Agricultural~and~Biological~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ad}      {Department~of~Art~and~Design}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-agecon}  {Department~of~Agricultural~Economics}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-agry}    {Department~of~Agronomy}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-amst}    {Department~of~American~Studies}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ansc}    {Department~of~Animal~Sciences}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-anth}    {Department~of~Anthropology}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-bchm}    {Department~of~Biochemistry}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-biol}    {Department~of~Biological~Sciences}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-bme}     {Weldon~School~of~Biomedical~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-bms}     {Department~of~Basic~Medical~Sciences}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-btny}    {Department~of~Botany~and~Plant~Pathology}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ce}      {Lyles~School~of~Civil~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-cgt}     {Department~of~Computer~Graphics~Technology}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-che}     {Davidson~School~of~Chemical~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-chem}    {Department~of~Chemistry}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-cit}     {Department~of~Computer~and~Information~Technology}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-cm}      {School~of~Construction~Management~Technology}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-cmpl}    {School~of~Interdisciplinary~Studies~(Comparitive~Literature)}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-com}     {Brian~Lamb~School~of~Communications}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-cpb}     {Department~of~Comparitive~Pathobiology}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-cs}      {Department~of~Computer~Science}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-csr}     {Department~of~Consumer~Science}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-eaps}    {Department~of~Earth,~Atmospheric,~and~Planetary~Sciences}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ece}     {School~of~Electrical~and~Computer~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-econ}    {Department~of~Economics}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-edci}    {Department~of~Curriculum~and~Instruction}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-edst}    {Department~of~Educational~Studies}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-eee}     {Division~of~Environmental~and~Ecological~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ene}     {School~of~Engineering~Education}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-engl}    {Department~of~English}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-entm}    {Department~of~Entomology}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-fnr}     {Department~of~Forestry~and~Natural~Resources}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-fs}      {Department~of~Food~Science}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-hdfs}    {Department~of~Human~Development~and~Family~Studies}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-hist}    {Department~of~History}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-hk}      {School~of~Health~and~Kinesiology}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-hort}    {Department~of~Horticulture}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-hsci}    {School~of~Health~Sciences}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-htm}     {Department~of~Hospitality~and~Tourism~Management}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ibsc}    {Interdisciplinary~Biomedical~Studies~Program}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ie}      {School~of~Industrial~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ipph}    {Department~of~Industrial~and~Physical~Pharmacy}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-lc}      {School~of~Languages~and~Cultures}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ling}    {Department~of~Linguistics}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-math}    {Department~of~Mathematics}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-mcmp}    {Department~of~Medicinal~Chemistry~and~Molecular~Pharmacology}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-me}      {School~of~Mechanical~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-mgmt}    {School~of~Management}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-mse}     {School~of~Materials~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ne}      {School~of~Nuclear~Engineering}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-nur}     {School~of~Nursing}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-nutr}    {Department~of~Nutrition~Science}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-obhr}    {Department~of~Organizational~Behavior~and~Human~Resource~Management}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-owl}     {Online~Writing~Lab}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-phil}    {Department~of~Philosophy}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-phillit} {Department~of~Philosophy~and~Literature}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-phpr}    {Department~of~Pharmacy~Practice}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-phys}    {Department~of~Physics~and~Astronomy}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-pol}     {Department~of~Political~Science}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-psd}     {Purdue~Thesis~Software~Development}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-psy}     {Department~of~Psychological~Sciences}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-satt}    {School~of~Aviation~and~Transportation~Technology}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-slhs}    {Department~of~Speech,~Language,~and~Hearing~Sciences}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-soc}     {Department~of~Sociology}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-stat}    {Department~of~Statistics}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-tdo}     {Thesis~and~Dissertation~Office}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-tech}    {Polytechnic~Institute}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-thtr}    {Department~of~Theatre}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-tli}     {Department~of~Technology~Leadership~and~Innovation}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-vcs}     {Department~of~Veterinary~Clinical~Sciences}
  \prop_put:Nnn \l_tmpa_prop {pu-wl-ydae}    {Department~of~Youth~Development~and~Agricultural~Education}
  \prop_put:Nnn \l_tmpa_prop {uh-ma-econ}    {Department~of~Economics}
  \prop_put:Nnn \l_tmpa_prop {unr-re-me}     {Mechanical~Engineering~Department}
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
          %
          %  University of Hawaii cover page.
          %
          {uh}
            {
              \ZZpresentandinorder{title}%
                {
                  \setcounter{ZZcountersavedpagenumber}{\value{page}}%
                  \thispagestyle{empty}%
                  \setbox\ZZboxa\vbox
                    {%
                      \centering
                        {\bfseries \Large \uppercase\expandafter{\ZZtitle}}\\[-6pt]
                        \hbox to\textwidth{\hss\includegraphics[width=7cm]{gr-uh-seal.pdf}\hss}
                        \vspace*{-6pt}
                        {\large \ZZdocument\ submitted~to~the~Graduate~Division~of~the}\\
                        {\large University~of~Hawai\okina i~at~M\=anoa~in~partial~fulfillment~of~the}\\
                        {\large requirements~for~the~degree~of}\\
                        \vspace*{18pt}
                        {\bfseries \large \ZZdegree}\\
                        {\large in}\\
                        {\bfseries \large \ZZprogram}\\
                        \vspace*{18pt}
                        {\bfseries \large \ZZgraduation}\\
                        \vspace*{18pt}
                        {\large by}\\
                        {\bfseries \large \ZZauthor}\\
                        \vspace*{18pt}
                        {\large Dissertation~Committee:}\\[-6pt]
                        \clist_set_eq:NN \l_tmpa_clist \ZZcommittee
                        \clist_map_inline:Nn \l_tmpa_clist {\large ##1\\[-6pt]}
                        \vspace*{24pt}
                        {\large Keywords:~\ZZkeywords}
                    }
                  \setlength{\ZZlengtha}{\textheight}%
                  \addtolength{\ZZlengtha}{-\ht\ZZboxa}%
                  \setlength{\ZZlengtha}{0.5\ZZlengtha}%
                  \vspace*{\ZZlengtha}%
                  \vspace*{-0.15in}%
                  \box\ZZboxa
                }
            }
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
  \setcounter{tocdepth}{4}
  \def\undertext#1{$\underline{\smash{\hbox{#1}}}$}
  \renewcommand{\figurename}{Figure~}
  \renewcommand{\fnum@figure}{{\ZZfigureseries\figurename~\thefigure.}~}
  \def\ZZchapterheadspacea{0.6truein}
  \def\ZZchapterheadspaceb{0.5\baselineskip}
  \def\ZZschapterheadspacea{0.6truein}
  \def\ZZschapterheadspaceb{0.5\baselineskip}
  \str_case:Vn {\ZZinscampro}
  {
    {pu-in-bme}
    {
      \renewcommand*{\l@section}{\@dottedtocline{1}{\big@toc@skip}{1.5em}{2.3em}}
      \renewcommand*\l@subsection{\@dottedtocline{2}{\big@toc@skip}{3.8em}{3.2em}}
      \renewcommand*{\l@subsubsection}{\@dottedtocline{3}{\big@toc@skip}{7em}{4.1em}}
      \renewcommand*{\l@paragraph}{\@dottedtocline{4}{\big@toc@skip}{10em}{5em}}
      \renewcommand*\l@figure{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@ZZlisting{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@protocol{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@scheme{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@table{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \def\numberline#1{\hb@xt@\@tempdima{#1\hfil}}

    }
    {pu-in-ece}
    {
      \renewcommand*{\l@section}{\@dottedtocline{1}{\big@toc@skip}{1.5em}{2.3em}}
      \renewcommand*\l@subsection{\@dottedtocline{2}{\big@toc@skip}{3.8em}{3.2em}}
      \renewcommand*{\l@subsubsection}{\@dottedtocline{3}{\big@toc@skip}{7em}{4.1em}}
      \renewcommand*{\l@paragraph}{\@dottedtocline{4}{\big@toc@skip}{10em}{5em}}
      \renewcommand*\l@figure{\@dottedtocline{1}{\big@toc@skip}{1.5em}{2.3em}}
      \renewcommand*\l@ZZlisting{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@protocol{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@scheme{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@table{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \def\numberline#1{\hb@xt@\@tempdima{#1\hfil}}

    }
    {pu-wl-aae}
    {
      \setboolean{ZZFigureCaptionsB}{true}
      \def\fnum@protocol{{\ZZprotocolseries\protocolname\space\theprotocol}.~}
      \def\fnum@scheme{{\ZZschemeseries\schemename\space\thescheme}.~}
      \def\fnum@table{{\ZZtableseries\tablename~\thetable}.~}

    }
    {pu-wl-ce}
    {
      \setboolean{ZZFigureCaptionsB}{true}
      \def\fnum@protocol{{\ZZprotocolseries\protocolname\space\theprotocol}.~}
      \def\fnum@scheme{{\ZZschemeseries\schemename\space\thescheme}.~}
      \def\fnum@table{{\ZZtableseries\tablename~\thetable}.~}

    }
    {pu-wl-che}
    {
      \renewcommand*\l@figure{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@ZZlisting{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@protocol{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@scheme{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@table{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \def\numberline#1{\hb@xt@\@tempdima{#1\hfil}}

    }
    {pu-wl-chem}
    {
      \setlength{\dblfloatsep}{36pt}
      \setlength{\dbltextfloatsep}{36pt}
      \setlength{\floatsep}{36pt}
      \setlength{\intextsep}{36pt}
      \setlength{\textfloatsep}{36pt}

    }
    {pu-wl-ece}
    {
      \renewcommand*{\l@section}{\@dottedtocline{1}{\big@toc@skip}{1.5em}{2.3em}}
      \renewcommand*\l@subsection{\@dottedtocline{2}{\big@toc@skip}{3.8em}{3.2em}}
      \renewcommand*{\l@subsubsection}{\@dottedtocline{3}{\big@toc@skip}{7em}{4.1em}}
      \renewcommand*{\l@paragraph}{\@dottedtocline{4}{\big@toc@skip}{10em}{5em}}
      \renewcommand*{\l@subparagraph}{\@dottedtocline{5}{\big@toc@skip}{12em}{6em}}
      \renewcommand*\l@figure{\@dottedtocline{1}{\big@toc@skip}{1.5em}{2.3em}}
      \renewcommand*\l@ZZlisting{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@protocol{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@scheme{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@table{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \def\numberline#1{\hb@xt@\@tempdima{#1\hfil}}

    }
    {pu-wl-hsci}
    {
      \renewcommand*\l@figure{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@ZZlisting{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@protocol{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@scheme{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@table{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \def\numberline#1{\hb@xt@\@tempdima{#1\hfil}}

    }
    {pu-wl-me}
    {
      \renewcommand*\l@figure{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@ZZlisting{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@protocol{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@scheme{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \renewcommand*\l@table{\@dottedtocline{1}{\big@toc@skip}{0em}{2.3em}}
      \setboolean{ZZFigureCaptionsB}{true}
      \def\numberline#1{\hb@xt@\@tempdima{#1\hfil}}
      \def\fnum@protocol{{\ZZprotocolseries\protocolname\space\theprotocol}.~}
      \def\fnum@scheme{{\ZZschemeseries\schemename\space\thescheme}.~}
      \renewcommand{\fnum@figure}{{\ZZfigureseries\figurename~\thefigure.}~}

    }
    {pu-wl-mse}
    {
      \def\ZZCoversheetSpace{0.53125truein}
      \def\AppendixFigure{addtocontents{lof}{Appendix Figure\hfil}}
      \def\AppendixTable{\addtocontents{lot}{Appendix Table\hfil}}
      \def\AppendixFigure{\addtocontents{lof}{Appendix Figure\hfil}}
      \def\AppendixTable{\addtocontents{lot}{Appendix Table\hfil}}
      \def\undertext#1{$\underline{\hbox{#1}}$$}
      \setlength{\parindent}{0.40625truein}

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

        \ifthen{\equal{ZZlisting}{\@captype}}
          {
            \sbox\@tempboxa{#1 #2}
            \ZZbaselinestretch{1}
            \ifdim \wd\@tempboxa >\hsize
              \centerline{\parbox[t]{\ZZcaptionwidth}{#1 #2}}
            \else
              \centerline{#1 #2}
            \fi
          }

        \ifthen{\equal{protocol}{\@captype}}
          {
            \sbox\@tempboxa{#1 #2}
            \ZZbaselinestretch{1}
            \ifdim \wd\@tempboxa >\hsize
              \centerline{\parbox[t]{\ZZcaptionwidth}{#1 #2}}
            \else
              \centerline{#1 #2}
            \fi
          }

        \ifthen{\equal{scheme}{\@captype}}
          {
            \sbox\@tempboxa{#1 #2}
            \ZZbaselinestretch{1}
            \ifdim \wd\@tempboxa >\hsize
              \centerline{\parbox[t]{\ZZcaptionwidth}{#1 #2}}
            \else
              \centerline{#1 #2}
            \fi
          }

  %                \ifthen{\equal{table}{\@captype}} %%%%  \or \boolean{ZZTableCaptionsB}}
  %                {
  %                    \ZZbaselinestretch{1}
  %                    \centerline{#1}
  %                    \sbox\@tempboxa{#2}
  %                    \ifdim \wd\@tempboxa >\hsize
  %                        \centerline{\parbox[t]{\ZZcaptionwidth}{#2}}
  %                    \else
  %                        \centerline{#2}
  %                    \fi
  %                }
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

  \newcommand\nonnullq[2]
    {
      \ifthen{\equal{}{#1}}
        {\relax}
      {#2}
    }

  {
    \def\ZZATemp{\string##}
    \ifthen{\equal{\ZZprogram}{\relax}}
      {
        \ZZM{}
        \ZZM{}
        \ZZM{No program option was specified in your \string\documentclass\ command options.}
        \ZZM{See}
        \ZZM{▯▯▯▯http://engineering.purdue.edu/\string~mark/puthesis/\ZZATemp document}
        \ZZM{for the valid choices.}
        \ZZAbort
      }
    \ifthen{\equal{\ZZdocument}{\relax}}
      {
        \ZZM{}
        \ZZM{}
        \ZZM{No▯document▯option▯was▯specified▯in▯your▯\string\documentclass\▯command▯options.}
        \ZZM{See}
        \ZZM{▯▯▯▯http://engineering.purdue.edu/\string~mark/puthesis/\ZZATemp document}
        \ZZM{for▯the▯valid▯choices.}
        \ZZAbort
      }
  }

  \ifthen{\equal{\ZZtemplate}{1}}
    {
      \def\ZZChapterName{Chapter}
      \def\ZZAppendixName{Appendix}
    }

  \ifthen{\equal{\ZZtemplate}{2}}
    {\def\ZZAppendixName{Appendix}}

  \ifthen{\equal{\ZZtemplate}{3}}
    { }

  \ZZM{define▯fig-name,▯fig-punct,▯fig-hspace▯and▯same▯for▯table?}


  % The ZZlisting environment.

  \newcounter{ZZlisting}[chapter]
  \renewcommand{\theZZlisting}
    {
      \ifnum \c@chapter>\z@
        \thechapter.%
      \fi
      \@arabic\c@ZZlisting
    }
  \def\fps@ZZlisting{tbp}
  \def\ftype@ZZlisting{4}
  \def\ext@ZZlisting{lol}

  \newenvironment{ZZlisting}
    {\@float{ZZlisting}}
    {\end@float}

  \newenvironment{ZZlisting*}
    {\@dblfloat{ZZlisting}}
    {\end@dblfloat}

  % \newcommand{\ZZlistingname}{Listing}


  % The protocol environment.

  \newcounter{protocol}[chapter]
  \renewcommand{\theprotocol}
    {
      \ifnum \c@chapter>\z@
        \thechapter.
      \fi
      \@arabic\c@protocol
    }
  \def\fps@protocol{tbp}
  \def\ftype@protocol{3}
  \def\ext@protocol{lop}

  \newenvironment{protocol}
    {\@float{protocol}}
    {\end@float}

  \newenvironment{protocol*}
    {\@dblfloat{protocol}}
    {\end@dblfloat}

  \newcommand\protocolname{Protocol}


  % The scheme environment.

  \newcounter{scheme}[chapter]
  \renewcommand{\thescheme}
    {
      \ifnum \c@chapter>\z@
        \thechapter.
      \fi
      \@arabic\c@scheme
    }
  \def\fps@scheme{tbp}
  \def\ftype@scheme{2}
  \def\ext@scheme{los}

  %%%% \def\fnum@scheme{\schemename\nobreakspace\thescheme}

  \newenvironment{scheme}
    {\@float{scheme}}
    {\end@float}

  \newenvironment{scheme*}
    {\@dblfloat{scheme}}
    {\end@dblfloat}

  \newcommand\schemename{Scheme}
\ExplSyntaxOff

%!!!! Change when the new biber and biblatex are available.
% Use 'c' instead of 'ca. ' for approximate (circa) dates.
% See
%     https://tex.stackexchange.com/questions/224617/what-is-the-correct-way-to-handle-approximate-dates-in-biblatex
% \renewcommand{\datecircadelim}{}
% \DefineBibliographyStrings{english}{circa = c}
