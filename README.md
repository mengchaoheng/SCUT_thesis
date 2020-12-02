# 华南理工大学硕/博士学位论文LaTeX模板（非官方）

本模板由 
https://github.com/alwintsui/scutthesis 
以及 
https://github.com/yecfly/scut-thesis 
的模板修改而来，可用于撰写华南理工大学硕/博士学位论文。编译时如果提示缺乏字体，请按照attachment里面的字体（右键安装即可）

“祖传代码”是前辈们的心血，在此向他们致以崇高的敬意！本模板在修改“祖传代码”过程中仅对修改部分进行更新，其余部分仍保留源代码。
另外参考文献管理软件推荐使用zotero，这是生成本模板的bib文件的软件。
本模板最主要的改动是参考文献使用biblatex（biber），而不是原来的BibTeX，因此不再需要.bst文件。
本模板不再利用Lyx，直接使用TeXstudio进行编辑。

使用之前可有选择性地阅读《一份（不太）简短的LATEX 2ε 介绍》，地址：https://github.com/CTeX-org/lshort-zh-cn.git ，以及阅读本模板的使用说明scutthesis.pdf文件。使用案例为本人的勘误后的学位论文（原文有部分笔误）：https://github.com/mengchaoheng/SCUTthesis-mengchaoheng.git

快速使用：

有两种方法：

1.使用编译脚本all.bat，记得关掉生成的pdf文档再双击all.bat。

2.使用TeXstudio，首次编译建议从主文件scutthesis.tex开始编译，首先在TeXstudio的Options->Configure TeXstudio->build中，编译器(Dufault Compiler)选择XeLaTeX，默认文献工具(Default Bibliography Tool)选Biber，构建并查看（build & view） 按照scutthesis.pdf中的图2-1进行设置（点击右侧扳手符号进行设置，分别选择recompile-bibliography、Defualt compiler、Defualt Viewer并点add到右侧栏中），也可以使用默认的Compile & View（只不过此时不会自动更新参考文献著录）。本文模板编译后生成的scutthesis.pdf即为模板使用说明，首次使用最好直接阅读该说明并结合《一份（不太）简短的LATEX 2ε 介绍》学习。

错误排除：

目前遇到的导致错误的原因大都是以下三种：

1.语法错误，这种自己很容易解决，特别是工科生，按照latex的规范去写就好。

2.和参考文献有关的错误，记住一定检查好bib文件，而bib文件来源于参考文献管理软件如本文推荐的zotero，一定要设置好导出选项以及格式，同时TeXstudio要设置好编译选项。

3.编译器问题，和第二条一样，一定要在TeXstudio的Options->Configure TeXstudio->build中设置好。

确保以上三方面没问题的话，基本就可以愉快的写论文了。

另外使用zotero，科学上网很重要，通常我们使用谷歌学术搜索文献并利用chrome的zotero插件直接捕获文献著录信息。但我使用蓝灯，代理服务器均遇到过被谷歌学术封锁的情况。只能不断换科学上网方法。
