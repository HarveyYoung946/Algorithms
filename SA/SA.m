%%
%�˺���Ϊģ���˻��㷨
clc
clear 
tic
% f = @(x)((x-2).^2 + 4);
f = @(x,y)(3.*cos(x.*y)+x+y);
%%
%����ԭ����ͼ��
figure;
[xlp, xup]=meshgrid(-4:.05:4);%����ȡֵ[-4 4]
% yrp = fitness(xlp,xup);
yrp = f(xlp,xup);
mesh(xlp, xup, yrp);
hold on;
%%
T = 1000;%��ʼ���¶�ֵ
D = 2;%��������-ά��
limit = [-4 4];%������Χ
T_min = 1e-6;%�����¶�����
alpha = 0.98;%�¶ȵ��½���
max_iter = 100;%����������

%��ʼ����
x = (limit(2)-limit(1))*rand(1,D) + limit(1);

%%
%ѭ��
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
          p = exp(-delta/T);%��p���ʽ��ܵ�ǰ��
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
title('����λ��');
figure;
plot(record(:,3));
disp(['���Ž�Ϊ��',[num2str(round(x(1),2)),' ',num2str(round(x(2)),2)]]);
disp(['���Ž�ֵΪ:',num2str(record(end,3))]);
title('��������');
toc