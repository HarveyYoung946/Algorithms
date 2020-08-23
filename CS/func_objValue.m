function [ result ] = func_objValue( pop )
%FUNC_OBJVALUE 计算目标函数
%   此处显示详细说明
% objValue =  sum(pop.^2,2);
% result = objValue ;
x = pop(:,1);
y = pop(:,2);
result = (3.*cos(x.*y)+x+y);

end

