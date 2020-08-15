%%利用基因算法求10*sin(5*x)+7*abs(x-5)+10的最大解以及动态显示
clear;
clc;
%种群大小
popsize = 100;
%二进制编码长度
chromlength = 10;
%交叉概率
pc = 0.6;
%变异概率
pm = 0.002; 
%初始化种群
pop = initpop(popsize,chromlength);

% disp('position1');
for i = 1:100
    %计算适应度
    objvalue = cal_objvalue(pop);
    fitvalue = objvalue;
    %disp('计算适应度');
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
  %   disp('更新种群');
    %寻找最优解
    [bestindividual,bestfit] = best(pop,fitvalue);
  %   disp('寻找最优解');
    x2 = binary2decimal(bestindividual);
    x1 = binary2decimal(newpop);
    y1 = cal_objvalue(newpop);
   % fplot('10*sin(5*x)+7*abs(x-5)+10',[0 10]);
    x = 0:0.01:10;
    y = 10*sin(5*x)+7*abs(x-5)+10;
   % hold on;
%     set(gcf,'doublebuffer','on');
    if mod(i,1) == 0
       % figure;
        % hold on;
%         plot(x1,y1,'*');
        %title(['迭代次数为n=' num2str(i)]);
%         drawnow
        plot(x, y, 'b-', x1, y1, 'ro');
        title(['迭代次数为n=' num2str(i)]);
        pause(0.1);
       % title('状态位置变化');
        
        %plot(x1,y1,'*');
    end

end
% disp('position3');
fprintf('The best X is --->>%5.2f\n',x2);
fprintf('The best Y is --->>%5.2f\n',bestfit);
