function [xm,fv] = YSPSO_Max(fitness,N,c1,c2,M,D,BMax,BMin)
%带压缩因子的粒子群,求最小值
phi = c1 + c2;
if phi <= 4
    disp('c1 与 c2 的 和 必 须 大 于 4 ！');
    xm = NaN;
    fv = NaN;
    return;
end
format long;

%------初始化种群的个体------------

for i=1:N

    for j=1:D

        x(i,j) = 4*abs(rand)-2;  %随机初始化位置

        v(i,j) = 4*abs(rand)-2;  %随机初始化速度

    end

end

%------先计算各个粒子的适应度，并初始化Pi和Pg----------------------

for i=1:N

    p(i) = fitness(x(i,:));

    y(i,:) = x(i,:);

end

pg = x(N,:);             %Pg为全局最优

for i=1:(N-1)

    if fitness(x(i,:)) > fitness(pg)

        pg = x(i,:);

    end

end

%------进入主要循环，按照公式依次迭代------------
   
    v1 = -2:0.01:2;
    v2 = -2:0.01:2;
%     val = v2.*sin(2*pi*v1)+v1.*cos(2*pi*v2);
%     figure(1);
%     ezmesh('v2*sin(2*pi*v1)+v1*cos(2*pi*v2);',[-2,2,-2,2],100);
%     alpha(0.5);
%     hold on;
%     grid on;

for t=1:M
  for i=1:N
        ksi = 2 / abs(2 - phi - sqrt(phi^2 - 4*phi));
        v(i,:) = v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:));
        v(i,:) = ksi*v(i,:);
        %边界设置
%         v(i,find(v(i,:)>1)) = 1;
%         v(i,find(v(i,:)<0)) = 0;
%         
%         x(i,find(x(i,:)>1)) = 1;
%         x(i,find(x(i,:)<-0.1)) = 0;
%         
        x(i,:)= x(i,:) + v(i,:);
        %边界防止溢出
        x(i,find(x(i,:)>BMax)) = BMax;
        x(i,find(x(i,:)<BMin)) = BMin;
        
        if fitness(x(i,:)) > p(i)

            p(i) = fitness(x(i,:));

            y(i,:) = x(i,:);
           % tt = x(i,:);

        end

        if p(i) > fitness(pg)

            pg = y(i,:);

        end
      

   end

    Pbest(t) = fitness(pg);
    xm = pg';
    %disp(xm);
    figure(1);
    %[-3 3]拓宽边界，为使得图中粒子位置变化显示更加清晰
    ezmesh('v2*sin(2*pi*v1)+v1*cos(2*pi*v2);',[-3,3,-3,3],100);
    alpha(0.5);
    hold on;
    grid on;
    h = 0;%定义句柄
    h =  plot3(x(:,1),x(:,2),fitness(x),'ro');%定义画图函数句柄
    %axis([-2 2 -2 2 -inf inf]);
    title(['迭代次数为n=' num2str(t)]);
    %停顿时间
    pause(0.0001);
    if  t+1-M ~= 0
       delete(h);%删除句柄，刷新图像
    end
 
%     xm = pg';
%     plot3(xm(1),xm(2),Pbest(t),'bo');
%     title(['迭代次数为n=' num2str(t)]);
%     pause(0.15);
end
xm = pg';
fv = fitness(pg);
figure(2);
save('pbest');
plot(Pbest);
xlabel('进化次数') ;
ylabel('适应度值') ;



