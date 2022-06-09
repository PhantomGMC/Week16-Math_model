clear
close all
clc
%计算123家企业各指标数据
%读取数据
data1=xlsread('123企业结果.xls','进项结果');
data2=xlsread('123企业结果.xls','销项结果');
E1=xlsread('123企业月方差.xls','进项结果');
E2=xlsread('123企业月方差.xls','销项结果');
result=zeros(123,11);
result(:,1)=data1(:,1);%企业代号
result(:,2)=data1(:,9);%进项价税合计
result(:,3)=data2(:,9);%销项价税合计
result(:,4)=(data2(:,7)-data1(:,7));%总利润
result(:,5)=E1(:,7);%月进项金额标准差
result(:,6)=E2(:,7);%月销项金额标准差
result(:,7)=(data1(:,10)+data2(:,10));%发票总量
result(:,8)=(data1(:,13)+data2(:,13))/2;% 有效发票占比
result(:,9)=data1(:,14);% 上游企业数量
result(:,10)=data2(:,14);%下游企业数量
result(:,11)=max(data1(:,15),data2(:,15));%运营时长
xlswrite('123企业指标',result,'A2:K124');%导出数据