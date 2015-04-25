% Copyright (C) 2015, 申瑞珉 (Ruimin Shen)
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License along
% with this program; if not, write to the Free Software Foundation, Inc.,
% 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{XTU}

\usepackage{polyglossia}
\usepackage{babel}
\usepackage[CJKnumber,boldfont,slantfont]{xeCJK}
\setmainfont[Mapping=tex-text]{Times New Roman}
\setCJKmainfont{Adobe Song Std}
\setCJKsansfont{Adobe Kaiti Std}
\setCJKmonofont{Adobe Fangsong Std}

\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

\setdefaultlanguage{}
\setotherlanguage{english}
\renewcommand{\selectlanguage}[1]{}

\newfontfamily\arial{Arial}
\setCJKfamilyfont{zhkai}{Adobe Kaiti Std}
\setCJKfamilyfont{zhfs}{Adobe Fangsong Std}
\setCJKfamilyfont{zhsong}{Adobe Song Std}
\setCJKfamilyfont{zhhei}{Adobe Heiti Std}
\newcommand*{\songti}{\CJKfamily{zhsong}}
\newcommand*{\heiti}{\CJKfamily{zhhei}}
\newcommand*{\kaishu}{\CJKfamily{zhkai}}
\newcommand*{\fangsong}{\CJKfamily{zhfs}}

\newif\if@CJKchapter
\if@compatibility
	\@CJKchaptertrue
\else
	\DeclareOption{CJKchapter}{\@CJKchaptertrue}
\fi

\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue

\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\if@compatibility
\else
	\DeclareOption{a4paper}{
		\setlength\paperheight {297mm}
		\setlength\paperwidth  {210mm}
	}
	\DeclareOption{landscape}{
		\setlength\@tempdima   {\paperheight}
		\setlength\paperheight {\paperwidth}
		\setlength\paperwidth  {\@tempdima}
	}
\fi

\if@compatibility
\else
	\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi

\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility
\else
	\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi

\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility
\else
	\DeclareOption{notitlepage}{\@titlepagefalse}
\fi

\if@compatibility
	\@openrighttrue
\else
	\DeclareOption{openright}{\@openrighttrue}
	\DeclareOption{openany}{\@openrightfalse}
\fi

\if@compatibility\else
	\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi

