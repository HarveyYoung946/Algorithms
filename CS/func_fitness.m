function [ result ] = func_fitness( pop )
%OBJFUNCTION 求�?应度，最小�?
%   待优化目标函�?% x:�?��群或者个�?% result : 种群适应�?
objValue =  func_objValue(pop);
result  = objValue ;
end

