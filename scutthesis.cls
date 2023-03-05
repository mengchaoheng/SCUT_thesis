% Copyright (C) 2010-2015 by Alwin Tsui <alwintsui@gmail.com>
% and Quansheng Guan <qshguan@gmail.com>
%
% This file is part of the scutthesis package project.
% https://github.com/alwintsui/scutthesis
% ---------------------------------------------------
% This file may be distributed and/or modified under the
% conditions of the GNU General Public License v3
% of this license or (at your option) any later version.
%
% modified from thuthesis.cls,seuthesis.cls and tjthesis.cls

%% Jun 19, 2010.参照现有国内各高校论文latex模板(东南，清华，北航等)，取其精华去其糟粕，写成初版
%% Jun 20, 2010,修改abstract,keywords,Appendence支持lyx的scutthesis.layout
%% Jun 22, 2010,用natbib来控制引用标的显示
%% v2.0.1, Mar 31, 2011,合并了Quansheng Guan部分修改,主要包含：草稿引入水印，加入定理环境，完善标题、表格和程序代码等格式
%% v2.1.0, Jun 20, 2015,启用pdfcover选项，修改代码区显示方式，附录页眉，去除草稿水印，lyx模板


\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{scutthesis}[2011/03/31 2.0.1 The LaTeX class for the thesis of South China University of Technology]

%% import global options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifmasterdegree\masterdegreefalse %默认为doctor
\newif\ifpdfcover\pdfcoverfalse
\newif\ifchapterx\chapterxfalse

\DeclareOption{master}{\masterdegreetrue}
\DeclareOption{pdfcover}{\pdfcovertrue} %using pdfcover,TOdo
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax %revised by Quansheng Guan \ProcessOptions
\LoadClass[12pt,a4paper,openany]{book}

%% define 几个宏
\newcommand{\scutthesis}{%
  S\hspace{-0.3ex}\raisebox{-0.5ex}{C}\hspace{-0.3ex}U\hspace{0.1em}\raisebox{-0.5ex}{T}%
  \textsc{Thesis}
}
\def \institute#1{\gdef\@institute{#1}}
\def \supervisor#1{\gdef\@supervisor{#1}}
\ifmasterdegree \newcommand{\@degree}{硕士} \else \newcommand{\@degree}{博士} \fi
\newcommand{\thesissubject}{华南理工大学\@degree{}学位论文}
\renewcommand{\today}{\the\year~年~\the\month~月~\the\day~日}

%% 加载几个常用的sty packages
\RequirePackage{ifpdf}
\RequirePackage{ifthen}
\RequirePackage{doc}
\RequirePackage{keyval}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{indentfirst}
\RequirePackage{makeidx} % 索引
\RequirePackage{amssymb} %this package conflicts with xeCJK, place it before xeCJK to avoid the coflict.
\RequirePackage[final]{pdfpages}
\RequirePackage{color}
%\RequirePackage{prettyref} %不需要

%% 设置页面布局
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[left=2.5cm,right=2.5cm,bottom=2.5cm,top=2.5cm,%设置页面上下左右各为25mm
 headheight=1.5cm,%页眉所占高度
 footskip=1cm %页脚所占高度
]{geometry}

%% 字体设置
%\RequirePackage[BoldFont, SlantFont,CJKnumber]{xeCJK} % xeCJK package, CJKnumber deprecated.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-by MCH
\RequirePackage[BoldFont, SlantFont]{xeCJK} %CJKnumber已弃用
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\@ifpackagelater {xeCJK}  { 2008/12/29 }
\RequirePackage{CJKnumb} % used in recent TEX distribution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-by MCH
\RequirePackage{xCJKnumb} %中文编号如第一章的“一”，利用xCJKnumb设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\punctstyle{kaiming}
\setmainfont[Mapping=tex-text]{Times New Roman}%\rmfamily 使用的字体,默认英文和数字的字体。
\XeTeXlinebreaklocale "zh" %采用中文断行方式
\XeTeXlinebreakskip = 0pt plus 1pt %字元间可加入0pt~1pt 的弹性间距，这样才能排出左右对齐的段落。

