% name appUnitTest
% 鍙傝?銆奙ATLAB闈㈠悜瀵硅薄缂栫▼銆婸398
classdef appUnitTest < matlab.unittest.TestCase
    properties
        model% the test property is object of app
        pdd
        mc_parameter
    end
    methods(TestClassSetup)%run before the whole test
        %loadlibrary('epanet2.dll','epanet2.h');% load DLL/SO/DYLIB
%         function creatAPP(testCase) 
%         end
    end
    methods(TestClassTeardown)% run after the whole testa
        %unloadlibrary epanet2;% unload epanet2.dll
    end
    methods(TestMethodSetup)% run before each test
    end
    methods(TestMethodTeardown)% run after each test
    end
    methods(Test)% add test point
        function testModel_1(testCase)
            testCase.model=Model('Net1.inp');%
            testPoint1=testCase.model.getNodeElevation('10');
            testCase.verifyEqual(double(testPoint1),double(710));
        end
         %{
        function testModel_2(testCase)
            testCase.model.run;
            testPoint2=testCase.model.getNodePressureValue('10');
            testCase.verifyEqual(double(testPoint2),double(1.2596844e+02));
        end
        %}
        function testPDD(testCase)
            testCase.pdd = PDD_Parameter('C:\Users\hc042\Desktop\韧性\matlab代码\参数\parameter_PDD.txt');
            testPoint3=testCase.pdd.Hmin;
            testCase.verifyEqual(double(testPoint3),double(0));
        end
        function testPDD2(testCase)
            testCase.pdd = PDD_Parameter();
            testPoint4 = testCase.pdd.Hdes;
            testCase.verifyEqual(double(testPoint4),double(10));
        end
        function testModel_3(testCase)
            testCase.model=Model('Net1.inp');
            [p,~]=testCase.model.PDDrun;
             testCase.verifyGreaterThanOrEqual(double(min(p)),double(0));
        end
        function testMC(testCase)
            testCase.mc_parameter=MC_parameter();
            testPoint5=testCase.mc_parameter.n_seed;
            testCase.verifyEqual(double(testPoint5),double(2));
        end

    end
end

