%���ѡ���µĸ���,���̶��㷨
%���������pop��������Ⱥ��fitvalue����Ӧ��ֵ
%���������newpopѡ���Ժ�Ķ�������Ⱥ
function [newpop] = selection(pop,fitvalue)
        %��������
        [px,~] = size(pop);
        fitvalue(fitvalue<=0,:) = 0;
        totalfit = sum(fitvalue);
        p_fitvalue = fitvalue/totalfit;
        %cumsum�����������
        p_fitvalue = cumsum(p_fitvalue);
        %��С��������
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


