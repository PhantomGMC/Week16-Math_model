clear
close all
clc
%将210家企业按照分类标准进行分类
data=xlsread('第三题数据','A2: L211');
cla=xlsread('302 企业分类','A2:E119');
%对原始数据进行分类
classl=cla(l:28J1);
class2=cla(l:32,2);
class3=cla(1:118^3);
class4=cla(l:22^4);
class5=cla(l:10^ 5);
%对五类数据进行赋值
result=zeros(210^12);
j=l;
for i=l:28
    [m,~]=find(data(:,1)==classl(i,1));
    result(j,:)=data(m,:);
    j=j+1;
end
for i=1:32
    [m,~]=find(data(:,1)==class2(i,1));
    result(j,:)=data(m,:);
end
for i=1:118
    [m,~]=find(data(:,l)==class3(i,1));
    result(j,:)=data(m,:);
    j=j+l;
end
for i=1:22
    [m,~]=find(data(:,1)==class4(i,1));
    result(j,:)=data(m,:);
    j=j+1;
end
for i=1:10
    [m,~]=find(data(:,1)==class5(i,1));
    result(j,:)=data(m,:);
    j=j+1;
end
xlswrite ('第三题分类结果',result,'A2: L211');