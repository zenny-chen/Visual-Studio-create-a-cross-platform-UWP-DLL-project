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

接着我们需要分别对这两个asm文件配置属性。我们先右键点击“test_arm.asm”，然后选择“属性”。将“平台”这栏选为“ARM64”，然后在“从生成中排除”选择为“否”，在“项类型”中选择“Microsoft ARM Assembler”。接着，我们再将平台选为“x64”，然后将“从项目中排除”这一项选为“是”。如下图所示：

<br />

![9.jpg](https://github.com/zenny-chen/Visual-Studio-create-a-cross-platform-UWP-DLL-project/blob/master/images/9.JPG)

<br />

接着，对“test_x64.asm”也是如法炮制。只不过要对它设置为“x64”平台上“从项目中排除”选为“否”，“ARM64”平台上“从项目中排除”选为“是”。然后“项类型选择为“Microsoft Macro Assembler”。

最后，我们分别将平台切换为“x64”用Release模式编译一把，再切换为“ARM64”用Release模式编译一把，（如下图所示）。我们可以在项目根目录中看到生成了ARM64文件夹以及x64文件夹，其中的Release目录中就能找到对应所生成的“UWPDLL.dll”文件。

<br />

![8.jpg](https://github.com/zenny-chen/Visual-Studio-create-a-cross-platform-UWP-DLL-project/blob/master/images/8.JPG)

<br />

UWP应用与桌面应用所生成的dll文件会有些差别。桌面端DLL项目不仅生成了DLL文件，还生成了lib文件，而且这两个都需要被放置到目标项目工程中进行加载。而UWP的DLL项目就生成一个DLL文件，没有lib文件生成，因此我们就把所生成的相应目标平台的dll文件保存好即可。

<br />

下面我们将创建一个基于UWP的C#空白应用项目。