\setCJKmainfont{SimSun.ttc}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-by MCH
\setCJKsansfont{SimSun.ttc}	%设置默认字体，防止报警
\setCJKmonofont{SimSun.ttc} %设置默认字体，防止报警
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setCJKfamilyfont{song}{SimSun.ttc}
\setCJKfamilyfont{hei}{SimHei.ttf}
\setCJKfamilyfont{kai}{KaiTi_GB2312.ttf}
\setCJKfamilyfont{fang}{FangSong_GB2312.ttf}
%------------for mac----------------
%\setCJKmainfont{STSong}%衬线字体 
%\setCJKsansfont{STHeitiSC-Light}%serif是有衬线字体sans serif无衬线字体。
%\setCJKmonofont{STFangsong}%中文等宽字体
%
%
%\setCJKfamilyfont{song}{STSong}
%\setCJKfamilyfont{hei}{STHeitiSC-Light}
%\setCJKfamilyfont{kai}{STKaitiSC-Regular}
%\setCJKfamilyfont{fang}{STFangsong}
%---------------------------------------------

\newcommand{\songti}{\CJKfamily{song}}
\newcommand{\heiti}{\CJKfamily{hei}}
\newcommand{\kaiti}{\CJKfamily{kai}}
\newcommand{\fangsong}{\CJKfamily{fang}}

% 很多字体字号并没有使用。第一个参数指定字号，第二个参数为baselineskip默认=1.2倍字号(pt). 结合\linespread可以实现控制行距。
% 但这里的设置暂时不清楚为什么，也暂时找不到其他方法。
% ToDo：使用更好的字体字号行距控制方法。例如用\usepackage{setspace}，然后\onehalfspacing实现单倍行距。但具体细节待考证。
%% Font size
\newcommand{\chuhao}{\fontsize{42pt}{46pt}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36pt}{40pt}\selectfont}
\newcommand{\yichu}{\fontsize{32pt}{36pt}\selectfont}
\newcommand{\yihao}{\fontsize{28pt}{32pt}\selectfont}
\newcommand{\erhao}{\fontsize{21pt}{24pt}\selectfont}
\newcommand{\xiaoerhao}{\fontsize{18pt}{20}\selectfont}
\newcommand{\sanhao}{\fontsize{15.75pt}{18pt}\selectfont}
%\newcommand{\xiaosanhao}{\fontsize{15bp}{18pt plus .3pt minus .2pt}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15pt}{22.5pt}\selectfont}%1.5
\newcommand{\sihao}{\fontsize{14pt}{16pt}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{14pt}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{13pt}\selectfont} % change 10.95pt to 10.5pt --by mch, 真正的五号字应该是10.5。10.95是通常所说的11pt，在英文排版中使用。
\newcommand{\xiaowuhao}{\fontsize{9pt}{11pt}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5pt}{9pt}\selectfont}
\newcommand{\xiaoliuhao}{\fontsize{6.5pt}{7.5pt}\selectfont}
\newcommand{\qihao}{\fontsize{5.5pt}{6.5pt}\selectfont}

% 中文段首缩进
\newlength\CJK@twochars %set \CJK@twochars zero
\def\CJK@spaceChar{\hskip \f@size \p@}
%%\def\CJK@spaceChar{\Unicode{48}{7}} %delete
\def\CJKindent{%
    \settowidth\CJK@twochars{\CJK@spaceChar\CJK@spaceChar}%
    \parindent\CJK@twochars}
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}} % 中文破折号,added by Quansheng

% 报警处理
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%不要拉大行距使得页面充满
\raggedbottom
% 去掉页面中的badboxes报警，同上
% \setlength\parskip{.5\baselineskip
% 	plus .1\baselineskip
% 	minus .4\baselineskip
% }
\hbadness=10000 \tolerance=10000 \hfuzz=150pt % 去掉表格中的badboxes报警,看着不爽

