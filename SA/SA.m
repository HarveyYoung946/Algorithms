%%
%此函数为模拟退火算法
clc
clear 
tic
% f = @(x)((x-2).^2 + 4);
f = @(x,y)(3.*cos(x.*y)+x+y);
%%
%画出原函数图像
figure;
[xlp, xup]=meshgrid(-4:.05:4);%变量取值[-4 4]
% yrp = fitness(xlp,xup);
yrp = f(xlp,xup);
mesh(xlp, xup, yrp);
hold on;
%%
T = 1000;%初始化温度值
D = 2;%变量个数-维度
limit = [-4 4];%变量范围
T_min = 1e-6;%设置温度下限
alpha = 0.98;%温度的下降率
max_iter = 100;%最大迭代次数

%初始化解
x = (limit(2)-limit(1))*rand(1,D) + limit(1);

%%
%循环
iter = 1;
while T > T_min
   for i = 1:max_iter
       fx = f(x(1),x(2));
       x_new = (limit(2)-limit(1))*rand(1,D) + limit(1);
%        if x_new>=-2 && x_new<=2
       fx_new = f(x_new(1),x_new(2));
       delta = fx_new - fx;
%        end
       if delta < 0
%           x = x_new + (2*rand-1); 
            x = x_new ;
       else 
          p = exp(-delta/T);%以p概率接受当前解
          if p > rand
              x = x_new;
          end
       end
      
   end
  T = T * alpha;    
  record(iter,1:2) = x;
  record(iter,3) = f(x(1),x(2));
  iter = iter + 1;
end
plot3(record(end,1),record(end,2),record(end,3),'r*');
title('最终位置');
figure;
plot(record(:,3));
disp(['最优解为：',[num2str(round(x(1),2)),' ',num2str(round(x(2)),2)]]);
disp(['最优解值为:',num2str(record(end,3))]);
title('迭代过程');
toc