\DeclareOption{twocolumn}{\@twocolumntrue}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{leqno}{\input{leqno.clo}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption{openbib}{
	\AtEndOfPackage{
		\renewcommand\@openbib@code{
			\advance\leftmargin\bibindent
			\itemindent -\bibindent
			\listparindent \itemindent
			\parsep \z@
		}
		\renewcommand\newblock{\par}
	}%
}

\ExecuteOptions{a4paper,twoside,onecolumn,final,openright}
\ProcessOptions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\input{bk1\@ptsize.clo}
%%	\tiny			小六号
%%	\scriptsize		六号字
%%	\footnotesize  	小五号
%%	\small			五号字
%%	\normalsize		小四号
%%	\large			四号字
%%	\Large			小三号
%%	\LARGE			三号字
%%	\huge			小二号
%%	\Huge			二号字
%%	\HUGE			小一号
%%	\HUGER			一号字
%%	\HUGEST			小初号
%%	\zero			初号字
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\normalsize{%
	\@setfontsize\normalsize{12.05pt}{14.46}% 小四14.46
	\abovedisplayskip 12\p@ \@plus 3\p@ \@minus 7\p@
	\abovedisplayshortskip \z@ \@plus 3\p@
	\belowdisplayshortskip 6.5\p@ \@plus 3.5\p@ \@minus 3\p@
	\belowdisplayskip \abovedisplayskip
	\let\@listi\@listI
}
\normalsize
\newcommand\small{
	\@setfontsize\small{10.54pt}{12.65}%%五号字 10.5bp
	\abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
	\def\@listi{
		\leftmargin\leftmargini
		\topsep 9\p@ \@plus3\p@ \@minus5\p@
		\parsep 4.5\p@ \@plus2\p@ \@minus\p@
		\itemsep \parsep
	}
	\belowdisplayskip \abovedisplayskip
}

\newcommand\footnotesize{
	\@setfontsize\footnotesize{9.03}{10.84}%小五号	 9bp
	\abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
	\def\@listi{
		\leftmargin\leftmargini
		\topsep 6\p@ \@plus2\p@ \@minus2\p@
		\parsep 3\p@ \@plus2\p@ \@minus\p@
		\itemsep \parsep
	}
	\belowdisplayskip \abovedisplayskip
}

\newcommand\scriptsize{\@setfontsize\scriptsize{7.53}{9.03}}%六号字  7.5bp
\newcommand\tiny{\@setfontsize\tiny{6.52}{7.83}}%小六号		6.5bp
\newcommand\large{\@setfontsize\large{14.05}{16.86}}%四号字   14bp
\newcommand\Large{\@setfontsize\Large{15.06}{18.07}}%小三号   15bp
\newcommand\LARGE{\@setfontsize\LARGE{16.06}{19.27}}%三号字   16bp
\newcommand\huge{\@setfontsize\huge{18.07}{21.68}}%小二号   18bp
\newcommand\Huge{\@setfontsize\Huge{22.08}{26.50}}%二号字   22bp
\newcommand\HUGE{\@setfontsize\HUGE{24.09}{28.91}}%小一号   24bp
\newcommand\HUGER{\@setfontsize\HUGER{26.10}{31.32}}%一号字   26bp
\newcommand\HUGEST{\@setfontsize\HUGEST{36.14}{43.36}}%小初号   36bp
\newcommand\zero{\@setfontsize\zero{42.16}{50.59}}%初号字   42bp

%% 用中文习惯定义字号
\newcommand\fontsizexliu{\tiny}			%小六号字
\newcommand\fontsizeliu{\scriptsize}	%六号字
\newcommand\fontsizexwu{\footnotesize}	%小五号字
\newcommand\fontsizewu{\small}			%五号字
\newcommand\fontsizexsi{\normalsize}	%小四号字
\newcommand\fontsizesi{\large}			%四号字
\newcommand\fontsizexsan{\Large}		%小三号字
\newcommand\fontsizesan{\LARGE}			%三号字
\newcommand\fontsizexer{\huge}			%小二号字
\newcommand\fontsizeer{\Huge}			%二号字
\newcommand\fontsizexyi{\HUGE}			%小一号字
\newcommand\fontsizeyi{\HUGER}			%一号字
\newcommand\fontsizexchu{\HUGEST}		%小初号字
\newcommand\fontsizechu{\zero}			%初号字

\usepackage{floatrow}
\floatsetup[table]{font=small,capposition=top}

%% 页面尺寸设置
\setlength\parindent{2em} %段落首行左缩进2个汉字符
\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
\setlength\headheight{15pt}
\setlength\headsep   {30pt}%% 页眉线到正文的距离
\setlength\topskip   {12pt}%% 页眉线到正文的距离
\setlength\footskip{30\p@}
\if@compatibility \setlength\maxdepth{4\p@} \else
\setlength\maxdepth{.5\topskip} \fi
\textheight 22.5 true cm
\textwidth 16.2 true cm
\setlength\marginparsep{7\p@}
\setlength\marginparpush{7\p@}
\setlength\@tempdima        {\paperwidth}
\addtolength\@tempdima      {-\textwidth}
\setlength\marginparwidth   {.6\@tempdima}
\addtolength\marginparwidth {-\marginparsep}
\addtolength\marginparwidth {-0.4in}
\ifdim \marginparwidth >2in
	\setlength\marginparwidth{2in}
\fi

\@settopoint\marginparwidth
\oddsidemargin 0 true cm
\evensidemargin 0 true cm
\@settopoint\evensidemargin
\@settopoint\oddsidemargin
\setlength\topmargin{\paperheight}
\addtolength\topmargin{-2in}
\addtolength\topmargin{-\headheight}
\addtolength\topmargin{-\headsep}
\addtolength\topmargin{-\textheight}
\addtolength\topmargin{-\footskip}     % this might be wrong!
\addtolength\topmargin{-.5\topmargin}
\@settopoint\topmargin
\setlength\footnotesep{8.4\p@}
\setlength{\skip\footins}{10.8\p@ \@plus 4\p@ \@minus 2\p@}
%% 出现在页面的顶部或底部的浮动对象之间的垂直距离。 缺省为\setlength\floatsep {12\p@ \@plus 2\p@ \@minus 4\p@}。 
\setlength\floatsep {20pt plus 5pt minus 2pt}
%% 出现在页面的顶部或底部的浮动对象与文本之间的垂直距离。 缺省为\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength{\textfloatsep} {19pt plus 2pt minus 2pt}
%% 出现在页面中间的浮动对象与上下方文本之间的垂直距离。 缺省为\setlength\intextsep {14\p@ \@plus 4\p@ \@minus 4\p@}
\setlength{\intextsep}{12pt plus 2pt minus 2pt}
%% 是在双列输出时用 \textfloatsep 的数值{14\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\dblfloatsep    {10\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\dbltextfloatsep{10\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{10\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{10\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}

\def\@listi{
	\leftmargin 3em		%%\leftmargini
	\itemindent 0em
	\parsep 0\p@  \@plus 1\p@ \@minus 0\p@
	\topsep 0\p@ \@plus 1\p@   \@minus 0\p@
	\itemsep 0\p@  \@plus 1\p@ \@minus 0\p@
}

\let\@listI\@listi
\@listi
\def\@listii{
	\leftmargin\leftmarginii
	\labelwidth\leftmarginii
	\advance\labelwidth-\labelsep
	\topsep    0\p@   \@plus2.5\p@ \@minus\p@
	\parsep    0\p@ \@plus\p@    \@minus\p@
	\itemsep   \parsep
}
\def\@listiii{
	\leftmargin\leftmarginiii
	\labelwidth\leftmarginiii
	\advance\labelwidth-\labelsep
	\topsep    0\p@\@plus\p@\@minus\p@
	\parsep    \z@
	\partopsep \p@ \@plus\z@ \@minus\p@
	\itemsep   \topsep
}
\def\@listiv{
	\leftmargin\leftmarginiv
	\labelwidth\leftmarginiv
	\advance\labelwidth-\labelsep
}
\def\@listv{
	\leftmargin\leftmarginv
	\labelwidth\leftmarginv
	\advance\labelwidth-\labelsep
}
\def\@listvi{
	\leftmargin\leftmarginvi
	\labelwidth\leftmarginvi
	\advance\labelwidth-\labelsep
}

%% 行间距
\renewcommand\baselinestretch{1.383}
%% 段间距
%\parskip 0.6ex
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{0.85}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.65}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{0.15}
\renewcommand\floatpagefraction{0.6}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

\def\ps@headings{
	\let\@oddfoot\@empty\let\@evenfoot\@empty
	\def\@evenhead{\thepage\hfil\slshape\leftmark}
	\def\@oddhead{{\slshape\rightmark}\hfil\thepage}
	\let\@mkboth\markboth
	\def\chaptermark##1{
		\markboth {
			\MakeUppercase{
				\ifnum \c@secnumdepth >\m@ne
					\if@mainmatter
						\@chapapp\ \thechapter. \ %
					\fi
				\fi
				##1
			}
		}
	}

	\def\sectionmark##1{
		\markright {
			\MakeUppercase{
				\ifnum \c@secnumdepth >\z@
					\thesection. \ %
				\fi
				##1
			}
		}
	}
}

\def\ps@myheadings{
	\let\@oddfoot\@empty\let\@evenfoot\@empty
	\def\@evenhead{\thepage\hfil\slshape\leftmark}
	\def\@oddhead{{\slshape\rightmark}\hfil\thepage}
	\let\@mkboth\@gobbletwo
	\let\chaptermark\@gobble
	\let\sectionmark\@gobble
}

\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}

\renewcommand{\thechapter}{\@arabic\c@chapter}
%% 定义中文章编号，如“第一章”中的“一”。
\newcommand{\CJKthechapter}{\CJKnumber{\thechapter}}
\renewcommand{\thesection}{\thechapter.\@arabic\c@section}
\renewcommand{\thesubsection}{\thesection.\@arabic\c@subsection}
\renewcommand{\thesubsubsection}{\thesubsection.\@arabic\c@subsubsection}
\renewcommand{\theparagraph}{\thesubsubsection.\@arabic\c@paragraph}
\renewcommand{\thesubparagraph}{\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand{\frontmatter}{
	\cleardoublepage
	\@mainmatterfalse
	\pagenumbering{Roman}
}
\newcommand{\mainmatter}{
	\cleardoublepage
	\@mainmattertrue
	\pagenumbering{arabic}
}
\newcommand{\backmatter}{
	\cleardoublepage
	\@mainmatterfalse
}
\newcommand{\part}{
	\cleardoublepage
	\thispagestyle{plain}
	\if@twocolumn
		\onecolumn
		\@tempswatrue
	\else
		\@tempswafalse
	\fi
	\null\vfil
	\secdef\@part\@spart
}

\def\@part[#1]#2{
	\ifnum \c@secnumdepth >-2\relax
		\refstepcounter{part}%
		\addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
	\else
		\addcontentsline{toc}{part}{#1}%
	\fi
	\markboth{}{}%
	{
		\centering
		\interlinepenalty \@M
		\normalfont
		\ifnum \c@secnumdepth >-2\relax
			\huge\bfseries \partname\nobreakspace\thepart
			\vskip 20\p@
		\fi
		\Huge \bfseries #2\par
	}
	\@endpart
}

\def\@spart#1{
	{
		\centering
		\interlinepenalty \@M
		\normalfont
		\Huge \bfseries #1\par
	}
	\@endpart
}

\def\@endpart{
	\vfil\newpage
	\if@twoside
		\if@openright
			\null
			\thispagestyle{empty}%
			\newpage
		\fi
	\fi
	\if@tempswa
		\twocolumn
	\fi
}

%% 定义计数器totalfig、totaltab，在每一章开头将上一章的图表数累加，得到图表总数。
\newcounter{totalfig}
\newcounter{totaltab}
\newcounter{totalpage}
\newcommand{\chapter}{
	\cleardoublepage
	\thispagestyle{plain}
	\global\@topnum\z@
	\@afterindentfalse
	\secdef\@chapter\@schapter
}

\def\@chapter[#1]#2{
	\addtocounter{totalfig}{\c@figure}
	\addtocounter{totaltab}{\c@table}
	\addtocounter{totalpage}{\c@page}
	\addtocontents{toc}{\protect\addvspace{6\p@}}
	\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
			\refstepcounter{chapter}
			\typeout{\@chapapp\space\thechapter.}
			\addcontentsline{toc}{chapter}{第{\if@CJKchapter\CJKthechapter\else\thechapter\fi}章\quad #1}
		\else
			\refstepcounter{chapter}%
			\addcontentsline{toc}{chapter}{附录\quad\thechapter}
		\fi
		\else
			\addcontentsline{toc}{chapter}{#1}%
		\fi
	\chaptermark{#1}%
	\vspace{24pt} %段前空24磅
	\begin{center}
	{
		\bf\heiti\fontsizesan %采用黑体三号字，居中书写
		\if@mainmatter
			第{\if@CJKchapter\CJKthechapter\else\thechapter\fi}章\quad #2
		\else
			附\quad 录\quad\thechapter\\ #2
		\fi
	}
	\end{center}
	\vspace{18pt} %段后空18磅
	\@afterheading
}

\def\@schapter#1{
	\addtocontents{toc}{\protect\addvspace{6\p@}}
	\addcontentsline{toc}{chapter}{#1}%
	\vspace{24pt} %段前空24磅
	\begin{center}
	{
		\interlinepenalty\@M
		\bf\heiti\fontsizesan #1\par\nobreak%采用黑体三号字，居中书写
		\@mkboth{\MakeUppercase #1}{\MakeUppercase #1}
	}
	\end{center}
	\vspace{18pt} %段后空18磅
	\@afterheading
}

\newcommand{\section}{ %一级节标题
	\@startsection{section}{1}{\z@}
	{-24pt} %段前空24磅
	{6pt} %段后空6磅
	{\fontsize{14pt}{20pt}\heiti} %采用黑体四号（14pt）字居左书写，行距为固定值20磅
}

\newcommand{\subsection}{ %二级节标题
	\@startsection{subsection}{2}{\z@}%
	{-12pt} %段前空12磅
	{6pt} %段后空6磅
	{\fontsize{13pt}{20pt}\heiti} %采用黑体13pt字居左书写，行距为固定值20磅
}

\newcommand{\subsubsection}{ %三级节标题
	\@startsection{subsubsection}{3}{\z@}%
	{-12pt} %段前空12磅
	{6pt} %段后空6磅
	{\fontsize{12pt}{20pt}\heiti} %采用黑体小四号（12pt）字居左书写，行距为固定值20磅
}

\newcommand{\paragraph}{
	\@startsection{paragraph}{4}{\z@}%
	{0ex \@plus1ex \@minus.2ex}%
	{-1em}%
	{\normalfont\normalsize\heiti}
}

\newcommand{\subparagraph}{
	\@startsection{subparagraph}{5}{\parindent}%
	{3.25ex \@plus1ex \@minus .2ex}%
	{-1em}%
	{\normalfont\normalsize\heiti}
}

\setlength\leftmargini{2.5em}
\leftmargin\leftmargini
\setlength\leftmarginii{2.2em}
\setlength\leftmarginiii{1.87em}
\setlength\leftmarginiv{1.7em}
\setlength\leftmarginv{1em}
\setlength\leftmarginvi{1em}
\setlength\labelsep{.5em}
\setlength\labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}

\newenvironment{description}{
	\list{}{
		\labelwidth\z@ \itemindent-\leftmargin
		\let\makelabel\descriptionlabel
	}
}{\endlist}

\newcommand*\descriptionlabel[1]{
	\hspace\labelsep
	\normalfont\bfseries #1
}

\newenvironment{verse}{
	\let\\\@centercr
	\list{}{
		\itemsep      \z@
		\itemindent   -1.5em
		\listparindent\itemindent
		\rightmargin  \leftmargin
		\advance\leftmargin 1.5em
	}
	\item\relax
}{\endlist}

\newenvironment{quotation}{
	\list{}{
		\listparindent 1.5em
		\itemindent    \listparindent
		\rightmargin   \leftmargin
		\parsep        \z@ \@plus\p@
	}
	\item\relax
}{\endlist}

\newenvironment{quote}{
	\list{}{
		\rightmargin\leftmargin
	}
	\item\relax
}{\endlist}

\if@compatibility
	\newenvironment{titlepage}{
		\cleardoublepage
		\if@twocolumn
			\@restonecoltrue\onecolumn
		\else
			\@restonecolfalse\newpage
		\fi
		\thispagestyle{empty}%
		\setcounter{page}\z@
	}{\if@restonecol\twocolumn \else \newpage \fi}
\else
	\newenvironment{titlepage}{
		\cleardoublepage
		\@restonecolfalse\newpage
		\thispagestyle{empty}%
		\setcounter{page}\@ne
	}{
		\if@restonecol\twocolumn \else \newpage \fi
		\if@twoside\else\setcounter{page}\@ne\fi
    }
\fi

\newcommand\appendixname{附录}
\usepackage{titlesec}
\newcommand\appendix{
	\par
	\setcounter{chapter}{0}
	\setcounter{section}{0}
	\gdef\@chapapp{\appendixname}
	\gdef\thechapter{\@Alph\c@chapter}
}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}

%% 公式、图表按章编号，中间以“.”间隔。
\renewcommand\theequation{
	\ifnum \c@chapter>\z@ \thechapter .\fi \@arabic\c@equation
}
\newcounter{figure}[chapter]
\renewcommand \thefigure{
	\ifnum \c@chapter>\z@ \ \thechapter .\fi \@arabic\c@figure\
}

\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}

\newenvironment{figure}
{\@float{figure}}
{\end@float}

\newenvironment{figure*}
{\@dblfloat{figure}}
{\end@dblfloat}

\newcounter{table}[chapter]
\renewcommand \thetable{
	\ifnum \c@chapter>\z@ \ \thechapter .\fi \@arabic\c@table\
}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}

\newenvironment{table}
{\@float{table}}
{\end@float}

\newenvironment{table*}
{\@dblfloat{table}}
{\end@dblfloat}

%% 设置图形与正文的间距，标题与图形的间距，子图引用加小括号。
\usepackage[font=small,labelsep=space]{caption}
\usepackage[labelformat=simple]{subfig}
\captionsetup[subtable]{captionskip=0pt,nearskip=0pt,farskip=0pt}
\captionsetup[subfigure]{captionskip=0pt,nearskip=0pt,farskip=0pt}
\captionsetup[figure]{format=hang,position=bottom,belowskip=-11pt,aboveskip=6pt}
\captionsetup[table]{belowskip=0pt,aboveskip=6pt}
\renewcommand{\thesubfigure}{(\alph{subfigure})~}
\renewcommand{\thesubtable}{(\alph{subtable})~} 

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

\newcommand\Nchapter[1]{
	\if@mainmatter
		\@mainmatterfalse
		\chapter{#1}
		\@mainmattertrue
	\else
		\chapter{#1}
	\fi
}

\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
%% 目录中的点之间的间距
\newcommand\@dotsep{1}
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{
	\chapter*{\contentsname
		\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}
	}
	\@starttoc{toc}
	\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}
}

\newcommand*\l@part[2]{
	\ifnum \c@tocdepth >-2\relax
		\addpenalty{-\@highpenalty}
		\addvspace{2.25em \@plus\p@}
		\setlength\@tempdima{3em}
		\begingroup
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			{
				\leavevmode
				\large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}
			}
			\par
			\nobreak
			\global\@nobreaktrue
			\everypar{\global\@nobreakfalse\everypar{}}
		\endgroup
	\fi
}

%% 目录点换用中文cdot
\def\@dottedtocline#1#2#3#4#5{
	\ifnum #1>\c@tocdepth \else
		\vskip \z@ \@plus.2\p@
		{
			\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
			\parindent #2\relax\@afterindenttrue
			\interlinepenalty\@M
			\leavevmode
			\@tempdima #3\relax
			\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
			{#4}\nobreak
			\leaders\hbox{$\m@th \mkern \@dotsep mu \cdot \mkern \@dotsep mu$}\hfill
			\nobreak
			\hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}
			\par
		}
	\fi
}