% My fonts for Scut thesis字体字号设置，由于部分内容的字体使用默认设置，因此部分字体用不到。
\renewcommand{\normalsize}{\xiaosihao\songti\normalfont} % Normal font size 小四号宋体
\newcommand{\absnamecn}{\heiti\xiaoerhao}         % 中文“摘要”字样的字体
\newcommand{\abskeycn}{\heiti\xiaosihao}       % 中文摘要“关键字”字样的字体
\newcommand{\abskeyscn}{\songti\xiaosihao\normalfont} % 中文摘要关键字的字体
\newcommand{\absnameen}{\heiti\xiaosihao}               % 英文``Abstract''字样的字体
\newcommand{\abskeyen}{\bfseries\xiaosihao}   % 英文``KEY WORDS''字样的字体
\newcommand{\abskeysen}{\songti\xiaosihao\normalfont}        % 英文关键字的字体
\newcommand{\headfont}{\songti\wuhao\normalfont} 	% 页眉字体
\newcommand{\toctitlefont}{\heiti\xiaoerhao}            % “目录”字样的字体
\newcommand{\tocchapterfont}{\heiti\xiaosihao} % 目录上第X章的字体
\newcommand{\tocsectionfont}{\normalsize}         % 目录上X.Y节的字体
\newcommand{\tocsubsectionfont}{\normalsize}      % 目录上X.Y.Z小节的字体
\newcommand{\tocsubsubsectionfont}{\normalsize}      % 目录上X.Y.Z小节的字体
\newcommand{\textchapterfont}{\centering\heiti\xiaoerhao} % 正文上第X章的字体
\newcommand{\textsectionfont}{\heiti\xiaosanhao}            % 正文上X.Y节的字体
\newcommand{\textsubsectionfont}{\heiti\sihao}     % 正文上X.Y.Z小节的字体
\newcommand{\textsubsubsectionfont}{\heiti\xiaosihao}     % 正文上X.Y.Z.K小节的字体
\newcommand{\footnotefont}{\songti\xiaowuhao\normalfont}     % 脚注字体
\newcommand{\ftcaptionfont}{\songti\wuhao\normalfont}         % 图表标题的字体

\newcommand{\reftitlefont}{\heiti\xiaoerhao}      % “参考文献”字样的字体
\newcommand{\refbodyfont}{\songti\wuhao\normalfont}          % 参考文献字体
\newcommand{\pubfont}{\songti\wuhao\normalfont}          % 《攻读博士/硕士学位期间取得的研究成果》字体，2022年更新。

\newcommand{\thanktitlefont}{\heiti\sanhao}    % “致谢”字样的字体
\newcommand{\appendixtitlefont}{\heiti\sanhao} % “附录”字样的字体
%\normalfont command (essentially) executes the command sequence:
%  \fontencoding{\encodingdefault}
%  \fontfamily{\familydefault}
%  \fontseries{\seriesdefault}
%  \fontshape{\shapedefault}
%  \selectfont



%% 图表环境
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%图题(由图号和图名组成)。图号为“图1-1”格式。图题置于图下，有图注或其他说明时应置于图题之上。
%表序与表名置于表上。
%图题和表题在lyx中插图或插表时，可以参照标题的位置，在上还是在下。

