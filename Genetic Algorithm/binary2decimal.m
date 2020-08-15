%二进制转化为十进制
%输入变量
%popsize种群大小
%chromlength染色体长度
%输出变量
%pop种群
function pop2 = binary2decimal(pop)
     [px,py] = size(pop);
     for i = 1:py
        pop1(:,i) = 2.^(py-i).*pop(:,i); 
     end
     %sum(:,2)对行进行求和,得到列向量
     temp = sum(pop1,2);
     pop2 = temp*10/1023;
