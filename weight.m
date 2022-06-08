clear
close all
clc
%求第一问中各公司的总评和风险评分
%读取数据
data=xlsread('123企业指标.xls','A2:K124');
evalue=xlsread('附件1：123家有信贷记录企业的相关数据.xlsx','企业信息');
da=data(:,2:11);
%归一化处理
for i=l:9
maxx=max(da(:,i));
minn=min(da(:,i));
if maxx==minn
    maxx=maxx+1;
end
    if i==4||i==5
        da(:,i)=(maxx-da(:,i))/(maxx-minn);%负向指标归一化
    else
        da(:,i)=(da(:,i)-minn)/(maxx-minn);%正向指标归一化
    end
end
da(find(da==0))=[0.0001];
da(find(da==1))=[0.9999];
%烯权法确定权重
summ=sum(da);
p=da./summ;
e=p.*log(p);
k=-l/log(123);
Ej=sum(e)*k;
Dj=1-Ej;
w=Dj/sum(Dj);% 最终权重
p=da.*w;%得分
%信誉评分
pe=evalue(:,3);
se=sum(pe>1);
we=(pe/se)*70;
point=zeros(123,14);
point(:,1)=data(:,1);
point(:,2:11)=p;
point(:,12)=sum(p,2);
re=sum(p>2)*0.5+we*0.5; %综合评分
point(:,13)=re;
point(:,14)=l-re;%风险总评
xlswrite('123企业评分',point,'A2:N12');%导出数据