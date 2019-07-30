function D= Distance(A,B)
[m n]=size(A);
for i=1:1:m
    D(i)=sqrt((A(i,1)-B(1,2))^2+(A(i,2)-B(1,1))^2);
end
end

