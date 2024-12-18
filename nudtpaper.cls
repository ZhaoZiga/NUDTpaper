%% This is file `nudtpaper.cls',
% 出现任何问题请联系（zhangxinhang19@foxmial.com）
% 该模板的著作权属于（zhangxinhang19@foxmial.com）
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{nudtpaper}
[2020/07/01 v2.8 NUDT paper template]
\newif\ifisanon\isanonfalse
\DeclareOption{anon}{\isanontrue}
\newif\ifistwoside\istwosidefalse
\DeclareOption{twoside}{\istwosidetrue}
\DeclareOption*{\PackageWarning{nudtpaper}{Unknown Option '\CurrentOption'}}
\newif\ifisttf\isttffalse
\newif\ifisotf\isotffalse
\newif\ifisfz\isfzfalse
\newif\ifisfandol\isfandolfalse
\DeclareOption{ttf}{\isttftrue}
\DeclareOption{otf}{\isotftrue}
\DeclareOption{fz}{\isfztrue}
\DeclareOption{fandol}{\isfandoltrue}
%add biber option
%if biber is set, use biblatex to generate bibliography
\newif\ifisbiber\isbiberfalse
\DeclareOption{biber}{\isbibertrue}
\ProcessOptions\relax
\RequirePackage{ifthen,calc}
\ifistwoside
  \LoadClass[a4paper,12pt,openright,twoside]{book}
\else
  \LoadClass[a4paper,12pt,openany]{book}
\fi
\RequirePackage[includeheadfoot]{geometry}
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage{titletoc}
\RequirePackage{graphicx}
\graphicspath{{image/svg/}{image/}{images/}{figure/}{figures/}{resources/}}
\RequirePackage[config]{subfig}
\RequirePackage{float}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{tabularx}
\RequirePackage{slashbox}
\RequirePackage[neverdecrease]{paralist}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{amsmath,amssymb}
\RequirePackage[Symbolsmallscale]{upgreek}
\interdisplaylinepenalty=2500
\RequirePackage{bm}
\RequirePackage[T1]{fontenc}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage[CJKchecksingle,no-math]{xeCJK}
\RequirePackage{zhnumber}
\RequirePackage{indentfirst}
\RequirePackage{xunicode-addon}
\newcommand{\fttilde}{\fontspec{FreeSerif}\selectfont}
\ifisbiber
% \RequirePackage[backend=biber,style=gb7714-2015,gbalign=gb7714-2015,%
% gbnamefmt=lowercase,gbpub=false,doi=false]{biblatex}%
\RequirePackage[backend=biber,style=gb7714-2015,gbalign=right,%
gbnamefmt=lowercase,gbpub=false,doi=false,url= false]{biblatex}%
\addbibresource[location=local]{ref/refs.bib}    %-----Ziger-----
\setlength{\bibitemsep}{1pt}
\setlength{\bibnamesep}{0ex}
\setlength{\bibinitsep}{0ex}
\setlength{\biblabelsep}{6pt}
\newlength{\refindent}
\setlength{\refindent}{24pt}
% 如果不想右对齐把下面注释去掉，同时使用gbalign=gb7714-2015
\newcommand{\itemcmd}{%
\setlength{\lengthid}{0cm}%
\setlength{\lengthlw}{\textwidth}%
\addtolength{\lengthlw}{-\lengthid}%
\addvspace{\bibitemsep}%恢复\bibitemsep的作用 %\parshape 2 0em \textwidth \lengthid \lengthlw
\hangindent\lengthid%
\hspace{\refindent}\mkgbnumlabel{\printfield{labelnumber}}%
\hspace{\biblabelsep}
}
\DefineBibliographyExtras{english}{\renewcommand*{\bibrangedash}{{\fttilde\textsim}}}%将页码间隔符替换会英文的短横线
%比如：～$\sim$\symbol{"FF5E}\symbol{"223C}\symbol{"2053}\symbol{"02DC}\symbol{"02F7}
%\textsim \textbacksim \texttildebelow \texttildelow \texttilde
\defbibheading{subbibliography}[\bibname]{%
\section*{#1}}
\DeclareDelimFormat{streditortypes}{\bibopenparen%
  \edef\userfieldabcde{userd}%
  \ifcurrentname{editor}{\edef\userfieldabcde{userc}}{}%
  \ifcurrentname{bookauthor}{\edef\userfieldabcde{userb}}{}%
  \ifcase\value{gbbiblocalcase}%
    \iffieldequalstr{\userfieldabcde}{chinese}{\bibstring{\thefield{editortype}scn}}{}%
    \iffieldequalstr{\userfieldabcde}{korean}{\bibstring{\thefield{editortype}skr}}{}%
    \iffieldequalstr{\userfieldabcde}{japanese}{\bibstring{\thefield{editortype}sjp}}{}%
    \iffieldequalstr{\userfieldabcde}{english}{\bibstring{\thefield{editortype}s}}{}%
    \iffieldequalstr{\userfieldabcde}{french}{\bibstring{\thefield{editortype}s}}{}%
    \iffieldequalstr{\userfieldabcde}{russian}{\bibstring{\thefield{editortype}s}}{}%
  \or%
  \bibstring{\thefield{editortype}scn}%
  \or%
  \bibstring{\thefield{editortype}s}%
  \fi\bibcloseparen}
\DeclareDelimFormat{streditortype}{\bibopenparen%
  \edef\userfieldabcde{userd}%
  \ifcurrentname{editor}{\edef\userfieldabcde{userc}}{}%
  \ifcurrentname{bookauthor}{\edef\userfieldabcde{userb}}{}%
  \ifcase\value{gbbiblocalcase}%
    \iffieldequalstr{\userfieldabcde}{chinese}{\bibstring{\thefield{editortype}cn}}{}%
    \iffieldequalstr{\userfieldabcde}{korean}{\bibstring{\thefield{editortype}kr}}{}%
    \iffieldequalstr{\userfieldabcde}{japanese}{\bibstring{\thefield{editortype}jp}}{}%
    \iffieldequalstr{\userfieldabcde}{english}{\bibstring{\thefield{editortype}}}{}%
    \iffieldequalstr{\userfieldabcde}{french}{\bibstring{\thefield{editortype}}}{}%
    \iffieldequalstr{\userfieldabcde}{russian}{\bibstring{\thefield{editortype}}}{}%
  \or%
  \bibstring{\thefield{editortype}cn}%
  \or%
  \bibstring{\thefield{editortype}}%
  \fi\bibcloseparen}
\renewbibmacro*{in:}{%
 \iftoggle{bbx:gbpunctin}{\printtext{\textbf{//}\allowbreak}}%\addthinspace
                         {\setunit{\adddot\addspace}%
                         \iffieldequalstr{userd}{chinese}%
                         {\printtext{\bibstring{incn}}}%
                         {\printtext{\bibstring{in}}}%
                         }}%\newunit\newblock\intitlepunct
\else
\RequirePackage[numbers,sort&compress,square]{natbib}
\let\newcite=\cite
\let\parencite=\newcite
\let\inlinecite=\newcite
\newcommand{\upcite}[1]{\textsuperscript{\newcite{#1}}} % 上标形式引用
\renewcommand{\cite}[1]{\textsuperscript{\newcite{#1}}} % 上标形式引用
\fi
\RequirePackage{hyperref}
% 超链接
\hypersetup{%
%         xetex,
        % unicode=false, % hyperref 和 xetex 同时使用时不能开启 Unicode 选项.
         pdfstartview=FitH,
         CJKbookmarks=true,
         bookmarksnumbered=true,
         bookmarksopen=true,
         colorlinks, %注释掉此项则交叉引用为彩色边框(将colorlinks和pdfborder同时注释掉)
         pdfborder=001,   %注释掉此项则交叉引用为彩色边框
         allcolors=black,
         breaklinks=true
}%
\RequirePackage{cleveref}
\RequirePackage{datetime}
\defaultfontfeatures{Mapping=tex-text}
\xeCJKsetcharclass{"0}{"2E7F}{0}
\xeCJKsetcharclass{"2E80}{"FFFF}{1}


%-------------------------Ziger修改字体-------------
%\newcommand{\installttf}{
%   %%%% Windows Thesis Fonts
%    \setmainfont{Times New Roman PS Std}
%    \setsansfont{Arial}
%    \setmonofont{Courier New}
%    %%%% Using Office Family Fonts
%    \setCJKmainfont[BoldFont={STZhongsong}]{SimSun}
%    \setCJKsansfont{SimHei} % Hei
%    \setCJKmonofont{FangSong} % Fangsong
%    %%%% alias
%    \setCJKfamilyfont{song}[AutoFakeBold={2.17}]{SimSun}
%    \setCJKfamilyfont{hei}{SimHei}
%    \setCJKfamilyfont{fs}[AutoFakeBold={2.17}]{仿宋_GB2312.ttf} % fang-song
%    \setCJKfamilyfont{kai}{KaiTi} % Kai
%}
%
%\newcommand{\installotf}{
%    %%%% Windows Thesis Fonts
%    \setmainfont{Times New Roman PS Std}
%    \setsansfont{Arial}
%    \setmonofont{Courier New}
%    %%%% Using Adobe Family Fonts
%    \setCJKmainfont[BoldFont={STZhongsong}]{Adobe Song Std}
%    \setCJKsansfont{Adobe Heiti Std} % Hei
%    \setCJKmonofont{Adobe Fangsong Std} % Fangsong
%    %%%% alias
%    \setCJKfamilyfont{song}[AutoFakeBold={2.17}]{Adobe Song Std}
%    \setCJKfamilyfont{hei}{Adobe Heiti Std}
%    \setCJKfamilyfont{fs}[AutoFakeBold={2.17}]{Adobe Fangsong Std} % fang-song
%    \setCJKfamilyfont{kai}{Adobe Kaiti Std} % Kai
%}
%
%\newcommand{\installfz}{
%    %%%% Windows Thesis Fonts
%    \setmainfont{Times New Roman PS Std}
%    \setsansfont{Arial}
%    \setmonofont{Courier New}
%    %%%% Using Founder Family Fonts
%    \setCJKmainfont[BoldFont={FZYaSong-DB-GBK}]{FZShuSong_GB18030-Z01}
%    \setCJKsansfont{FZHei-B01} % Hei
%    \setCJKmonofont{FZFangSong-Z02} % fs
%    %%%% alias
%    \setCJKfamilyfont{song}[AutoFakeBold={2.17}]{FZShuSong_GB18030-Z01}
%    \setCJKfamilyfont{hei}{FZHei-B01}
%    \setCJKfamilyfont{fs}[AutoFakeBold={2.17}]{FZFangSong-Z02} % fang-song
%    \setCJKfamilyfont{kai}{FZKai-Z03} % Kai
%}
%
%\newcommand{\installfandol}{
%    %%%% Windows Thesis Fonts
%    \setmainfont{Times New Roman PS Std}
%    \setsansfont{Arial}
%    \setmonofont{Courier New}
%    %%%% Using Fandol Family Fonts
%    \setCJKmainfont{FandolSong}
%    \setCJKsansfont{FandolHei} % Hei
%    \setCJKmonofont{FandolFang} % fs
%    %%%% alias
%    \setCJKfamilyfont{song}[AutoFakeBold={2.17}]{FandolSong}
%    \setCJKfamilyfont{hei}{FandolHei}
%    \setCJKfamilyfont{fs}[AutoFakeBold={2.17}]{FandolFang} % fang-song
%    \setCJKfamilyfont{kai}{FandolKai} % Kai
%}
%
%\ifisttf
%\installttf
%\fi
%
%\ifisotf
%\installotf
%\fi
%
%\ifisfz
%\installfz
%\fi
%
%\ifisfandol
%\installfandol
%\fi
%
%---------------------------Ziger---------------------
\newcommand{\installttf}{
    %%%% Windows Thesis Fonts
    \setmainfont{Times New Roman}
    \setsansfont{Arial}
    \setmonofont{Courier New}

    %%%% alias
    \setCJKfamilyfont{song}[AutoFakeBold={2.17},Path = fonts/]{simsun.ttc}
    \setCJKfamilyfont{hei}[Path = fonts/]{simhei.ttf}
    \setCJKfamilyfont{fs}[AutoFakeBold={2.17},Path = fonts/]{fangsong_GB2312.ttf} % fang-song
    \setCJKfamilyfont{kai}[Path = fonts/]{simkai.ttf} % Kai
}

\ifisttf
\installttf
\fi

%-------------------------Ziger修改字体-------------
\newcommand{\cusong}{\bfseries}
\newcommand{\song}{\CJKfamily{song}}     % 宋体
\newcommand{\fs}{\CJKfamily{fs}}         % 仿宋体
\newcommand{\kai}{\CJKfamily{kai}}       % 楷体
\newcommand{\hei}{\CJKfamily{hei}}       % 黑体
\def\songti{\song}
\def\fangsong{\fs}
\def\kaishu{\kai}
\def\heiti{\hei}
\newlength\thu@linespace
\newcommand{\thu@choosefont}[2]{%
    \setlength{\thu@linespace}{#2*\real{#1}}%
    \fontsize{#2}{\thu@linespace}\selectfont}
\def\thu@define@fontsize#1#2{%
    \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \thu@choosefont{##1}{#2}}}
\thu@define@fontsize{chuhao}{42bp}
\thu@define@fontsize{xiaochu}{36bp}
\thu@define@fontsize{yihao}{26bp}
\thu@define@fontsize{xiaoyi}{24bp}
\thu@define@fontsize{erhao}{22bp}
\thu@define@fontsize{xiaoer}{18bp}
\thu@define@fontsize{sanhao}{16bp}
\thu@define@fontsize{xiaosan}{15bp}
\thu@define@fontsize{sihao}{14bp}
\thu@define@fontsize{banxiaosi}{13bp}
\thu@define@fontsize{xiaosi}{12bp}
\thu@define@fontsize{dawu}{11bp}
\thu@define@fontsize{wuhao}{10.5bp}
\thu@define@fontsize{xiaowu}{9bp}
\thu@define@fontsize{liuhao}{7.5bp}
\thu@define@fontsize{xiaoliu}{6.5bp}
\thu@define@fontsize{qihao}{5.5bp}
\thu@define@fontsize{bahao}{5bp}
\newcommand{\china}{中华人民共和国}
\def\nudtpaper{\textsc{Nudt}\textsc{Paper}}
\newcommand{\pozhehao}{\kern0.2em\rule[0.8ex]{1.6em}{0.1ex}\kern0.2em}
\newcommand{\xiaopozhe}{\kern0.2em\rule[0.8ex]{0.6em}{0.1ex}\kern0.2em}
\renewcommand\contentsname{目\hspace{1em}录}
\renewcommand\listfigurename{图\hspace{1em}目\hspace{1em}录}
\renewcommand\listtablename{表\hspace{1em}目\hspace{1em}录}
\newcommand\listequationname{公式索引}
\newcommand\equationname{公式}
\renewcommand\bibname{参考文献}
\renewcommand\indexname{索引}
\renewcommand\figurename{图}
\renewcommand\tablename{表}
\renewcommand\appendixname{附录}
\def\CJK@today{\zhdigits{\the\year}年\zhnumber{\the\month}月}
\renewcommand\zhtoday{\CJK@today}
\newcommand\entoday{\monthname{}, \the\year}
\geometry{top=21mm,bottom=25.5mm,left=30mm,right=30mm}
\geometry{headheight=9mm,headsep=1mm,footskip=9mm}
\renewcommand\setheadrule[1]{%
  \ifdim#1=\z@
    \let\makeheadrule\@empty
  \else
    \def\makeheadrule{%
    \makebox[0pt][l]{\rule[.2\baselineskip]{\linewidth}{1.5pt}}%
    \rule{\linewidth}{1.5pt}}%
  \fi}
\renewpagestyle{plain}{
\sethead{}{\raisebox{.65\baselineskip}{\songti \wuhao 国防科技大学本科毕业论文}}{}%
\setfoot{}{{\songti \wuhao 第~\thepage~页}}{}%
\headrule%
\footrule%
}
\setfootrule{1bp}
\renewcommand\frontmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \pagenumbering{Roman}
    \pagestyle{plain}}
\newcommand\midmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \pagenumbering{roman}
    \pagestyle{plain}}
\renewcommand\mainmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmattertrue
    \pagenumbering{arabic}
    \pagestyle{plain}}
\renewcommand\backmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \titleformat{\chapter}{\filcenter \heiti \sanhao}{附录\,\thechapter\,}{1em}{}
    \titlecontents{chapter}[0pt]{\vspace{0.25\baselineskip}  \xiaosi[1.25]}
      {附录\,\thecontentslabel\quad}{}
      {\hspace{.5em}\titlerule*{.}\contentspage}
    \@mainmattertrue
    \pagestyle{plain}}
\renewcommand\cleardoublepage{\clearpage\if@openright \ifodd\c@page\else
  \newpage{}
  \thispagestyle{empty}
  \vspace*{\fill}
  \begin{center}
  \end{center}
  \vspace*{\fill}
  \clearpage\fi\fi%
}
\titlecontents{chapter}[0pt]{\vspace{0.25\baselineskip} \songti \xiaosi[1.25]}
    % {第\zhnumber{\thecontentslabel}章\quad}{}
    {第\thecontentslabel 章\quad}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{section}[2em]{\songti \xiaosi[1.25]}
    {\thecontentslabel\quad}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[4em]{\songti \xiaosi[1.25]}
    {\thecontentslabel\quad}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{figure}[0pt]{\songti \xiaosi[1.25]}
    {\makebox[3.5em][l]{图~\thecontentslabel\quad}}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{table}[0pt]{\songti \xiaosi[1.25]}
    {\makebox[3.5em][l]{表~\thecontentslabel\quad}}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\nudt@chapter\@schapter}
\def\nudt@chapter[#1]#2{
  \ifnum \c@secnumdepth >\m@ne
    \if@openright\cleardoublepage\else\clearpage\fi
    \phantomsection
    \if@mainmatter
      \refstepcounter{chapter}%
      \addcontentsline{toc}{chapter}%
        {\protect\numberline{\thechapter}#1}%
    \else
      \addcontentsline{toc}{chapter}{#1}%
    \fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \if@twocolumn
    \@topnewpage[\@makechapterhead{#2}]%
  \else
    \@makechapterhead{#2}%
    \@afterheading
  \fi
}
\newcommand\cabstractname{摘\hspace{1em}要}
\newcommand\eabstractname{ABSTRACT}
\newcommand\ckeywordsname{关键词}
\newcommand\ckeywords[1]{{\hei\xiaosi \ckeywordsname：#1}}
\newcommand\ekeywordsname{KEY WORDS}
\newcommand\ekeywords[1]{\xiaosi \textbf{\ekeywordsname}：#1}
\newenvironment{cabstract}{%
    \chapter{\cabstractname}
    \xiaosi
    \@afterheading}
    {\par\vspace{2em}\par}
\newenvironment{eabstract}{%
    \chapter{\textbf{\eabstractname}}
    \xiaosi
    \@afterheading}
    {\par\vspace{2em}\par}
\newcommand{\sectionbreak}{%
\addpenalty{-300}%
\vspace*{0pt}%
}
\setlength{\topskip}{0pt}
\setcounter{secnumdepth}{3}
\setlength{\footnotesep}{2.2ex \@minus 2bp}
% 无衬线（一般的大标题）
% \titleformat{\chapter}{\filcenter\sf \heiti\sanhao[1.25]}{第\zhnumber{\thechapter}章\,}{1em}{}
% \titleformat{\chapter}{\filcenter \heiti\sanhao[1.25]}{第\zhnumber{\thechapter}章\,}{1em}{}
\titleformat{\chapter}{\filcenter \heiti\sanhao[1.25]}{第\thechapter 章\,}{1em}{}
\titleformat{\section}{\bfseries \heiti\sihao[1.25]}{\thesection}{1em}{}
\titleformat{\subsection}{\bfseries \heiti\xiaosi[1.25]}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\bfseries \heiti\xiaosi[1.25]}{\thesubsubsection}{1em}{}
\titlespacing{\chapter}{0pt}{2.4ex-\topskip-\heightof{A}}{2.4ex \@minus 2bp}
\titlespacing{\section}{0pt}{2ex-\heightof{a}}{2ex \@minus 2bp}
\titlespacing{\subsection}{0pt}{2ex \@minus 2bp}{2ex \@minus 2bp}
\titlespacing{\subsubsection}{0pt}{1ex \@minus 2bp}{1ex \@minus 2bp}
\renewcommand\normalsize{%
\@setfontsize\normalsize{12bp}{12.87bp}%
\renewcommand{\baselinestretch}{1.3}%
\setlength\abovedisplayskip{10bp \@minus 1bp}%
\setlength\abovedisplayshortskip{10bp \@minus 1bp}%
\setlength\belowdisplayskip{\abovedisplayskip}%
\setlength\belowdisplayshortskip{\abovedisplayshortskip}%
}
\newlength\CJK@twochars
\def\CJKindent{%
  \settowidth\CJK@twochars{中国}%
  \parindent\CJK@twochars}
\AtBeginDocument{%
  \CJKindent\relax
  % \checkparameter\relax
}
\setlength{\parskip}{0bp \@minus 1bp}
\newcommand*{\ziju}[1]{\renewcommand{\CJKglue}{\hskip #1}}
\newlength\biblabelwd
\settowidth\biblabelwd{\widthof{[999]}} % Maximum Ref Num = 999
\renewenvironment{thebibliography}[1]{%
  \chapter*{\bibname}%
  \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
  \begin{enumerate}[label={[\arabic{enumi}]},itemsep=0pt,parsep=0pt,labelindent=\CJK@twochars,labelwidth=\biblabelwd,leftmargin=0pt,itemindent=*,align=left]
  \@openbib@code%
  \sloppy\frenchspacing%
  \clubpenalty4000%
  \widowpenalty4000%
  \interlinepenalty4000%
  \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
     \end{enumerate}\frenchspacing}
\setlength{\floatsep}{12bp}
\setlength{\intextsep}{12bp}
\setlength{\textfloatsep}{12bp}
\setlength{\@fptop}{0bp}
\setlength{\@fpsep}{12bp}
\setlength{\@fpbot}{0bp}
\renewcommand{\textfraction}{0.01}
\renewcommand{\topfraction}{0.98}
\renewcommand{\bottomfraction}{0.98}
\renewcommand{\floatpagefraction}{0.90}
\clubpenalty=5000
\widowpenalty=5000
\displaywidowpenalty=5000
\let\old@tabular\@tabular
\def\thu@tabular{\wuhao[1.25]\old@tabular}
\let\nudt@oldlongtable\longtable
\let\nudt@endoldlongtable\endlongtable
\renewenvironment{longtable}%
    {\bgroup%
    \wuhao[1.25]
    \nudt@oldlongtable}%
    {\nudt@endoldlongtable\egroup}
\DeclareCaptionLabelFormat{thu}{{\wuhao[1.25]\song#1~\rmfamily #2}}
\DeclareCaptionLabelSeparator{thu}{\hspace{1em}}
\DeclareCaptionFont{thu}{\wuhao[1.25]}
\captionsetup{labelformat=thu,labelsep=thu,font=thu}
\captionsetup[table]{position=top,belowskip=0bp \@plus 2bp \@minus 2bp,aboveskip=6bp \@plus 2bp \@minus 2bp}%
\captionsetup[figure]{position=bottom,belowskip=-3bp \@plus 2bp \@minus 2bp,aboveskip=6bp \@plus 2bp \@minus 2bp}%
\captionsetup[subfloat]
{labelformat=simple,font=thu,captionskip=6bp,nearskip=6bp,farskip=0bp,topadjust=0bp}
% 设置图, 表, 公式的编号为短杠形式
\DeclareCaptionLabelSeparator{colon}{-}
\RequirePackage{mathtools}
\renewcommand\theequation{\thechapter-\arabic{equation}}
\renewcommand\thefigure{\thechapter-\arabic{figure}}
\renewcommand\thetable{\thechapter-\arabic{table}}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\renewcommand{\thesubtable}{(\alph{subtable})}
\let\thu@LT@array\LT@array
\def\LT@array{\thu@LT@array}
\newenvironment{denotation}[1][2.71828cm]{
    \noindent\vskip-4bp\begin{list}{}%
    {\vskip-30bp\xiaosi[1.5]
    \renewcommand\makelabel[1]{\textbf{##1}\hfil}
    \setlength{\labelwidth}{#1} % 标签盒子宽度
    \setlength{\labelsep}{0cm} % 标签与列表文本距离
    \setlength{\itemindent}{0em} % 标签缩进量
    \setlength{\leftmargin}{\labelwidth+\labelsep+2em} % 左边界
    \setlength{\rightmargin}{0cm}
    \setlength{\parsep}{0cm} % 段落间距
    \setlength{\itemsep}{0cm} % 标签间距
    \setlength{\listparindent}{0pt} % 段落缩进量
    \setlength{\topsep}{0pt} % 标签与上文的间距
}}{\end{list}}
\newenvironment{ack}{%
    \chapter*{致\hspace{1em}谢}%
    \addcontentsline{toc}{chapter}{致谢}%
    \ifisanon\color{white}\else\relax\fi%
    \xiaosi%
    \@afterheading}
    {\par\vspace{2em}\par}
\renewtheoremstyle{nonumberplain}%
{\item[\hspace*{2em} \theorem@headerfont ##1\ \theorem@separator]}%
{\item[\hspace*{2em} \theorem@headerfont ##1\ (##3)\theorem@separator]}
\theoremstyle{nonumberplain}
\theorembodyfont{\kai\xiaosi[1.3]}
\theoremheaderfont{\hei\xiaosi[1.3]}
\theoremseparator{:\,}
\newtheorem{proof}{证明}[chapter]
\newtheorem{assumption}{假设}[chapter]

\renewtheoremstyle{plain}%
{\item[\hspace*{2em} \theorem@headerfont ##1\ ##2\theorem@separator]}%
{\item[\hspace*{2em} \theorem@headerfont ##1\ ##2\ (##3)\theorem@separator]}
\theoremstyle{plain}
\theorembodyfont{\kai\xiaosi[1.3]}
\theoremheaderfont{\hei\xiaosi[1.3]}
\theoremsymbol{}
\newtheorem{definition}{定义}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{conjecture}{猜想}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{exercise}{练习}[section]
\newtheorem{example}{例}[chapter]
\newtheorem{problem}{问题}[section]
\newtheorem{remark}{注释}[section]
\renewcommand\thedefinition{\thechapter-\arabic{definition}}
\renewcommand\thelemma{\thechapter-\arabic{lemma}}
\renewcommand\thetheorem{\thechapter-\arabic{theorem}}
\renewcommand\theaxiom{\thechapter-\arabic{axiom}}
\renewcommand\thecorollary{\thechapter-\arabic{corollary}}
\renewcommand\theconjecture{\thechapter-\arabic{conjecture}}
\renewcommand\theproposition{\thechapter-\arabic{proposition}}
\renewcommand\theexercise{\thechapter-\arabic{exercise}}
\renewcommand\theexample{\thechapter-\arabic{example}}
\renewcommand\theproblem{\thechapter-\arabic{problem}}
\renewcommand\theremark{\thechapter-\arabic{remark}}
%%% crefformat settings
\crefformat{figure}{#2图~#1#3}
\crefrangeformat{figure}{图~#3#1#4\;到{}\;#5#2#6}
\crefmultiformat{figure}{图~#2#1#3}{和~#2#1#3}{，#2#1#3}{和~#2#1#3}
\crefformat{table}{#2表#1#3}
\crefrangeformat{table}{表#3#1#4\;到{}\;#5#2#6}
\crefmultiformat{table}{表~#2#1#3}{和~#2#1#3}{，#2#1#3}{和~#2#1#3}
\crefformat{equation}{#2式~(#1#3)}
\crefrangeformat{equation}{式~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{equation}{式~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}

\def\serialno#1{\def\@serialno{#1}} % 学号√
\def\title#1{\def\@title{#1}} % 中文题目√
\newtoks\displaytitle
\def\author#1{\def\@author{#1}} % 作者√
\def\firstmajor#1{\def\@firstmajor{#1}} % 培养类型√
\def\major#1{\def\@major{#1}} % 专业√
\def\college#1{\def\@college{#1}} % 学院√
\def\grade#1{\def\@grade{#1}} % 年级√
\def\supervisor#1{\def\@supervisor{#1}} % 导师√
\def\teachtitle#1{\def\@teachtitle{#1}} % 职称√
\def\department#1{\def\@department{#1}} %所属单位√

\def\maketitle{%
  \ifisanon%
  \author{}%
  \serialno{}%
  \firstmajor{}%
  \major{}
  \supervisor{}%
  \teachtitle{}
  \college{}
  \grade{}
  \department{}
  \else\relax\fi%
  \pagenumbering{alph}% not display, for print only
  \thispagestyle{empty}%

  \begin{flushleft}        %---------Ziger------------
    {\song \sihao {\textbf{编号：}}\underline{\makebox[3cm]{666}}} 
    \hspace{6cm} 
    {\song \sihao {\textbf{密级：}}\underline{\makebox[3cm]{暂定}}} \\
  \end{flushleft}

  \vspace*{72pt}
	\begin{center}
		\fontsize{30pt}{0} \textbf{\song{本\hspace*{15pt}科\hspace*{15pt}毕\hspace*{15pt}业\hspace*{15pt}论\hspace*{15pt}文}}\\
		\vspace*{122pt}

		\sanhao\textbf{\song{课题名称}}：\ \ \underline{\parbox[c]{310pt}{\centering\textbf{\fs{\@title}}}}\\
		\vspace*{90pt}

    \begin{tabular}{cp{3.75cm}cp{3.75cm}cp{3.75cm}cp{3.75cm}}
      \vspace*{6pt}

      \sihao
      \textbf{\song{学\hfill{}员\hfill{}姓\hfill{}名}}：  & \sihao\underline{\makebox[108pt]{\textbf{\fs{\@author}}}} & \sihao\textbf{\song{学\hfill{}号}}： & \sihao\underline{\makebox[108pt]{\textbf{\fs{\@serialno}}}} \\
      \vspace*{6pt}

      \sihao
      \textbf{\song{首\hfill{}次\hfill{}任\hfill{}职\hfill{}专\hfill{}业}}： & \sihao\underline{\makebox[108pt]{\textbf{\fs{\@firstmajor}}}} & \sihao\textbf{\song{学\hfill{}历\hfill{}教\hfill{}育\hfill{}专\hfill{}业}}： & \sihao\underline{\makebox[108pt]{\textbf{\fs{\@major}}}} \\
      \vspace*{6pt}

      \sihao
      \textbf{\song{命\hfill{}题\hfill{}学\hfill{}院}}： & \sihao\underline{\makebox[108pt]{\textbf{\fs{\@college}}}} & \sihao\textbf{\song{年\hfill{}级}}： & \sihao\underline{\makebox[108pt]{\textbf{\fs{\@grade}}}} \\
      \vspace*{6pt}

      \sihao
      \textbf{\song{指\hfill{}导\hfill{}教\hfill{}员}}： & \sihao\underline{\makebox[108pt]{\textbf{\fs{\@supervisor}}}} & \sihao\textbf{\song{职\hfill{}称}}： & \sihao\underline{\makebox[108pt]{\textbf{\fs{\@teachtitle}}}} \\
      \vspace*{6pt}

      \sihao
      \textbf{\song{所\hfill{}属\hfill{}单\hfill{}位}}： & \multicolumn{3}{c}{\sihao
      \underline{\makebox[11.5cm]{\textbf{\fs{\@department}}}}}  
    \end{tabular}
		\vspace*{70pt}

		\sanhao\heiti{国防科技大学教育训练部制}
	\end{center}
  \normalsize % normal, 正文开始
  \def\@tabular{\wuhao[1.25]\old@tabular} % 之后表格字体使用5号
  \cleardoublepage%
  \newpage
  \thispagestyle{empty}

} % QED
\endinput
%%
%% End of file `nudtpaper.cls'.