\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png} % 如果插入的图片没有指定扩展名,那么依次搜索下面的扩展名所对应的文件
\RequirePackage{subfig} % config兼容subfigure命令
\RequirePackage{float} % 可以使用［H］命令
\RequirePackage{caption} % 定义图的标题格式：居中. 使用caption3.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 根据子图引用显示，重定义部分参数 ——by mch
\DeclareSubrefFormat{parens}{#1 #2)}
\DeclareSubrefFormat{subparens}{#2)}
\DeclareCaptionListOfFormat{parens}{#1 #2)}
\DeclareCaptionListOfFormat{subparens}{#2)}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareCaptionFont{capFont}{\ftcaptionfont} % 表格名及图名
\DeclareCaptionLabelSeparator{twospace}{~~}
\captionsetup{ labelsep=space,% 去掉图标签后的冒号 % 原模板labelsep=twospace，而论文撰写规范要求是space
  belowskip=0bp,aboveskip=0bp,
  font={capFont}, figurename=图,tablename=表,listfigurename=插图目录,listtablename=表格目录}
\captionsetup[figure]{position=bottom}
\captionsetup[subfloat]{captionskip=6bp,nearskip=0bp,farskip=0bp,topadjust=0bp,
  justification=centering,labelformat=brace,labelsep=space,subrefformat=subparens,listofformat=parens}%要使分图题和图题一样字号，选项加上 font={capFont}

%%%%%%%%%%定义双标题命令
% 注释掉双语标题 ——by mch
%\newcommand{\FigureBicaption}[2]{
%  \renewcommand{\figurename}{图}
%  \vspace{8pt}
%  \caption{#1}
%  \addtocounter{figure}{-1}
%  \renewcommand{\figurename}{Fig.}
%  \captionsetup{list=false}
%  \vspace{6pt}
%  \caption{#2}
%  \captionsetup{list=true}
%  \renewcommand{\figurename}{图}
%}
%\newcommand{\SubfloatCaption}[4]  % Two Parameters, the first one is the width of the subfigure,
%{
%  \subfloat[#2]{
%    \label{#3}
%    \addtocounter{subfigure}{-1}
%    \subfloat[\vspace{-5pt}#1]{#4}
%  }%
%}

%% 表格
\RequirePackage{array} % 扩展了 array 和 tabular 环境功能
\RequirePackage{booktabs} % 增加对三线表格的支持 % \toprule，\midrule，\bottomrule
\RequirePackage{longtable} % 长表格支持，截断跨页
%\RequirePackage{ctable, threeparttable} % 支持表格注释,复杂表格，一般用不上
%\RequirePackage{tabularx}
\captionsetup[table]{position=top}
%定义双标题命令
\newcommand{\TableBicaption}[2]{
  \renewcommand{\tablename}{表}
  \vspace{8pt}
  \caption{#1}
  \vspace{6pt}
  \addtocounter{table}{-1}
  \renewcommand{\tablename}{Table}
  \captionsetup{list=false}
  \caption{#2}
  \captionsetup{list=true}
  \renewcommand{\tablename}{表}
}

%\RequirePackage{algorithm}
%\RequirePackage{algpseudocode}
%% algorithm2e 中文标题定制
%\renewcommand{\algorithmicname}{算法}
%\renewcommand\thealgocf{\csname the\algocf@within\endcsname-\@arabic\c@algocf}%
%\renewcommand{\algorithmicrequire}{\textbf{Input:}}  % Use Input in the format of Algorithm
%\renewcommand{\algorithmicensure}{\textbf{Process:}} % Use Output in the format of Algorithm


\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

\renewcommand{\thefootnote}{注\arabic{footnote}} \setcounter{footnote}{0}

\renewcommand\fps@figure{htbp} % 设置图浮动的默认参数
\renewcommand\fps@table{htbp}

\renewcommand{\textfraction}{0.07}
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\renewcommand{\floatpagefraction}{0.85}

%% 列表
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 删除 itemize和 enumerate环境中 列表项之间的间隔，默认列表项之间的间距非常宽（超过1.5倍行距）
\def\@listi{%
  \leftmargin\leftmargini
  \parsep 0pt%
  \topsep \parsep
  \itemsep \parsep}
\let\@listI\@listi
\@listi
\def\@listii{%
  \leftmargin\leftmarginii
  \labelwidth\leftmarginii
  \advance\labelwidth-\labelsep
  \parsep 0pt%
  \topsep \parsep
  \itemsep \parsep}
\def\@listiii{%
  \leftmargin\leftmarginiii
  \labelwidth\leftmarginiii
  \advance\labelwidth-\labelsep
  \parsep 0pt%
  \topsep \parsep
  \itemsep \parsep
  \partopsep \p@ \@plus\z@ \@minus\p@}

%\RequirePackage{enumitem}
%\setlist{noitemsep,nolistsep,topsep=0pt,itemindent=1em}
%\setenumerate[1]{label=\arabic*), ref=\arabic*}
%\setenumerate[2]{label=\emph{\alph*}),ref=\theenumi.\emph{\alph*}}
%\setenumerate[3]{label=\roman*), ref=\theenumii.\roman*}
% Ref: http://bbs.ctex.org/viewthread.php?tid=52331&page=1
% \setitemize{itemindent=38pt,leftmargin=0pt,itemsep=0ex,listparindent=26pt,partopsep=0pt,parsep=\parskip,topsep=-0.25ex}
% \setenumerate{itemindent=38pt,leftmargin=0pt,itemsep=0ex,listparindent=26pt,partopsep=0pt,parsep=\parskip,topsep=-0.25ex}
% \setdescription{itemindent=38pt,leftmargin=0pt,itemsep=0ex,listparindent=26pt,partopsep=0pt,parsep=\parskip,topsep=-0.25ex}

% \RequirePackage{paralist}% 修改列表格式
% \setdefaultenum{1)}{a)}{i.}{A.}% 设置列表模式,for \enumerate
% \setdefaultleftmargin{4ex}{}{}{}{}{}%standard \itemize :• – ∗ ·

%\RequirePackage[numbers,super,square,sort&compress]{natbib}  %改biblatex
% 用natbib代替下面的一些设置
%\let\originalcite=\cite
%\renewcommand{\cite}[1]{\textsuperscript{\originalcite{#1}}}
%\renewcommand{\citet}[1]{\originalcite{#1}}

%% 程序代码格式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\RequirePackage[ruled,vlined,algochapter]{algorithm2e}



\RequirePackage{listings}
\definecolor{mygray}{RGB}{245,245,245}
\lstset{
  tabsize=4, %
  frame=tb,
  commentstyle=\color{red!50!green!50!blue!50},
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries,
  backgroundcolor=\color{mygray},
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily,
  basicstyle={\footnotesize\ttfamily},
  breaklines=true,
  keepspaces=true, %
  flexiblecolumns=true, %
  lineskip=-0.1pt,%行距
  fontadjust,
  captionpos=t,
  framextopmargin=1pt,framexbottommargin=1pt,abovecaptionskip=-1pt,belowcaptionskip=1pt,
  %xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
 extendedchars=false,columns=flexible,mathescape=false
  breakautoindent=true
}
\renewcommand{\lstlistingname}{代码} %% 重命名Listings标题头 added by Guan

%%%%%%%%%%%%%%%%%%--by MCH--%%%%%%%%%%%%%%%%%%%%%%%%%%%%2022-2-26更新
%---ref: https://blog.csdn.net/youyagaozitai/article/details/70210297?%3E
% 增加目录的项目——tocbibind
%正文区写 \tableofcontents %输出目录命令，输出内容是正文中/section等的内容。 
%若在目录中显示其他条目，使用：  
\RequirePackage[nottoc]{tocbibind} %增加目录项目，tocbibind宏包会自动加入目录项本身、参考文献、索引等项目。[nottoc]取消了对自身的显示

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\bibname}{参考文献}

% 设置目录
%%%%%%%%%%%%%%%%%
\RequirePackage{titletoc}
%\renewcommand\contentsname{\centerline{\toctitlefont{目\quad{}录}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-by MCH
\renewcommand{\contentsname}{目\texorpdfstring{\quad}{}录}	%中文目录
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\titlecontents{chapter}[0ex]{\tocchapterfont}{%
    第\xCJKnumber{\thecontentslabel}章\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}%
\titlecontents{section}[1em]{\tocsectionfont}{%
    \thecontentslabel\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}%
\titlecontents{subsection}[2em]{\tocsubsectionfont}{%
    \thecontentslabel\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}%
\titlecontents{subsubsection}[3em]{\tocsubsubsectionfont}{%
    \thecontentslabel\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}%

% 设定章节深度和目录深度
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{2}

% Text style
%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[pagestyles, rm]{titlesec}%调用titlesec涵盖fancyhdr的功能
\renewcommand{\chaptername}{第\xCJKnumber{\thechapter}章}
\titleformat{\chapter}[hang]{\textchapterfont}{第\xCJKnumber{\thechapter}章}{1em}{}
\titleformat{\section}[hang]{\textsectionfont}{\thesection}{1em}{}
\titleformat{\subsection}[hang]{\textsubsectionfont}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[hang]{\textsubsubsectionfont}{\thesubsubsection}{1ex}{}% 小四黑体居左

%\titlespacing{\chapter}{0pt}{3ex plus .5ex minus .5ex}{3ex plus .5ex minus .5ex} % 缩短章节标题的上边距
\setlength{\parskip}{0ex}% 正文段前段后距：无空行
\titlespacing{\chapter}{0pt}{-20pt}{1pt} % 缩短章标题上间距，revised by Quansheng Guan
\titlespacing{\section}{0pt}{1pt}{1pt}  % 标题间距
\titlespacing{\subsection}{0pt}{4pt}{0pt}
\titlespacing{\subsubsection}{0pt}{6pt}{6pt}

\newcommand{\linespacing}[1]{\linespread{#1}\selectfont}% 行距命令


%\renewcommand\backmatter{%
%  % there is no label number for reference chapter
%}
%==========
\AtBeginDocument{\CJKindent{}%
    \makeindex%
    \normalsize%正文字体格式
    \linespacing{1.682}% 主行距～1.5倍  % 手调参数，利用1比1的打印效果看行距是否和word的1.5倍行距一样。latex行距控制水太深了。见109行ToDo。--by mch
  }
\AtEndDocument{}

%------------------
\renewcommand{\maketitle}{% called outside
  \ifpdfcover
%%coverpage from pdf file
       %% \includepdf[pages=-]{thesis_cover.pdf}%pdf文件路径为主文件tex或lyx的当前目录
          \includepdf[pages={1-5,{},7-8}]{thesis_cover.pdf}
   \else
%%buildin coverpage
\begin{titlepage}
\raggedleft
\null
\vskip 4em

\bigskip
\centerline{\songti\erhao  {\thesissubject} }
\vskip 4em

\bigskip
\centerline{\heiti\yihao  {\@title} }
\vskip 2em

\bigskip
\centerline{\songti\erhao   {\@author} }
\bigskip
\centerline{\songti\erhao   {\@supervisor} }

\vfill
\centerline{\songti\normalsize{\@institute}}
\centerline{\songti\normalsize{\@date}}
\end{titlepage}

\fi
}
%%摘要分中英文页，而且有两者排版方式：
%一种是采用\abstractCN和\abstractEN方式以“摘要”和“Abstract”为页标题
%另一种采用研究报告的标题为摘要页的标题，这时使用\charpter*{报告中文或英文标题}和\chapterx{摘要或Abstract}
%\newenvironment{abstractCN}{
%  \chapter*{摘\quad 要}
%
%  \addcontentsline{toc}{chapter}{摘要}
%}{}
%
%\newenvironment{abstractEN}
%{
%  \chapter*{Abstract}
%  \addcontentsline{toc}{chapter}{Abstract}
%}{}

\newcommand{\keywordsCN}[1]{
  \par
 \vspace{1em}
  \newcommand{\@keywords}{#1}
  {\noindent\abskeycn 关键词：} {\abskeyscn \@keywords} % \noindent去掉缩进
}
\newcommand{\keywordsEN}[1]{
  \par
 \vspace{1em}
  {\noindent\abskeyen Keywords:} {\abskeysen #1} % \noindent去掉缩进
}
%
\newcommand{\abstractx}[1]
{
 \begin{center}
  #1
 \par\end{center}
  \addcontentsline{toc}{chapter}{#1}
}

%有些章节名如“致谢”、“附录”，无需章节编号，相当于chapter*，但需要把章节名加入目录，相应的页眉也要改动
%通过\chapterx和\chapterxname来完成。
%\def \chapterxname#1{\gdef\@chapterxname{#1}}
%\newcommand{\chapterx}[1]
%{
%  \chapterxtrue
%  \chapter*{#1}
%  \chapterxname{#1}
%  \addcontentsline{toc}{chapter}{#1}
%}

%\renewcommand{\appendix}[1]{%
%  % \chaptertitle is not available for those chapters without label number.
%   \cleardoublepage
%   \renewcommand{\thesection}{{#1}\arabic{section}}
%   \chapter*{#1}
%   \chapterxname{\thesection\quad\sectiontitle}
%   \addcontentsline{toc}{chapter}{#1}
%   \setcounter{section}{0}
%}

%\renewenvironment{verse}
%               {\let\\\@centercr
%                \list{}{\itemsep      \z@
%                        \itemindent   -1.5em%
%                        \listparindent\itemindent
%                        \rightmargin  \leftmargin
%                        \advance\leftmargin 1.5em}%
%                \item\relax}
%               {\endlist}
%\renewenvironment{quotation}
%               {\list{}{\listparindent 1.5em%
%                        \itemindent    \listparindent
%                        \rightmargin   \leftmargin
%                        \parsep        \z@ \@plus\p@}%
%                \item\relax}
%               {\endlist}
%\renewenvironment{quote}
%               {\list{}{\rightmargin\leftmargin}%\vspace{-15pt}
%                \item\relax}
%               {\endlist}


%\sethead[ even-left ][ even-center ][ even-right ]    { odd-left }{ odd-center }{ odd-right }
%\newpagestyle{revtitlestyle}{
% \ifchapterx
%  \sethead[][{\headfont{}\thesissubject}][] % 页眉偶数页
%  {}{{\headfont{}\@chapterxname}}{} % 页眉奇数页
% \else
%  \sethead[][{\headfont{}\thesissubject}][] % 页眉偶数页，五号字体，居中
%  {}{{\headfont{}\chaptertitlename\quad\chaptertitle}}{} % 页眉奇数页，五号字体，居中
% \fi
%  \setfoot[][\headfont{}\thepage][] %偶数页码五号宋体居右
%   {}{\headfont{}\thepage}{}%页码五号宋体居右
%  \headrule%上横线
%  \setheadrule{1.5pt}%设置横线粗细
%}

%\let\orig@bibliography=\bibliography
%\renewcommand{\bibliography}[1]{
%	\cleardoublepage % 使参考文献使用 seunolabel 页面样式
%	\refbodyfont
%        \chapterxtrue % 改变页眉标题方式
%        \chapterxname{\bibname}
%	\let\ps@plain=\ps@revtitlestyle
%	\pagestyle{revtitlestyle} % here and continue
%	\orig@bibliography{#1}
%	\normalsize
%}

\renewcommand\frontmatter{ %标题之后，开始中英文摘要，目录
	\clearpage	
    \pagestyle{plain} % plain
    \pagenumbering{Roman}% Roman style page number
    \@mainmatterfalse
}

%%\renewcommand\mainmatter{%
%% \@mainmattertrue
%%  \chapterxfalse % 改变页眉标题方式
%%  \ifodd \arabic{page} % 目录后如果是奇数页结尾，则插入一个无页码空白页
%%   \clearpage
%%   \pagestyle{empty}
%%   \mbox{} %空白占位符
%%  \fi
%%  \clearpage
%%  \pagenumbering{arabic}
%%
%%  \makeatletter
%%  \let\ps@plain=\ps@revtitlestyle
%%  \makeatother
%%  \pagestyle{revtitlestyle} % here and continue
%%  % 开始正文部分
%%}
%\RequirePackage{fancyhdr}







%%定理环境
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{bm} % 数学符号粗体
%\RequirePackage[amsmath,thmmarks]{ntheorem}
\RequirePackage{amsmath,amsthm,mathrsfs}
%允许公式换页显示,否则大型推导公式都在一页内，
%一页显示不下放到第二页，导致很大的空白空间，很不好看
\allowdisplaybreaks[4]
%\setlength\jot{1pt} %公式之间的距离,TODO


\newtheoremstyle{definition}% name
  {0pt}%      Space above, empty = `usual value'
  {0pt}%      Space below
  {}% Body font \itshape
  {\parindent}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {:}%        Punctuation after thm head
  {0.5em}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{definition}
\newtheorem{definition}{定义~}[chapter]
\newtheorem{example}{例~}[chapter]
\newtheorem{remark}{说明~}[chapter]
\newtheorem{assumption}{假设~}[chapter]	% by mch
% ------改为definition，by mch
\newtheorem{proposition}{命题~}[chapter]
\newtheorem{lemma}{引理~}[chapter]
\newtheorem{theorem}{定理~}[chapter]
\newtheorem{axiom}{公理~}[chapter]
\newtheorem{corollary}{ 推论~}[chapter]
\newtheorem{case}{情形~}[chapter]
\newtheorem{conjecture}{猜想~}[chapter]
\newtheorem{property}{性质~}[chapter]
% ----------

%% 可继续用\newtheorem命令添加需要的环境

\newtheoremstyle{plain}% name
  {0pt}%      Space above, empty = `usual value'
  {0pt}%      Space below
  {\itshape}% Body font \itshape
  {\parindent}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {:}%        Punctuation after thm head
  {0.5em}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{plain}
% -------------------根据2022年博士论文送审反馈意见，下面部分改为正体，故移到definition--------by mch
% \newtheorem{proposition}{命题~}[chapter]
% \newtheorem{lemma}{引理~}[chapter]
% \newtheorem{theorem}{定理~}[chapter]
% \newtheorem{axiom}{公理~}[chapter]
% \newtheorem{corollary}{ 推论~}[chapter]
% \newtheorem{case}{情形~}[chapter]
% \newtheorem{conjecture}{猜想~}[chapter]
% \newtheorem{property}{性质~}[chapter]
%% 可继续用\newtheorem命令添加需要的环境
% ------------

\renewenvironment{proof}{\vskip 1pt\indent  证明:~\normalfont}{\hfill$\square$\vskip 0.01\baselineskip} %$\blacksquare$ -----去掉\itshape 该命令用于设置斜体


%\renewcommand{\proofname}{\hskip 2em 证明:~} %
%%%%%%%%%%%%%%%%%   end of 定理环境

% 公式和正文的间距由4pt改为10pt，更美观
\abovedisplayshortskip=10pt
\belowdisplayshortskip=10pt
\abovedisplayskip=10pt
\belowdisplayskip=10pt

\endinput
%% End of file `scutthesis.cls'.
