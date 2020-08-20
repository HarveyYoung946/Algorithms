%初始化种群大小
%输入变量
%popsize种群大小
%chromlength染色体长度
%输出变量
%pop种群
function pop = initpop(popsize,chromlength)
    pop = round(rand(popsize,chromlength));
