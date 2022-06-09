clear
close all
clc
%去除通过第二问确定的302家企业中不给放贷的企业
orData=xlsread('302企业指标.xls','A2:K303');
data=xlsread('302企业贷款评价.xls','A2:A211');
point=xlsread('302企业评分.xls','N2:N303');
del=zeros(100,1);
k=1;
j=1;
for i=124:425
    if(orData(i-123,1)~=data(j,1))
        del(k,1)=i-123;
        k=k+1;
    else
        if (j<=210)
            j=j+1;
        else
            break;
        end
    end
end
for k=87:92
    del(k,1)=i-123;
    i=i+1;
end
for i=1:92
    orData(del(i,1),:)=0;
    point(del(i,1),:)=0;
end
xlswrite('第三题数据',orData,'A2:K303');
xlswrite('第三题数据',point,'L2:L303');
del=del+123;