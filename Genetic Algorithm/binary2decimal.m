%������ת��Ϊʮ����
%�������
%popsize��Ⱥ��С
%chromlengthȾɫ�峤��
%�������
%pop��Ⱥ
function pop2 = binary2decimal(pop)
     [px,py] = size(pop);
     for i = 1:py
        pop1(:,i) = 2.^(py-i).*pop(:,i); 
     end
     %sum(:,2)���н������,�õ�������
     temp = sum(pop1,2);
     pop2 = temp*10/1023;
