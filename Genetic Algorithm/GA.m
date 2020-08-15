%%���û����㷨��10*sin(5*x)+7*abs(x-5)+10�������Լ���̬��ʾ
clear;
clc;
%��Ⱥ��С
popsize = 100;
%�����Ʊ��볤��
chromlength = 10;
%�������
pc = 0.6;
%�������
pm = 0.002; 
%��ʼ����Ⱥ
pop = initpop(popsize,chromlength);

% disp('position1');
for i = 1:100
    %������Ӧ��
    objvalue = cal_objvalue(pop);
    fitvalue = objvalue;
    %disp('������Ӧ��');
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
  %   disp('������Ⱥ');
    %Ѱ�����Ž�
    [bestindividual,bestfit] = best(pop,fitvalue);
  %   disp('Ѱ�����Ž�');
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
        %title(['��������Ϊn=' num2str(i)]);
%         drawnow
        plot(x, y, 'b-', x1, y1, 'ro');
        title(['��������Ϊn=' num2str(i)]);
        pause(0.1);
       % title('״̬λ�ñ仯');
        
        %plot(x1,y1,'*');
    end

end
% disp('position3');
fprintf('The best X is --->>%5.2f\n',x2);
fprintf('The best Y is --->>%5.2f\n',bestfit);
