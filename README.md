# appforWDN
This is a free program, which aims at developing an application. The application is developed based on MATLAB OOP, and can analysis the water supply network follow earthquake

I creat two basic class in WDN which are link and node.
# GENERAL RULES
This program is based on Object Oriented Programming(OOP) and EPANET 2.0.

## THE MODEL
In order to take advantage of EPANET2.DLL，we build the water distribution network(WDN) based on EPANET.

the water distribution network is composed by node(junction,tank,reservoirs) and link(pipe,pump,valve). So the basic class is components. Then the node and link inherit from the components. Then the junction, tank and reservoir inherit from class node; pipe,pump, valve inherit from class link.

## TEST-DRIVEN DEVELOPMENT
I develop this program based on MATLAB Unit Test Framework.
1.propose the necessary demands
2.write a test file
3.realize the algorithm
4.run the test
## HOW TO USE THE PROGRAM
Run ./gui_app/start_toolkit.m
Run ./gui_app/main.m
## HOW TO BUILD THE PROGRAM
cd ./gui_app
mcc -m main.m -a ./lib
 
the executable file is in the folder named“executable”