function [methodinfo,structs,enuminfo,ThunkLibName]=epanet2protofile
%EPANET2PROTOFILE Create structures to define interfaces found in 'epanet2'.

%This function was generated by loadlibrary.m parser version  on Fri Oct  9 09:23:26 2020
%perl options:'epanet2.i -outfile=epanet2protofile.m -thunkfile=epanet2_thunk_pcwin64.c -header=epanet2.h'
ival={cell(1,0)}; % change 0 to the actual number of functions to preallocate the data.
structs=[];enuminfo=[];fcnNum=1;
fcns=struct('name',ival,'calltype',ival,'LHS',ival,'RHS',ival,'alias',ival,'thunkname', ival);
MfilePath=fileparts(mfilename('fullpath'));
ThunkLibName=fullfile(MfilePath,'epanet2_thunk_pcwin64');
% int  _stdcall  ENepanet ( char *, char *, char *, void (*) ( char *)); 
fcns.thunkname{fcnNum}='int32cstringcstringcstringvoidPtrThunk';fcns.name{fcnNum}='ENepanet'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'cstring', 'cstring', 'cstring', 'FcnPtr'};fcnNum=fcnNum+1;
% int  _stdcall  ENopen ( char *, char *, char *); 
fcns.thunkname{fcnNum}='int32cstringcstringcstringThunk';fcns.name{fcnNum}='ENopen'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'cstring', 'cstring', 'cstring'};fcnNum=fcnNum+1;
% int  _stdcall  ENsaveinpfile ( char *); 
fcns.thunkname{fcnNum}='int32cstringThunk';fcns.name{fcnNum}='ENsaveinpfile'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'cstring'};fcnNum=fcnNum+1;
% int  _stdcall  ENclose ( void ); 
fcns.thunkname{fcnNum}='int32voidThunk';fcns.name{fcnNum}='ENclose'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
% int  _stdcall  ENsolveH ( void ); 
fcns.thunkname{fcnNum}='int32voidThunk';fcns.name{fcnNum}='ENsolveH'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
% int  _stdcall  ENsaveH ( void ); 
fcns.thunkname{fcnNum}='int32voidThunk';fcns.name{fcnNum}='ENsaveH'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
% int  _stdcall  ENopenH ( void ); 
fcns.thunkname{fcnNum}='int32voidThunk';fcns.name{fcnNum}='ENopenH'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
% int  _stdcall  ENinitH ( int ); 
fcns.thunkname{fcnNum}='int32int32Thunk';fcns.name{fcnNum}='ENinitH'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;
% int  _stdcall  ENrunH ( long *); 
fcns.thunkname{fcnNum}='int32voidPtrThunk';fcns.name{fcnNum}='ENrunH'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'longPtr'};fcnNum=fcnNum+1;
% int  _stdcall  ENnextH ( long *); 
fcns.thunkname{fcnNum}='int32voidPtrThunk';fcns.name{fcnNum}='ENnextH'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'longPtr'};fcnNum=fcnNum+1;
% int  _stdcall  ENcloseH ( void ); 
fcns.thunkname{fcnNum}='int32voidThunk';fcns.name{fcnNum}='ENcloseH'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
% int  _stdcall  ENsavehydfile ( char *); 
fcns.thunkname{fcnNum}='int32cstringThunk';fcns.name{fcnNum}='ENsavehydfile'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'cstring'};fcnNum=fcnNum+1;
% int  _stdcall  ENusehydfile ( char *); 
fcns.thunkname{fcnNum}='int32cstringThunk';fcns.name{fcnNum}='ENusehydfile'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'cstring'};fcnNum=fcnNum+1;
% int  _stdcall  ENsolveQ ( void ); 
fcns.thunkname{fcnNum}='int32voidThunk';fcns.name{fcnNum}='ENsolveQ'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
% int  _stdcall  ENopenQ ( void ); 
fcns.thunkname{fcnNum}='int32voidThunk';fcns.name{fcnNum}='ENopenQ'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
% int  _stdcall  ENinitQ ( int ); 
fcns.thunkname{fcnNum}='int32int32Thunk';fcns.name{fcnNum}='ENinitQ'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;
% int  _stdcall  ENrunQ ( long *); 
fcns.thunkname{fcnNum}='int32voidPtrThunk';fcns.name{fcnNum}='ENrunQ'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'longPtr'};fcnNum=fcnNum+1;
% int  _stdcall  ENnextQ ( long *); 
fcns.thunkname{fcnNum}='int32voidPtrThunk';fcns.name{fcnNum}='ENnextQ'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'longPtr'};fcnNum=fcnNum+1;
% int  _stdcall  ENstepQ ( long *); 
fcns.thunkname{fcnNum}='int32voidPtrThunk';fcns.name{fcnNum}='ENstepQ'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'longPtr'};fcnNum=fcnNum+1;
% int  _stdcall  ENcloseQ ( void ); 
fcns.thunkname{fcnNum}='int32voidThunk';fcns.name{fcnNum}='ENcloseQ'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
% int  _stdcall  ENwriteline ( char *); 
fcns.thunkname{fcnNum}='int32cstringThunk';fcns.name{fcnNum}='ENwriteline'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'cstring'};fcnNum=fcnNum+1;
% int  _stdcall  ENreport ( void ); 
fcns.thunkname{fcnNum}='int32voidThunk';fcns.name{fcnNum}='ENreport'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
% int  _stdcall  ENresetreport ( void ); 
fcns.thunkname{fcnNum}='int32voidThunk';fcns.name{fcnNum}='ENresetreport'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
% int  _stdcall  ENsetreport ( char *); 
fcns.thunkname{fcnNum}='int32cstringThunk';fcns.name{fcnNum}='ENsetreport'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'cstring'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetcontrol ( int , int *, int *, float *, int *, float *); 
fcns.thunkname{fcnNum}='int32int32voidPtrvoidPtrvoidPtrvoidPtrvoidPtrThunk';fcns.name{fcnNum}='ENgetcontrol'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32Ptr', 'int32Ptr', 'singlePtr', 'int32Ptr', 'singlePtr'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetcount ( int , int *); 
fcns.thunkname{fcnNum}='int32int32voidPtrThunk';fcns.name{fcnNum}='ENgetcount'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32Ptr'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetoption ( int , float *); 
fcns.thunkname{fcnNum}='int32int32voidPtrThunk';fcns.name{fcnNum}='ENgetoption'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'singlePtr'};fcnNum=fcnNum+1;
% int  _stdcall  ENgettimeparam ( int , long *); 
fcns.thunkname{fcnNum}='int32int32voidPtrThunk';fcns.name{fcnNum}='ENgettimeparam'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'longPtr'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetflowunits ( int *); 
fcns.thunkname{fcnNum}='int32voidPtrThunk';fcns.name{fcnNum}='ENgetflowunits'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32Ptr'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetpatternindex ( char *, int *); 
fcns.thunkname{fcnNum}='int32cstringvoidPtrThunk';fcns.name{fcnNum}='ENgetpatternindex'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'cstring', 'int32Ptr'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetpatternid ( int , char *); 
fcns.thunkname{fcnNum}='int32int32cstringThunk';fcns.name{fcnNum}='ENgetpatternid'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'cstring'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetpatternlen ( int , int *); 
fcns.thunkname{fcnNum}='int32int32voidPtrThunk';fcns.name{fcnNum}='ENgetpatternlen'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32Ptr'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetpatternvalue ( int , int , float *); 
fcns.thunkname{fcnNum}='int32int32int32voidPtrThunk';fcns.name{fcnNum}='ENgetpatternvalue'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'singlePtr'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetqualtype ( int *, int *); 
fcns.thunkname{fcnNum}='int32voidPtrvoidPtrThunk';fcns.name{fcnNum}='ENgetqualtype'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32Ptr', 'int32Ptr'};fcnNum=fcnNum+1;
% int  _stdcall  ENgeterror ( int , char *, int ); 
fcns.thunkname{fcnNum}='int32int32cstringint32Thunk';fcns.name{fcnNum}='ENgeterror'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'cstring', 'int32'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetnodeindex ( char *, int *); 
fcns.thunkname{fcnNum}='int32cstringvoidPtrThunk';fcns.name{fcnNum}='ENgetnodeindex'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'cstring', 'int32Ptr'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetnodeid ( int , char *); 
fcns.thunkname{fcnNum}='int32int32cstringThunk';fcns.name{fcnNum}='ENgetnodeid'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'cstring'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetnodetype ( int , int *); 
fcns.thunkname{fcnNum}='int32int32voidPtrThunk';fcns.name{fcnNum}='ENgetnodetype'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32Ptr'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetnodevalue ( int , int , float *); 
fcns.thunkname{fcnNum}='int32int32int32voidPtrThunk';fcns.name{fcnNum}='ENgetnodevalue'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'singlePtr'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetlinkindex ( char *, int *); 
fcns.thunkname{fcnNum}='int32cstringvoidPtrThunk';fcns.name{fcnNum}='ENgetlinkindex'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'cstring', 'int32Ptr'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetlinkid ( int , char *); 
fcns.thunkname{fcnNum}='int32int32cstringThunk';fcns.name{fcnNum}='ENgetlinkid'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'cstring'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetlinktype ( int , int *); 
fcns.thunkname{fcnNum}='int32int32voidPtrThunk';fcns.name{fcnNum}='ENgetlinktype'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32Ptr'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetlinknodes ( int , int *, int *); 
fcns.thunkname{fcnNum}='int32int32voidPtrvoidPtrThunk';fcns.name{fcnNum}='ENgetlinknodes'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32Ptr', 'int32Ptr'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetlinkvalue ( int , int , float *); 
fcns.thunkname{fcnNum}='int32int32int32voidPtrThunk';fcns.name{fcnNum}='ENgetlinkvalue'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'singlePtr'};fcnNum=fcnNum+1;
% int  _stdcall  ENgetversion ( int *); 
fcns.thunkname{fcnNum}='int32voidPtrThunk';fcns.name{fcnNum}='ENgetversion'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32Ptr'};fcnNum=fcnNum+1;
% int  _stdcall  ENsetcontrol ( int , int , int , float , int , float ); 
fcns.thunkname{fcnNum}='int32int32int32int32floatint32floatThunk';fcns.name{fcnNum}='ENsetcontrol'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'int32', 'single', 'int32', 'single'};fcnNum=fcnNum+1;
% int  _stdcall  ENsetnodevalue ( int , int , float ); 
fcns.thunkname{fcnNum}='int32int32int32floatThunk';fcns.name{fcnNum}='ENsetnodevalue'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'single'};fcnNum=fcnNum+1;
% int  _stdcall  ENsetlinkvalue ( int , int , float ); 
fcns.thunkname{fcnNum}='int32int32int32floatThunk';fcns.name{fcnNum}='ENsetlinkvalue'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'single'};fcnNum=fcnNum+1;
% int  _stdcall  ENaddpattern ( char *); 
fcns.thunkname{fcnNum}='int32cstringThunk';fcns.name{fcnNum}='ENaddpattern'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'cstring'};fcnNum=fcnNum+1;
% int  _stdcall  ENsetpattern ( int , float *, int ); 
fcns.thunkname{fcnNum}='int32int32voidPtrint32Thunk';fcns.name{fcnNum}='ENsetpattern'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'singlePtr', 'int32'};fcnNum=fcnNum+1;
% int  _stdcall  ENsetpatternvalue ( int , int , float ); 
fcns.thunkname{fcnNum}='int32int32int32floatThunk';fcns.name{fcnNum}='ENsetpatternvalue'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'single'};fcnNum=fcnNum+1;
% int  _stdcall  ENsettimeparam ( int , long ); 
fcns.thunkname{fcnNum}='int32int32longThunk';fcns.name{fcnNum}='ENsettimeparam'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'long'};fcnNum=fcnNum+1;
% int  _stdcall  ENsetoption ( int , float ); 
fcns.thunkname{fcnNum}='int32int32floatThunk';fcns.name{fcnNum}='ENsetoption'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'single'};fcnNum=fcnNum+1;
% int  _stdcall  ENsetstatusreport ( int ); 
fcns.thunkname{fcnNum}='int32int32Thunk';fcns.name{fcnNum}='ENsetstatusreport'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;
% int  _stdcall  ENsetqualtype ( int , char *, char *, char *); 
fcns.thunkname{fcnNum}='int32int32cstringcstringcstringThunk';fcns.name{fcnNum}='ENsetqualtype'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'cstring', 'cstring', 'cstring'};fcnNum=fcnNum+1;
methodinfo=fcns;