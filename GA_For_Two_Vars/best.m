%��������Ӧ�Ⱥ���
%���������pop�����Ƶĸ�����Ⱥ����fitvalue:��Ⱥ��Ӧ��
%���������bestindividual����Ѹ��壻bestfit�������Ӧ��
function [bestindividual,bestfit] = best(pop,fitvalue)
    [px,~] = size(pop);
    bestindividual = pop(1,:);
    bestfit = fitvalue(1);
    for i = 2:px
        if fitvalue(i) > bestfit
            bestindividual = pop(i,:);
            bestfit = fitvalue(i);
        end
    end