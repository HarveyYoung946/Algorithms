%二进制转化为十进制
%输入变量
%popsize种群大小
%chromlength染色体长度
%输出变量
%pop种群
function pop2 = binary2decimal(pop)
    %取值范围
    limit = [-2 2];
    %二进制编码长度
    chromlength = 10;
    [~,py] = size(pop);
     for i = 1:py
        pop1(:,i) = 2.^(py-i).*pop(:,i); 
     end
     
     %sum(:,2)对行进行求和,得到列向量
     temp = sum(pop1,2);
     pop2 = temp*(limit(2)-limit(1))/(2^chromlength-1) + limit(1);