%% 定义目录各标题的缩进
\newcommand*\l@chapter{\@dottedtocline{0}{0em}{2em}}
\newcommand*\l@section{\@dottedtocline{1}{2em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{4.3em}{3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.3em}{4em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

\newcommand\listoffigures{
	\chapter*{\listfigurename}
	\@mkboth{\MakeUppercase\listfigurename}
	{\MakeUppercase\listfigurename}
	\renewcommand{\numberline}[1]{图~##1~}
	\@starttoc{lof}
}
\newcommand*\l@figure{\@dottedtocline{1}{0em}{2.3em}}
\newcommand\listoftables{
	\chapter*{\listtablename}
	\@mkboth{
		\MakeUppercase\listtablename
	}
	{\MakeUppercase\listtablename}
	\renewcommand{\numberline}[1]{表~##1~}
	\@starttoc{lot}
}
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]{
	\chapter*{\bibname}
	\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}
	\list{\@biblabel{\@arabic\c@enumiv}}{
		\settowidth\labelwidth{\@biblabel{#1}}
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\@openbib@code
		\usecounter{enumiv}
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}
	}
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000
	\sfcode`\.\@m
}{
	\def\@noitemerr
	{\@latex@warning{Empty `thebibliography' environment}}
	\endlist
}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

%%行内引用参考文献（非上标形式）
\DeclareRobustCommand\lcite{\@lcite}   
\def\@lcite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}   

\newenvironment{theindex}{
	\if@twocolumn
		\@restonecolfalse
	\else
		\@restonecoltrue
	\fi
	\cleardoublepage
	\phantomsection
	\addtocontents{toc}{\protect\addvspace{6\p@}}
	\addcontentsline{toc}{chapter}{\indexname}
	\@makeschapterhead{\indexname}
	\@mkboth{\MakeUppercase\indexname}
	{\MakeUppercase\indexname}
	\thispagestyle{plain}\parindent\z@
	\parskip\z@ \@plus .3\p@\relax
	\columnseprule \z@
	\columnsep 35\p@
	\let\item\@idxitem
}{
	\if@restonecol
		\onecolumn
	\else
		\clearpage
	\fi
}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{
	\kern-3\p@
	\hrule\@width.4\columnwidth
	\kern2.6\p@
}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{
	\parindent 1em%
	\noindent
	\hb@xt@1.8em{\hss\@makefnmark}#1
}

\newcommand{\contentsname}{目\quad 录}
\newcommand{\listfigurename}{插图目录}
\newcommand{\listtablename}{表格目录}
\newcommand{\bibname}{参考文献}
\newcommand{\indexname}{索\quad 引}
\newcommand{\figurename}{图}
\newcommand{\tablename}{表}
\newcommand{\partname}{}
\newcommand{\chaptername}{}

\def\today{\ifcase\month\or
	January\or February\or March\or April\or May\or June\or
	July\or August\or September\or October\or November\or December\fi
	\space\number\day, \number\year
}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}
\if@twoside
\else
	\raggedbottom
\fi
\if@twocolumn
	\twocolumn
	\sloppy
	\flushbottom
\elseyx
	\onecolumn
\fi

%封面
\def\@subject{}
\newcommand\subject[1]{\def\@subject{#1}}

\if@titlepage
	\newcommand{\maketitle}{
		\begin{center}
			\makebox[.7\linewidth][s]{\heiti\fontsizexchu\@title} \\
			\vskip \stretch{0.7}
			{\heiti\fontsizeyi\@subject} %字体采用一号黑体字，居中书写，一行写不下时可分两行写，并采用1.25倍行距。
		\end{center}
	}
\fi

% 中文摘要
\newenvironment{abstract}
{
	\cleardoublepage
	\phantomsection
	\addtocontents{toc}{\protect\addvspace{6\p@}}
	\addcontentsline{toc}{chapter}{摘\quad 要}
	\@mkboth{\MakeUppercase 摘\quad 要}{\MakeUppercase 摘\quad 要}%
	\thispagestyle{plain}
	\vspace*{5pt}
	\begin{center}
		{\bf\heiti\fontsizesan 摘\quad 要}
	\end{center}
	\vspace{15pt}



}

\newcommand\keywords[1]{
	\vspace*{15pt}
	\noindent{\bf 关键词：}{#1}
}

% 英文摘要
\newenvironment{eabstract}
{
	\cleardoublepage
	\phantomsection
	\addtocontents{toc}{\protect\addvspace{6\p@}}
	\addcontentsline{toc}{chapter}{Abstract}
	\@mkboth{\MakeUppercase Abstract}{\MakeUppercase Abstract}%
	\thispagestyle{plain}
	\vspace*{5pt}
	\begin{center}
		{\arial\fontsizesan Abstract}
	\end{center}
	\vspace{15pt}



}

\newcommand\ekeywords[1]{
	\vspace*{15pt}
	\noindent{\bf Keywords:~}{#1}
}

%% 页眉页角设置
\usepackage{fancyhdr}
\pagestyle{fancy}

%% 定义页眉章标题写法格式。
\renewcommand{\chaptermark}[1]{
	\if@mainmatter
		\markboth{第{\if@CJKchapter\CJKthechapter\else\thechapter\fi}章\quad  #1}{}
	\else
		\markboth{附录\quad\thechapter}{}
	\fi
}

%% 定义plain页眉页角样式（只有页码），用于章首页。
\fancypagestyle{plain}{
	\fancyhf{}
	\fancyhead[CE]{\small \@title}
	\fancyhead[CO]{\small \leftmark}
	\fancyfoot[CE,CO]{\small ~\thepage~}
}

%% 定义fancy页眉页角样式（偶数页页眉题目，奇数页页眉章名，页码居中），用于正常页。
\pagestyle{fancy}
\fancyhf{}
\fancyhead[CE]{\small \@title}
\fancyhead[CO]{\small \leftmark}
\fancyfoot[CE,CO]{\small ~\thepage~}

\endinput