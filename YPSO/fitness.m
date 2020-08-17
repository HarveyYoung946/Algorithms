function F=fitness(x)

%F  = sum(x.^2,2);
% x = pop(:,1);
% y = pop(:,2);
X = x(:,1);
Y = x(:,2);
F = Y.*sin(2*pi*X)+X.*cos(2*pi*Y);
% t1 = 3.*(1-x).^2.*exp(-x.^2-(y+1).^2);
% % disp('true1');
% t2 = 10.*(x./5-x.^3-y.^5).*exp(-x.^2-y.^2);
% % disp('true2');
% t3 = exp(-(x+1).^2-y.^2)/3;
% F = (t1 - t2 -t3);
end