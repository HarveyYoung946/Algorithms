%求最有适应度函数
%输入变量：pop二进制的父代种群数，fitvalue:种群适应度
%输出变量：bestindividual：最佳个体；bestfit：最佳适应度
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