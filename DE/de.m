clc
%%
% ʹ�ò�ֽ����㷨�����������f = @(x,y) -20.*exp(-0.2.*sqrt((x.^2+y.^2)./2))-exp((cos(2.*pi.*x)+cos(2.*pi.*y))./2)+20+exp(1) ������[-4,4]�ϵ���Сֵ
% ����������Сֵ����(0,0),ֻ��63����new<old
%f = @(x,y)(-20.*exp(-0.2.*sqrt((x.^2+y.^2)./2))-exp((cos(2.*pi.*x)+cos(2.*pi.*y))./2)+20+exp(1));
%��ú��������ֵ��ֻ��63����new>old
% f = @(a,b)(b.*sin(2*pi*a)+a.*cos(2*pi*b)); 
% ��ú�������Сֵ,ֻ��63����new<old
f = @(x,y)(3.*cos(x.*y)+x+y);
figure(1);
[xlp, xup]=meshgrid(-4:.05:4);
% yrp = fitness(xlp,xup);
yrp = f(xlp,xup);
mesh(xlp, xup, yrp);
hold on;
%%
%������Ⱥ����
N = 5000;%��Ⱥ����
D = 2;%��Ⱥά�ȣ�����������
F = 0.5;%�����������
p_cr = 0.5;%�������
limit = [-4 4];
max_iter = 100;%����������

%%
%��ʼ����Ⱥ
pop = limit(1) + rand(N,D).*(limit(2)-limit(1));
%��������iter
iter = 0;
while iter <= max_iter
    %����
    H_pop = [];
    for i = 1:N
       index = round(rand(1,3).*(N-1))+1;
       add_up = pop(index(1),:)+F.*(pop(index(2),:)-pop(index(3),:));
       %�жϱ߽��Ƿ����
       add_up(add_up<limit(1)) = limit(1);
       add_up(add_up>limit(2)) = limit(2);
%        if add_up(1) > limit(2)
%            add_up(1) = limit(2);
%        end
%        if add_up(1) < limit(1)
%            add_up(1) = limit(1);
%        end
%        if add_up(2) > limit(2)
%            add_up(2) = limit(2);
%        end
%        if add_up(2) < limit(1)
%            add_up(2) = limit(1);
%        end      
       H_pop = [H_pop;add_up];
    end
    %����
    V_pop = H_pop;
    for i = 1:N
        for j = 1:D
            if rand > p_cr
                V_pop(i,j) = pop(i,j);
            end
        end
    end
    %ѡ��
    for i = 1:N
        f_old = f(pop(i,1),pop(i,2));
        f_new = f(V_pop(i,1),V_pop(i,2));
        if f_new < f_old
            pop(i,:) = V_pop(i,:);
        end
    end
   y  = f(pop(:,1),pop(:,2));
   cla
   mesh(xlp, xup, yrp);
   plot3(pop(:,1),pop(:,2),y,'r*');
   pause(0.1);
   title(['��������Ϊ',num2str(iter)]);
    
    %��������
    iter = iter + 1;
end
fprintf('The best X is --->>%5.4f\n',pop(end,1));
fprintf('The best Y is --->>%5.4f\n',pop(end,2));
fprintf('The best Z is --->>%5.4f\n',f_new);
