%%ʹ�ô�ѹ�����ӵ�����Ⱥ�㷨��ⷽ����ֵ
%��ѹ�����ӵ�����Ⱥ�㷨�ȹ���Ȩ��ϵ��w������Ч�ؿ�����Լ��΢���ķ����ٶ�
%ͬʱҲ��ǿ���㷨�ľֲ���������
clc;
t1 = clock;
%ά��
D = 2;
%�߽�boundary�����Сֵ
BMax = 2;
BMin = -2;
[xm1,fv1] = YSPSO_Max(@fitness,1000,2.25,2.25,200,D,BMax,BMin);
%����Сֵ
%before c1 = c2 = 2.05
%[xm,fv] =  PSO_adaptation(fitness,N,c1,c2,wmax,wmin,M,D)
% c1,c2��ѧϰ����
% wmax������Ȩ�����ֵ
% wmin������Ȩ����Сֵ
% M������������
% D�������ռ�ά��
% N����ʼ��Ⱥ�������Ŀ
%ii-�ڼ��鷴������
x_pos = xm1';
disp(['���Ž���ȡλ��Ϊ:',num2str(x_pos)]);
disp(['���Ž�Ϊ��',num2str(fv1)]);
t2 = clock;
disp(['�������',',����ʱ��Ϊ(s):',num2str(etime(t2,t1))]);