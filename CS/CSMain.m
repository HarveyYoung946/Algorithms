%%
%���㷨Ϊ�������Ż��㷨
clear 
close
clc
tic
%%
f = @(x,y)(3.*cos(x.*y)+x+y);
%����ͼ��
figure(1);
[xlp, xup]=meshgrid(-4:.05:4);
% yrp = fitness(xlp,xup);
yrp = f(xlp,xup);
mesh(xlp, xup, yrp);
hold on;

%%
%���ò���
N = 20; %?umber of nests(The scale of solution)
D = 2 ; %  Dimensionality of solution
T = 200 ; % Number of iterations
Xmax = 4 ;
Xmin = -4 ;
Pa = 0.25 ; % Probability of building a new nest(After host bird find exotic bird eggs)
nestPop = rand(N,D)*(Xmax-Xmin)+Xmin ;  % Random initial solutions
%%
%�������
for t=1:T
    %������ά���и�����Ⱥλ��
    levy_nestPop =  func_levy(nestPop,Xmax,Xmin) ; 
    %������Ⱥ��ͨ���Աȳ�ʼ�͸��º��
    nestPop = func_bestNestPop(nestPop,levy_nestPop); 
    %��������һ������Pa��������������½��ѵ�λ�ã�ͨ�������ʽ����λ��
    rand_nestPop = func_newBuildNest(nestPop,Pa,Xmax,Xmin);
    %������Ⱥ��ͨ���Աȳ�ʼ�͸��º��
    nestPop = func_bestNestPop(nestPop,rand_nestPop) ; 
    %����һ��λ�ø��º����Ӧ��
    result_fit = func_fitness(nestPop);
    %�۲�����ƶ��켣
    cla;
    mesh(xlp, xup, yrp);
    plot3(nestPop(:,1),nestPop(:,2),result_fit,'r*');
    pause(0.05);
    title(['������',num2str(t),'��']);
    [~,index] = max(result_fit) ; % Best nests
    trace(t,1:D) = nestPop(index,:);
    trace(t,D+1) = func_objValue(nestPop(index,:)) ; 
end
%%
figure 
disp(['���Ž�����λ������Ϊ��',num2str(trace(end,1:D))]);
disp(['���Ž�Ϊ��',num2str(trace(end,end))]);
plot(trace(:,end));
xlabel('��������') ;
ylabel('��Ӧ��ֵ') ;
title('��Ӧ�Ƚ�������');
toc