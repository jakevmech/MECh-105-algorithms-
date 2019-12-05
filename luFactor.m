function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix

[m,n]=size(A)
if m ~= n
    error('matrix must be square')
end
[m,n]=size(A)
P=eye([m,n])
L=zeros(m)
for j=1:n-1
    if abs(A(j,j))<max(abs(A(j+1:n,j)))
        [M,I]=max(abs(A(j+1:n,j)))
        r = I+j
        P=swapRows(P,j,r,1,n)
        A=swapRows(A,j,r,1,n)
        L=swapRows(L,j,r,1,n)
    end   
    for i=j+1:n
        c=A(i,j)/A(j,j)
        L(i,j)=c
        A(i,j:n)=A(i,j:n)-c*(A(j,j:n))
        U=A
    end
end
L= L+eye([m,n])


function [swapped] = swapRows(matrix, row1, row2,x,y)
   % this is a sub-function to swap rows in a matrix
   swapped = matrix;
   swapped(row1,x:y) = matrix(row2, x:y);
   swapped(row2, x:y) = matrix(row1, x:y);
end
end
