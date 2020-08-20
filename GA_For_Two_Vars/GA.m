%%利用基因算法求函数的最大解以及动态显示
clear;
clc;
%%适应度函数
fitness = @(a,b)(b.*sin(2*pi*a)+a.*cos(2*pi*b));

%画出原函数图像
figure;
[xlp, xup]=meshgrid(-2:.05:2);%变量取值[-2 2]
% yrp = fitness(xlp,xup);
yrp = fitness(xlp,xup);
mesh(xlp, xup, yrp);
hold on;
%%
%种群参数设置
%种群大小
popsize = 2000;
%迭代次数
maxiter = 150;
%二进制编码长度
chromlength = 10;
%种群维度，即变量个数
pd = 2;
%交叉概率
pc = 0.3;
%变异概率
pm = 0.01; 
% %取值范围
% limit = [-2 2];
%初始化种群
pop = initpop(popsize,chromlength*2);

%计算适应度
objvalue = fitness(binary2decimal(pop(:,1:chromlength)),binary2decimal(pop(:,chromlength+1:end)));
fitvalue = objvalue;
% disp('position1');

for i = 1:maxiter
  %%
    %选择操作
    newpop = selection(pop,fitvalue);
  %  disp('选择操作');
    %交叉操作
    newpop = crossover(newpop,pc);
   %  disp('交叉操作');
    %变异操作
    newpop = mutation(newpop,pm);
  %   disp('变异操作');
    %更新种群
    pop = newpop;
 %%
    %%寻找最优解
    %更新适应度
    px1 = binary2decimal(pop(:,1:chromlength));
    px2 = binary2decimal(pop(:,chromlength+1:end));
    objvalue = fitness(px1,px2);
    fitvalue = objvalue;
    [bestindividual,bestfit] = best(pop,fitvalue);
  %   disp('寻找最优解');
    bx1 = binary2decimal(bestindividual(1:chromlength));
    bx2 = binary2decimal(bestindividual(chromlength+1:end));
    %记录下每次最优解
    record(:,1:2) = [bx1 bx2];
    record(:,3) = bestfit;
    %动态显示
    %刷新
    cla
    mesh(xlp, xup, yrp);
    plot3(px1,px2,objvalue,'r*');
    title(['迭代次数为n=' num2str(i)]);
    pause(0.01);
    
end

%%
%从每次记录的最优解中找出最大值及相对应的变量取值
[z_max,ind] = max(record(:,3));
d_x = record(ind,1:2);
%%
%画出最优解位置
figure
mesh(xlp, xup, yrp);
% axis([-2.5 2.5 -2.5 2.5 -inf inf])
hold on
plot3(d_x(1),d_x(2),z_max,'r*');
title('最优位置');
fprintf('The best X is --->>%5.2f\n',d_x(1));
fprintf('The best Y is --->>%5.2f\n',d_x(2));
fprintf('The best Z is --->>%5.2f\n',z_max);
