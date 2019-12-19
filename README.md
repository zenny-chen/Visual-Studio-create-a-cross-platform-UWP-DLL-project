# Visual Studio 2019 Create a Cross-platform UWP DLL project
使用Visual Studio创建UWP跨平台的DLL项目

<br />

之前，在《[VC#调用C函数样例详解](https://github.com/zenny-chen/VCSharp-Call-C-Functions)》这篇博文中详细介绍了如何用Visual Studio 2019创建DLL项目并将它用于桌面端应用的C#项目中。本博文将进一步介绍如何针对UWP应用创建DLL并将它用于基于UWP应用的C#项目工程中。UWP应用的特点是跨处理器架构，一般一个UWP应用能同时支持x86、x64、ARM以及ARM64这四种架构。这里的demo为了方便叙述，将只支持我们当前最常用的x64与ARM64这两种处理器架构。

<br />

下面我们就先创建一个基于UWP的DLL项目。我们打开Visual Studio 2019，然后点击“创建新项目”，然后选择“DLL（通用Windows-C++/CX）”这一项目模板，如下图所示。

<br />

![1.jpg](https://github.com/zenny-chen/Visual-Studio-create-a-cross-platform-UWP-DLL-project/blob/master/images/1.JPG)

<br />

本demo是将项目命名为“UWPDLL”。

进入编辑界面之后，我们把冗余的cpp文件与头文件全都删除，如下图所示。我们可以方便地选中要删除的文件，然后点击鼠标右键，再点击“删除”，如下图所示。

<br />

![2.jpg](https://github.com/zenny-chen/Visual-Studio-create-a-cross-platform-UWP-DLL-project/blob/master/images/2.JPG)

<br />

删除之后，我们把剩下的“dllmain.cpp”文件重命名为“dllmain.c”。

之后，我们点击菜单栏中的“项目”，然后再选择“UWPDLL属性”，进入后要分别将“x64”平台和“ARM64”平台的预编译头选项设置为**不使用预编译头**，如下如所示。

<br />

![3.jpg](https://github.com/zenny-chen/Visual-Studio-create-a-cross-platform-UWP-DLL-project/blob/master/images/3.JPG)

<br />

由于本项目所要对外提供的函数是用汇编实现的，因此我们要让当前项目能分别支持marmasm与masm汇编。我们先鼠标右键点击“UWPDLL(Universal Windows)”，然后选择“生成依赖项”，再选择“生成自定义”。如下图所示。

<br />

![4.jpg](https://github.com/zenny-chen/Visual-Studio-create-a-cross-platform-UWP-DLL-project/blob/master/images/4.JPG)

<br />

然后，我们勾选“marmasm”与“masm”这两项。如下图所示：

<br />

![5.jpg](https://github.com/zenny-chen/Visual-Studio-create-a-cross-platform-UWP-DLL-project/blob/master/images/5.JPG)

<br />

加完之后，接着我们就要添加汇编源文件了。我们还是鼠标右键点击“UWPDLL(Universal Windows)”，然后选择“新建项”，再选择“添加”，如下图所示。

<br />

![6.jpg](https://github.com/zenny-chen/Visual-Studio-create-a-cross-platform-UWP-DLL-project/blob/master/images/6.JPG)

<br />

进入添加文件界面之后，我们选中左边栏的“Visual C++”，然后再选择右边框中的“C++文件”，不过我们要在“名称”中填写asm作为后缀的文件名。这里的demo分别建了“test_arm.asm”与“test_x64.asm”这两个汇编源文件。前者用于书写ARM64汇编，或者用于书写x86_64架构的汇编。尽管都基于MASM语法，但在某些细节上还是有些不同，我们可以直接进仓库的源文件中查看内容。

<br />

![7.jpg](https://github.com/zenny-chen/Visual-Studio-create-a-cross-platform-UWP-DLL-project/blob/master/images/7.JPG)

<br />


