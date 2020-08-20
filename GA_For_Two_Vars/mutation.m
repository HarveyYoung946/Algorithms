%如何变异
%输入变量：pop二进制的父代种群数，pc：交叉的概率
%输出变量：newpop：变异后的种群数
function [newpop] = mutation(pop,pm)
      [px,py] = size(pop);
      newpop = ones(size(pop));
      for i = 1:px
         for k = 1:py
           if(rand<pm)
              mpoint = round(rand*py);
              if mpoint <= 0
                  mpoint = 1;
              end
              newpop(i,:) = pop(i,:);
              if newpop(i,mpoint) == 0
                  newpop(i,mpoint) = 1;
              end
              if newpop(i,mpoint) == 1
                  newpop(i,mpoint) = 0;
              end
          else
             newpop(i,:) = pop(i,:);
                 
           end
         end
      end

