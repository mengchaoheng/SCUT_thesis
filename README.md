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

我一直想重新整理，从零开始写一个新的，代码简洁的模板。奈何时间不允许。希望遇到一位大神来一起合作！！！

## 预备工作

> **Note:** 本模板不再利用Lyx，直接使用TeXstudio或者vscode进行编辑，这类似IDE。vscode的一些使用技巧以及快捷键可参考其他教程(百度vscode latex)，这里仅仅给出配置文件`settings_files/settings.json`。详情移步[讨论区](https://github.com/mengchaoheng/SCUT_thesis/discussions)的[vscode配置](https://github.com/mengchaoheng/SCUT_thesis/discussions/6)。有什么问题都可以在讨论区交流。

使用之前可先阅读本文模板编译后生成的使用说明[scutthesis.pdf](https://github.com/mengchaoheng/SCUT_thesis/blob/master/scutthesis.pdf)文件、并有选择性地阅读[《一份（不太）简短的LATEX 2ε 介绍》](https://github.com/CTeX-org/lshort-zh-cn.git) 入门。还可以阅读[tutorial](https://github.com/mengchaoheng/SCUT_thesis/tree/master/tutorial)里的`scutthesis说明.pdf`文件，这是旧模板的文件，可以参考旧模板的东西。使用案例为[本人的学位论文](https://github.com/mengchaoheng/SCUTthesis-mengchaoheng.git)(注意该论文是基于初代模板，而现在的模板已经不断更新)。

编译之前首先安装[texlive](https://www.tug.org/texlive/)，找到对应系统（Linux，win，macOS）的版本。注意macOS是MacTeX。

## 快速使用：

编译有四种方法：

1.使用VSCode, 安装LaTeX Workshop插件，在`settings.json`中修改相关字段为`settings_files/settings.json`中的值。以前就有在使用vscode的同学需要把该`settings.json`文件的部分内容添加到自己的.json文件。第一次使用vscode的同学直接覆盖就行。在vscode配置使用xelatexmk进行编译。详情参考[讨论区](https://github.com/mengchaoheng/SCUT_thesis/discussions)。（2022年起添加的方法，有编程基础的同学建议使用，无编程基础使用TeXstudio）

2.使用编译脚本`all.bat`，记得关掉生成的pdf文档再双击`all.bat`。双击`clean.bat`删除临时文件。（此方法仅支持win，且多年未维护）

3.使用TeXstudio，首次编译建议从主文件`scutthesis.tex`开始编译，首先在`TeXstudio的Options->Configure TeXstudio->build`中，编译器(Dufault Compiler)选择`XeLaTeX`，默认文献工具(Default Bibliography Tool)选`Biber`，构建并查看（build & view） 按照`scutthesis.pdf`中的图2-1进行设置（点击右侧扳手符号进行设置，分别选择`recompile-bibliography`、`Defualt compiler`、`Defualt Viewer`并点add到右侧栏中），也可以使用默认的Compile & View（只不过此时不会自动更新参考文献著录）。(模板最初使用的编辑器，建议平时较少倒腾电脑、很少编程的同学使用)

4.使用overleaf，只需要在overleaf网页设置为XeLaTeX的编译方式即可。推荐无编程基础且不喜欢GitHub的同学使用。又可以分为三种操作方法，选择你觉得最顺手的：

1)在终端 `git clone https://github.com/mengchaoheng/SCUT_thesis.git` 得到本项目后切换到 `overleaf` 分支。将文件导入到overleaf，如果文件太大就删除.git文件等隐藏文件。

2)当然也可以直接在overleaf网页导入，模板地址在[SCUT_overleaf](https://www.overleaf.com/latex/templates/scut-thesis/bgybznvkjdfx)，更多使用说明参考[overleaf文档](https://www.overleaf.com/learn)。

3)在本页面将master branch改为选择overleaf分支后在download本项目等.zip文件，然后上传overleaf。

> **Note:** 使用Mac的同学可以用texifier，此软件可以理解为Mac上的IDE，像VSCode、TeXstudio之类。

## 参考文献管理

本模板最主要的改动是参考文献使用biblatex（biber），而不是原来的BibTeX，因此不再需要.bst文件。在这项改动之后，参考文献部分的格式符合国标，当然要注意进行适当的设置，因为根据学校的论文撰写规范，有的信息是不需要显示在参考文献著录里的。每年都有同学提问为什么参考文献的显示和学校发布的撰写规范有一点点不同，详情到issue和讨论区查看，但简而言之，目前的默认设置是可以用的，已经连续用了那么多届都没问题。感兴趣的同学可以查看biblatex包的[使用说明](https://github.com/mengchaoheng/SCUT_thesis/blob/master/settings_files/package_Documentation/biblatex-gb7714-2015.pdf)，[package_Documentation](https://github.com/mengchaoheng/SCUT_thesis/tree/master/settings_files/package_Documentation)文件夹还有其他包的使用说明。而大部分同学不需要关心这些。

另外参考文献管理软件推荐使用开源的zotero，这是生成本模板的bib文件的软件（使用其他文献管理软件如endnote当然也可以，重点是导出bib文件）。当然，也可以手动新建一个后缀名为.bib的文件，然后直接在文献页面（或谷歌、百度学术页面）复制BibTeX数据到该.bib文件，最后在`scutthesis.tex`文件里使用就行。zotero不仅有强大的PC端（支持mac、win、linux），还有移动端（安卓、ios），所有文献信息都是同步的，文献的pdf文件可以使用第三方存储工具（坚果云）同步。zotero的浏览器插件，可以使用chrome等浏览器搜索到论文后一键捕获文献信息到zotero。对zotero收集好的文献，选中想要引用的论文然后按快捷键复制（需要适当自定义设置），再到撰写论文的tex文件粘贴即可（word也可以使用zotero，也很方便，本项目我们仅仅讨论latex模板）。zotero还有翻译插件，scihub插件等等，功能非常强大。注意避免使用付费插件，这有悖于此软件的开源精神，部分公众号不敢恭维。总之多端同步，开源免费，插件丰富，方便随时随地看论文，省去管理文献的麻烦，相见恨晚！在2020年时个人比较推荐的zotero教程是b站up主`Struggle_with_me`做的，当然最近出现了很多新功能新教程，但最本质的东西应该还没有变，并且花里胡哨的东西（插件）其实并不实用。在写毕业论文的各位可以推荐给研一的师弟师妹，早用早享受，方便后期写论文。

## 错误排除：

编译时如果提示缺乏字体，请安装[settings_files](https://github.com/mengchaoheng/SCUT_thesis/tree/master/settings_files)里面的字体（win右键安装即可；mac参考官方字体安装教程；linux下类似，需要自行百度）。此外，目前遇到的导致错误的原因大都是以下三种：

1.语法错误，这种借助百度、谷歌很容易解决，按照latex的规范去写就好。

2.和参考文献有关的错误，记住一定检查好bib文件，而bib文件来源于参考文献管理软件如本文推荐的zotero，又或者来源于自己手动建立的文件。一定要设置好导出选项以及格式，同时要设置好编译选项biber(区别于常见的bibtex)。

3.编译器问题，和第二条一样，使用TeXstudio的话，一定要在`Options->Configure TeXstudio->build`中设置好；使用vscode的话，记得按照[讨论区](https://github.com/mengchaoheng/SCUT_thesis/discussions)设置好vscode编译的配置文件`settings.json`。

4.其他问题，关掉生成的PDF，清除所有中间文件再编译一次看看。如win系统双击`clean.bat`文件。或使用TeXstudio的话，点击`Tools->Clean Auxiliary files`。

确保以上几方面没问题的话，基本就可以愉快的写论文了。

## 贡献者

按加入时间顺序：
  * [mengchaoheng](https://github.com/mengchaoheng)
  * [Komari-Koshigaya](https://github.com/Komari-Koshigaya)
  * [zhuohoudeputao](https://github.com/zhuohoudeputao)

欢迎大家加入维护团队！！！
