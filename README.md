# 华南理工大学硕/博士学位论文LaTeX模板

本模板可用于撰写华南理工大学硕/博士学位论文。模板由[alwintsui](https://github.com/alwintsui/scutthesis)以及[yecfly](https://github.com/yecfly/scut-thesis)的模板修改而来。

本模板还衍生出了很多模板：

1.[华南理工大学硕/博士课程论文LaTeX模板](https://github.com/mengchaoheng/SCUT_course)

2.[华南理工大学Beamer模板](https://github.com/mengchaoheng/SCUT_beamer)：将用其他模板写好的latex源码整理出来，一键生成幻灯片。

3.[华南理工大学研究生学位（毕业）论文开题报告LaTeX模板](https://github.com/mengchaoheng/SCUT_Report_Latex)

4.[华南理工大学研究生学位（毕业）论文文献综述LaTeX模板](https://github.com/mengchaoheng/SCUT_Review_Latex)

鉴于大家快毕业了才会来本网站查看，所以开题有关的latex模板还需要大家帮忙传播出去给需要的同学。

## 为什么需要此模板
latex和office在写论文、写slides时只是不同的工具，就像是两把菜刀，谁更锋利不重要，谁更顺手才重要。

## 此模板的缺点
写下这部分是希望同学们对latex模板熟悉的话可以帮忙改进。目前对缺点是显而易见的：因为是改自其他模板，难免有很多冗余代码。（但不影响使用，已经连续多届同学证明了它的有效性）

我一直想重新整理，从零开始写一个新的，代码简洁的模板。奈何时间不允许。希望遇到有缘人一起合作！！！

## 预备工作

> **Note:** 本模板不再利用Lyx，直接使用TeXstudio或者vscode进行编辑，这类似IDE。vscode的一些使用技巧以及快捷键可参考其他教程(百度vscode latex)，这里仅仅给出配置文件`settings_files/settings.json`。详情移步[讨论区](https://github.com/mengchaoheng/SCUT_thesis/discussions)的[vscode配置](https://github.com/mengchaoheng/SCUT_thesis/discussions/6)。有什么问题都可以在讨论区交流。

使用之前可先阅读本文模板编译后生成的使用说明[scutthesis.pdf](https://github.com/mengchaoheng/SCUT_thesis/blob/master/scutthesis.pdf)文件、并有选择性地阅读[《一份（不太）简短的LATEX 2ε 介绍》](https://github.com/CTeX-org/lshort-zh-cn.git) 入门。还可以阅读[tutorial](https://github.com/mengchaoheng/SCUT_thesis/tree/master/tutorial)里的`scutthesis说明.pdf`文件，这是旧模板的文件，可以参考旧模板的东西。使用案例为[本人的学位论文](https://github.com/mengchaoheng/SCUTthesis-mengchaoheng.git)(注意该论文是基于初代模板，而现在的模板已经不断更新)。

若不使用在线编译overleaf，则编译之前需要先安装[texlive](https://www.tug.org/texlive/)，找到对应系统（Linux，win，macOS）的版本。注意macOS是MacTeX。

## 快速使用：

编译`scutthesis.tex`文件，生成论文pdf文件即`scutthesis.pdf`，共有四种方法，任选其一：

1.使用VSCode, 详情参考[讨论区vscode配置](https://github.com/mengchaoheng/SCUT_thesis/discussions/6)，也可以参考[zhuohoudeputao](https://github.com/zhuohoudeputao)做的[环境配置视频](hihihttps://www.bilibili.com/video/BV1jT4y1e7QT)。基本思路为安装LaTeX Workshop插件，在`settings.json`中修改相关字段为`settings_files/settings.json`中的值。以前就有在使用vscode的同学需要把该`settings.json`文件的部分内容添加到自己的.json文件。第一次使用vscode的同学直接覆盖就行。在vscode配置使用xelatexmk进行编译，基本步骤为先点击（激活）要编译的某个.tex文件界面，此时最左侧会出现`TeX`工具栏，点击工具栏后，展开`Build LaTeX project`（`构建LaTeX项目`），点击里面的xelatexmk编译链（也可以尝试`xelatex -> biber -> xelatex*2`，其他编译链/配方则提供给有其他需求的同学使用，通常不需要关心），下方编译标志由转圈变成打勾后，然后`View LaTeX PDF`即可查看pdf文件。注意一定要先点击激活要编译的文件，再去点编译，否则识别不到。`settings.json`文件可以自定义配置，若不喜欢保存自动编译，可以改为手动，第一次编译过后会记住上次编译选项，此时只需要点击`构建LaTeX项目`即可（省略展开`Build LaTeX project`这一步骤）。（2022年起添加的方法，建议有编程基础、追求效率的同学使用）

2.使用TeXstudio，首次编译建议从主文件`scutthesis.tex`开始编译，首先在`TeXstudio的Options->Configure TeXstudio->build`中，编译器(Dufault Compiler)选择`XeLaTeX`，默认文献工具(Default Bibliography Tool)选`Biber`，构建并查看（build & view） 按照`scutthesis.pdf`中的图2-1进行设置（点击右侧扳手符号进行设置，分别选择`recompile-bibliography`、`Defualt compiler`、`Defualt Viewer`并点add到右侧栏中），也可以使用默认的Compile & View，只不过此时不会自动更新参考文献著录。(模板最初使用的编辑器，建议喜欢本地编辑、平时较少倒腾电脑、较少编程、追求稳定的同学使用)

3.使用编译脚本`all.bat`，记得关掉生成的pdf文档再双击`all.bat`。双击`clean.bat`删除临时文件。（此方法仅支持win，且多年未维护，但维护起来应该很简单，记事本打开`all.bat`编辑一下命令即可，具体命令可百度）

4.使用overleaf，只需要在overleaf网页设置为XeLaTeX的编译方式即可。推荐无编程基础、不喜欢GitHub且能接受在线编辑的同学使用（虽然作者较少更新此版本，但除非重大更改，现版本是一定可以用的）。又可以分为三种操作方法，选择你觉得最顺手的：

1)直接在overleaf网页导入，模板地址在[SCUT_overleaf](https://www.overleaf.com/latex/templates/scut-thesis/bgybznvkjdfx)，更多使用说明参考[overleaf文档](https://www.overleaf.com/learn)。（显然对无编程基础的同学最友好）

2)当然也可以在命令行窗口运行 `git clone https://github.com/mengchaoheng/SCUT_thesis.git` 得到本项目后切换到 `overleaf` 分支。将文件导入到overleaf，如果文件太大就删除.git文件等隐藏文件。（适合于希望参与开发、完善overleaf版本的同学）

3)还可以在本页面将master branch改为选择overleaf分支后在download本项目等.zip文件，然后上传overleaf。

> **Note:** 实际上前三种方法都依赖于安装的texlive，可以在终端（win,macos,linux任一系统都一样）输入命令行`tex -v`测试编译环境是否正确安装，`xelatex`引擎编译则运行`xelatex scutthesis.tex`。只是不同方法在不同的地方调用这些命令，也因此vscode需要写配置文件，TeXstudio已经做好GUI图形用户界面，直接选配即可，而编译脚本`all.bat`则是直接写出要执行的tex命令。使用overleaf是有网站已经部署好的远程编译环境，因此不需要本地安装。有编程基础的同学可以很容易对任一系统写一个编译脚本，甚至只需要在终端使用几条命令就可以编译。

> **Note:** 封面需要用微软的word打开另存为pdf，不能使用wps（暂时不明原因报错）。

> **Note:** 如果有更新版本的封面，可自行替换。建议每届毕业生都到官网下载最新封面，替换`cover_file`中的内容，防止学校改建校年份引起校徽的变化。建校年份还能改这点我是非常意外的。

> **Note:** 本模板会根据大家的反馈一直更新，我尽量使用保守的策略进行更新，比较大的改动先以注释的形式放在文件里供大家选用，防止弄巧成拙。若每次改了模板，大家下载新模板后直接替换自己的章节文件即可（此时是在一份新的文件夹继续自己的论文）。这是暴力做法，简单便捷。若git高手，应该知道如何操作。我个人的习惯是：fork本模板后clone到本地，新建自己的分支写论文，然后添加本库为上游远程分支，每次本库更新后拉取合并即可。但是对于文件移动等操作，git会认为我们删除了文件再添加文件，合并也不好操作（要解决复杂的冲突）。所以，还是暴力做法好。

## 参考文献管理
两种方法：

1.找到你想引用的文献，通常文献网页提供一个`引用`/`Cite`功能，点击后会得到一些常用的引用格式，但这些通常不符合我们的格式要求。很自然的想到把该文献的信息用统一的格式存储下来，BibTeX就是这样的东西。所以在网页找到包含该文献所有信息的BibTex格式文件，下载下来（一篇论文一个bib文件），统一保存到一个xxx.bib文件里，然后在论文中使用该xxx.bib文件（汇总了很多论文的bib文件）。例如模板文件夹里的`biblibrary/MyLibrary.bib`文件。保存有很多篇文章信息，其中一篇为：
```
@article{Vasile_2020,
  title = {Reactive Sampling-Based Path Planning with Temporal Logic Specifications},
  author = {Vasile, Cristian Ioan and Li, Xiao and Belta, Calin},
  date = {2020-07-01},
  journaltitle = {The International Journal of Robotics Research},
  volume = {39},
  number = {8},
  pages = {1002--1028},
  publisher = {{SAGE Publications Ltd STM}},
  issn = {0278-3649},
  url = {https://doi.org/10.1177/0278364920918919},
  urldate = {2021-10-08},
  langid = {english}
}
```
这是一篇在[The International Journal of Robotics Research](https://doi.org/10.1177/0278364920918919)的文章，点击`More`->`Cite article`，它提供了两种，一种是现成的，格式通常不满足需求。另一种是`Download to reference manager`，提供了很多格式，在`Select your citation manager software:`选择`BibTeX`。下载好文件后，把里面的内容复制到一个xxx.bib文件里，每篇文章空行隔开。该xxx.bib文件里每篇文章第一项内容不能重复，可以理解为它的id，也是在论文中引用该文献的句柄。如上面`Vasile_2020`。目前我见过所有的论文都可以在文献网页、搜索网站等地方下载`BibTeX`。例如谷歌学术搜索结果页可以直接点击下载。注意到上面例子中下载的文件里包含了摘要的内容，有时属于冗余信息，可以删除。

2.上面的方法较为原始，随着论文越来越多，手动维护一个bib文件过于复杂，并且很多文献bib文件很多冗余信息，每次手动删减很麻烦。所以催生了很多工具进行管理，即参考文献管理软件。常见如zotero，endnote等。可以自动导出bib文件，还可以方便地对文献进行引用、阅读、分类、共享、多端同步等等。

参考文献管理软件推荐使用开源的zotero，使用其他文献管理软件如endnote当然也可以，重点是导出bib文件。觉得费时间就手动创建一个后缀名为.bib的文件，然后直接在文献页面复制BibTeX数据到该.bib文件，手动维护该文件，最后在`scutthesis.tex`文件里使用即可。

> **Note:** 百度：BibTeX 是一种文件格式，也是一个制作这种文件的工具（软件）。这种文件用于描述和处理引用列表，通常情况下与LaTeX文档结合使用。它是一种专门的参考文献管理系统，允许用户通过编写.bib后缀名的文本文件来存储参考文献信息。这些文件可以包含引用的元数据，如作者、标题、期刊等信息，并且可以通过BibTeX命令行工具或集成在LaTeX编辑器中的插件来进行管理和更新。BibTeX的使用方式通常是创建一个.bib文件，然后将其导入到LaTeX文档中，这样LaTeX就可以自动生成相应的引用列表。

> **Note:** 维基百科：BibTeX is both a bibliographic flat-file database file format and a software program for processing these files to produce lists of references (citations). The BibTeX file format is a widely used standard with broad support by reference management software.

本模板最主要的改动是参考文献使用BibLaTeX（Biber）包，而不是原来的BibTeX（仍然使用这种格式，但不再使用这种软件/程序），因此不再需要.bst文件。具体词汇含义可查看百科词条[BibTeX](https://en.wikipedia.org/wiki/BibTeX)和[Biber](https://en.wikipedia.org/wiki/Biber_(LaTeX))。在这项改动之后，参考文献部分的格式符合国标gb7714-2015，当然要注意进行适当的设置，因为根据学校的论文撰写规范，有的信息是不需要显示在参考文献著录里的。每年都有同学提问为什么参考文献的显示和学校发布的撰写规范有一点点不同，详情到issue和讨论区查看，但简而言之，目前的默认设置是可以用的，已经连续用了那么多届都没问题。感兴趣的同学可以查看biblatex包的[使用说明](https://github.com/mengchaoheng/SCUT_thesis/blob/master/settings_files/package_Documentation/biblatex-gb7714-2015.pdf)，[package_Documentation](https://github.com/mengchaoheng/SCUT_thesis/tree/master/settings_files/package_Documentation)文件夹还有其他包的使用说明。而大部分同学不需要关心这些。


> **Note:** 由于有一些数据信息是不需要在参考文献列表中显示，所以复制或从文献管理软件导出文献的元数据时，记得只选择必要的数据而剔除冗余的数据。虽然多出的信息有时候更好看，送审和学校审核也可能可以顺利通过，但为了避免麻烦，最好去除doi等多余信息。

> **Note:** zotero的强大不需要我做介绍，强烈建议同学们花点时间学习使用。

## 常见报错解决思路：

编译时如果提示缺乏字体，请安装[settings_files](https://github.com/mengchaoheng/SCUT_thesis/tree/master/settings_files)里面的字体（win右键安装即可；mac参考官方字体安装教程；linux下类似，需要自行百度）。此外，目前遇到的导致错误的原因大都是以下三种：

1.语法错误，这种借助百度、谷歌很容易解决，按照latex的规范去写就好。

2.和参考文献有关的错误，记住一定检查好bib文件，而bib文件来源于参考文献管理软件如本文推荐的zotero，又或者来源于自己手动建立的文件。一定要设置好导出选项以及格式，同时要设置好编译选项biber(区别于常见的bibtex)。

3.编译器问题，和第二条一样，使用TeXstudio的话，一定要在`Options->Configure TeXstudio->build`中设置好；使用vscode的话，记得按照[讨论区](https://github.com/mengchaoheng/SCUT_thesis/discussions)设置好vscode编译的配置文件`settings.json`。记住千万不能使用中文路经，也不能时刻开启网盘同步（防止编译时网盘也在读取文件同步，会报错）。一定要打开`scutthesis.tex`文件，选中其使vscode界面位于该文件，才能编译。有时vscode不能加载环境变量，需要从终端启动`code .`。

4.其他问题，关掉生成的PDF，清除所有中间文件再编译一次看看。如win系统双击`clean.bat`文件。或使用TeXstudio的话，点击`Tools->Clean Auxiliary files`。或者vscode位于编译选项上方的清除按钮。

确保以上几方面没问题的话，基本就可以愉快的写论文了。

## 贡献者

按加入时间顺序：
  * [mengchaoheng](https://github.com/mengchaoheng)
  * [Komari-Koshigaya](https://github.com/Komari-Koshigaya)
  * [zhuohoudeputao](https://github.com/zhuohoudeputao)
  * [PlexusChen](https://github.com/PlexusChen)

欢迎大家加入维护团队！！！
