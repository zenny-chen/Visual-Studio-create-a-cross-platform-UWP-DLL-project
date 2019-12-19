# Visual Studio 2019 Create a Cross-platform UWP DLL project
使用Visual Studio创建UWP跨平台的DLL项目

<br />

之前，在《[VC#调用C函数样例详解](https://github.com/zenny-chen/VCSharp-Call-C-Functions)》这篇博文中详细介绍了如何用Visual Studio 2019创建DLL项目并将它用于桌面端应用的C#项目中。本博文将进一步介绍如何针对UWP应用创建DLL并将它用于基于UWP应用的C#项目工程中。UWP应用的特点是跨处理器架构，一般一个UWP应用能同时支持x86、x64、ARM以及ARM64这四种架构。这里的demo为了方便叙述，将只支持我们当前最常用的x64与ARM64这两种处理器架构。

<br />


