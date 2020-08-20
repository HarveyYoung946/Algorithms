%%���û����㷨�����������Լ���̬��ʾ
clear;
clc;
%%��Ӧ�Ⱥ���
fitness = @(a,b)(b.*sin(2*pi*a)+a.*cos(2*pi*b));

%����ԭ����ͼ��
figure;
[xlp, xup]=meshgrid(-2:.05:2);%����ȡֵ[-2 2]
% yrp = fitness(xlp,xup);
yrp = fitness(xlp,xup);
mesh(xlp, xup, yrp);
hold on;
%%
%��Ⱥ��������
%��Ⱥ��С
popsize = 2000;
%��������
maxiter = 150;
%�����Ʊ��볤��
chromlength = 10;
%��Ⱥά�ȣ�����������
pd = 2;
%�������
pc = 0.3;
%�������
pm = 0.01; 
% %ȡֵ��Χ
% limit = [-2 2];
%��ʼ����Ⱥ
pop = initpop(popsize,chromlength*2);

%������Ӧ��
objvalue = fitness(binary2decimal(pop(:,1:chromlength)),binary2decimal(pop(:,chromlength+1:end)));
fitvalue = objvalue;
% disp('position1');

for i = 1:maxiter
  %%
    %ѡ�����
    newpop = selection(pop,fitvalue);
  %  disp('ѡ�����');
    %�������
    newpop = crossover(newpop,pc);
   %  disp('�������');
    %�������
    newpop = mutation(newpop,pm);
  %   disp('�������');
    %������Ⱥ
    pop = newpop;
 %%
    %%Ѱ�����Ž�
    %������Ӧ��
    px1 = binary2decimal(pop(:,1:chromlength));
    px2 = binary2decimal(pop(:,chromlength+1:end));
    objvalue = fitness(px1,px2);
    fitvalue = objvalue;
    [bestindividual,bestfit] = best(pop,fitvalue);
  %   disp('Ѱ�����Ž�');
    bx1 = binary2decimal(bestindividual(1:chromlength));
    bx2 = binary2decimal(bestindividual(chromlength+1:end));
    %��¼��ÿ�����Ž�
    record(:,1:2) = [bx1 bx2];
    record(:,3) = bestfit;
    %��̬��ʾ
    %ˢ��
    cla
    mesh(xlp, xup, yrp);
    plot3(px1,px2,objvalue,'r*');
    title(['��������Ϊn=' num2str(i)]);
    pause(0.01);
    
end

%%
%��ÿ�μ�¼�����Ž����ҳ����ֵ�����Ӧ�ı���ȡֵ
[z_max,ind] = max(record(:,3));
d_x = record(ind,1:2);
%%
%�������Ž�λ��
figure
mesh(xlp, xup, yrp);
% axis([-2.5 2.5 -2.5 2.5 -inf inf])
hold on
plot3(d_x(1),d_x(2),z_max,'r*');
title('����λ��');
fprintf('The best X is --->>%5.2f\n',d_x(1));
fprintf('The best Y is --->>%5.2f\n',d_x(2));
fprintf('The best Z is --->>%5.2f\n',z_max);
