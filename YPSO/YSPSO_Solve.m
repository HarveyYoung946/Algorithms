%%使用带压缩因子的粒子群算法求解方程最值
%带压缩因子的粒子群算法比惯性权重系数w更能有效地控制与约束微粒的飞行速度
%同时也增强了算法的局部搜索能力
clc;
t1 = clock;
%维度
D = 2;
%边界boundary最大最小值
BMax = 2;
BMin = -2;
[xm1,fv1] = YSPSO_Max(@fitness,1000,2.25,2.25,200,D,BMax,BMin);
%求最小值
%before c1 = c2 = 2.05
%[xm,fv] =  PSO_adaptation(fitness,N,c1,c2,wmax,wmin,M,D)
% c1,c2：学习因子
% wmax：惯性权重最大值
% wmin：惯性权重最小值
% M：最大迭代次数
% D：搜索空间维数
% N：初始化群体个体数目
%ii-第几组反演数据
x_pos = xm1';
disp(['最优解所取位置为:',num2str(x_pos)]);
disp(['最优解为：',num2str(fv1)]);
t2 = clock;
disp(['计算结束',',运行时间为(s):',num2str(etime(t2,t1))]);