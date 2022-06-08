clear
close all
clc
%计算第二问中各企业的信贷年利率
data=xlsread('附件3：银行贷款年利率与客户流失率关系的统计数据.xlsx','sheetl', 'A3:A31');%读取数据
result=zeros(263,1);
j=1;
for i=1:29
    result(j:j+8,1)=data(i,1);
    j=j+9;
end
xlswrite('302企业贷款评价.xls',result,'P2: P264');