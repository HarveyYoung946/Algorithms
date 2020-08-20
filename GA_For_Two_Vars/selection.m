%如何选择新的个体,轮盘赌算法
%输入变量：pop二进制种群，fitvalue：适应度值
%输出变量：newpop选择以后的二进制种群
function [newpop] = selection(pop,fitvalue)
        %构造轮盘
        [px,~] = size(pop);
        fitvalue(fitvalue<=0,:) = 0;
        totalfit = sum(fitvalue);
        p_fitvalue = fitvalue/totalfit;
        %cumsum概率求和排序
        p_fitvalue = cumsum(p_fitvalue);
        %从小到大排序
        ms = sort(rand(px,1));
        fitin = 1;
        newin = 1;
        while newin <= px
            if(ms(newin)) < p_fitvalue(fitin)
                newpop(newin,:) = pop(fitin,:);
                newin = newin + 1;
            else
                fitin = fitin + 1;
            end
        end


