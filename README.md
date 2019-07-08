# 跟着项目学iOS应用开发
前言
　　为什么要写这本书
　　从目前来看，iOS是全球最流行的移动端操作系统，这已经成为不争的事实。同时近年来苹果公司不断更新和完善供iOS OS X应用编程的开发语言Swift，使Swift在未来赚足眼球成为可能。作为一名iOS开发者，相信对于Swift语言并不陌生。使用Swift语言可以高效开发出高质量的移动应用。如果开发人员现在还不开始学习Swift，还在留恋着Objective-C的话，恐怕用不了多久，就会被Swift所带来的技术革新无情淘汰。另一方面，iOS本身也在快速地进行技术改进。与以往不同，iOS 10、iOS 11引入和开放了许多别出心裁的新技术，如Core-ML、ARKit等。如果开发人员能够充分利用这些新技术，就可以让自己的应用给用户带来前所未有的使用体验，进而在移动应用时代取得一个制高点。
　　Swift自身的发展太快了，很多程序员在将自己的项目从Swift 2迁移到Swift 3的时候就遇到了很多头痛的问题。希望像这样“毁灭性”的升级是最后一次。好在从Swift 3到Swift 4的变化并不大。通过本书，读者可以将学到的知识点运用到实战中去，真正地将所有知识点融会贯通，从而打通所有“脉络”，在编写程序代码的时候达到“思如泉涌”的效果。
　　本书结构
　　本书通过制作真实世界的应用程序来帮助读者学习Swift 4编程知识。例如木琴弹奏、问答测试、骰子游戏、聊天应用、待办事项类应用（TODO）和天气应用。另外，书中还包括苹果公司的Core-ML智能应用程序与机器学习的相关内容，通过学习这些内容你将可以构建图像识别应用程序。
　　本书是根据由易到难的顺序来安排应用程序项目的，具体如下。
　　第1章：介绍Xcode的安装，认识Xcode的用户界面及主要面板功能，带领大家创建Hello World应用。
　　第2章：使用Interface Builder简单搭建用户界面，并制作I am rich应用。
　　第3章：介绍如何在iPhone物理真机上安装应用程序。
　　第4章：通过制作掷骰子应用，掌握如何通过代码控制界面元素，以及当用户与界面元素发生交互时如何给代码发送消息。
　　第5章：Swift语言的基础知识讲解。
　　第6章：介绍如何利用Stack Overflow网站解决在开发时所遇到的问题，并利用AVAudioPlayer类在应用中播放声音。
　　第7章：介绍MVC设计模式，并制作问答测试应用程序。
　　第8章：学习自动布局的相关知识，并对掷骰子应用进行迭代更新。
　　第9章：介绍类与对象的相关知识。
　　第10章：通过CocoaPods安装第三方链接库，并通过相关API从远程WebService获取所需要的数据。
　　第11章：利用目前国内流行的云端数据库建立聊天应用。
　　第12章：介绍版本控制的相关知识。
　　第13章和第14章：利用CoreData、Realm等数据存储工具实现类TODO应用程序。
　　第15章：利用机器学习和Core-ML的相关知识，构建图像识别应用程序。
　　各个部分的功能实现都基于由浅入深、循序渐进的原则，让广大读者在实践操作的过程中不知不觉地学习新方法，掌握新技能。
　　本书面向的读者
　　本书适合具备以下几方面知识和硬件条件的群体阅读。
　　·有面向对象的开发经验，熟悉类、实例、方法、封装、继承、重写等概念。
　　·有Swift的开发经验。
　　·有MVC设计模式的开发经验。
　　·有简单图像处理的经验。
　　·有一台Intel架构的Mac电脑（Macbook Pro、Macbook Air、Mac Pro或Mac Mini）。
　　如何阅读本书
　　每个人的阅读习惯都不相同，而且本书并不是一本从Swift语法讲起的基础“开荒”书。所以我还是建议你先从Swift 3.X的语法书学起，在有了一定的Swift语言基础以后，再开始阅读本书，跟着实践操作一步步完成各章节的项目。
　　在阅读本书的过程中，你可能会遇到语法错误、编译错误、网络连接错误等情况，不用着急，根据调试控制台中的错误提示，去分析产生Bug的原因，或者通过与本书所提供的源码进行对比，找出问题所在。
　　勘误和支持
　　由于水平有限，编写时间仓促，书中难免会出现一些错误或者不准确的地方，恳请读者批评指正。书中的全部源文件可以从GitHub（https：//github.com/liumingl/iOS-11-Swift-4-Tutorial）下载，也可以从我的网站（刘铭.cn）下载。如果你有任何宝贵意见或建议，欢迎发送邮件至liuming_cn@qq.com，期待得到你们的真挚反馈。
　　致谢
　　首先要感谢伟大到可以改变这个世界的Steven Jobs，他的精神对我产生了非常大的影响。
　　其次要感谢机械工业出版社华章公司的编辑杨福川老师和小艺老师，在这段时间中始终支持我的写作，你们的鼓励和帮助使我顺利完成全部书稿。
　　最后感谢我的爸爸、妈妈、刘颖、刘怀羽、张燕、王海燕，感谢你们对我的支持与帮助，并时时刻刻给我信心和力量！
　　谨以此书献给我最亲爱的家人，以及众多热爱iOS的朋友们！
　　刘铭
