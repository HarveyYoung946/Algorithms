%������ת��Ϊʮ����
%�������
%popsize��Ⱥ��С
%chromlengthȾɫ�峤��
%�������
%pop��Ⱥ
function pop2 = binary2decimal(pop)
    %ȡֵ��Χ
    limit = [-2 2];
    %�����Ʊ��볤��
    chromlength = 10;
    [~,py] = size(pop);
     for i = 1:py
        pop1(:,i) = 2.^(py-i).*pop(:,i); 
     end
     
     %sum(:,2)���н������,�õ�������
     temp = sum(pop1,2);
     pop2 = temp*(limit(2)-limit(1))/(2^chromlength-1) + limit(1);
