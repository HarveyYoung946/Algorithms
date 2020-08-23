%%
%该算法为布谷鸟优化算法
clear 
close
clc
tic
%%
f = @(x,y)(3.*cos(x.*y)+x+y);
%画出图像
figure(1);
[xlp, xup]=meshgrid(-4:.05:4);
% yrp = fitness(xlp,xup);
yrp = f(xlp,xup);
mesh(xlp, xup, yrp);
hold on;

%%
%设置参数
N = 20; %?umber of nests(The scale of solution)
D = 2 ; %  Dimensionality of solution
T = 200 ; % Number of iterations
Xmax = 4 ;
Xmin = -4 ;
Pa = 0.25 ; % Probability of building a new nest(After host bird find exotic bird eggs)
nestPop = rand(N,D)*(Xmax-Xmin)+Xmin ;  % Random initial solutions
%%
%进入迭代
for t=1:T
    %根据莱维飞行更新鸟群位置
    levy_nestPop =  func_levy(nestPop,Xmax,Xmin) ; 
    %更新鸟群，通过对比初始和更新后的
    nestPop = func_bestNestPop(nestPop,levy_nestPop); 
    %宿主鸟以一定概率Pa发现外来鸟后重新建窝的位置，通过随机方式更新位置
    rand_nestPop = func_newBuildNest(nestPop,Pa,Xmax,Xmin);
    %更新鸟群，通过对比初始和更新后的
    nestPop = func_bestNestPop(nestPop,rand_nestPop) ; 
    %迭代一次位置更新后的适应度
    result_fit = func_fitness(nestPop);
    %观察鸟的移动轨迹
    cla;
    mesh(xlp, xup, yrp);
    plot3(nestPop(:,1),nestPop(:,2),result_fit,'r*');
    pause(0.05);
    title(['迭代第',num2str(t),'次']);
    [~,index] = max(result_fit) ; % Best nests
    trace(t,1:D) = nestPop(index,:);
    trace(t,D+1) = func_objValue(nestPop(index,:)) ; 
end
%%
figure 
disp(['最优解所在位置坐标为：',num2str(trace(end,1:D))]);
disp(['最优解为：',num2str(trace(end,end))]);
plot(trace(:,end));
xlabel('迭代次数') ;
ylabel('适应度值') ;
title('适应度进化曲线');
toc