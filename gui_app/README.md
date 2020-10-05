# gui_app
该项目是基于面向对象编程，是供水管网震后水力分析软件V1.0的重构。

## 历史记录
- 2020-10-5 重新运行程序，检查程序错误，撰写技术文档及测试文件。
- 2020-10-5 构建start_toolkit.m，该函数源于EPANET-Matlab Toolkit。目的是将程序下的文件路径添加到Matlab检索路径中。可以创建窗口，但是运行会出现错误。
----
### 试验1
#### 描述/步骤
1.运行start_toolkit.m
2.运行main.m
3.在图形界面中输入案例管网，输出文件夹，以及rr文件，如图所示
![试验输入](https://github.com/lookforhan/appforWDN/blob/dev-check/gui_app/%E8%AF%95%E9%AA%8C/%E8%AF%95%E9%AA%8C1.PNG)
#### 结果
顺利完成运行，生成预期的结果文件。

生成奇怪的文件，名字为“sl5o.1”等，如图所示
![计划外文件](https://github.com/lookforhan/appforWDN/blob/dev-check/gui_app/%E8%AF%95%E9%AA%8C/%E8%AF%95%E9%AA%8C1_%E8%AE%A1%E5%88%92%E5%A4%96%E6%96%87%E4%BB%B6.png)