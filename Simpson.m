function [I] = Simpson(x,y)
x=[x]
y=[y]
if numel(y) ~= numel(x)
    error('y outputs should equal x inputs')
end
n = length(x)
n=n-1
b=x(n+1)
a=x(1)
y2=0
y3=0
space = diff(x,2)
if length(x)==2
    warning('trapazoid rule is being used')
    I=(x(2)-x(1))*(y(1)+y(2))/2
else if space==0
        if rem(n,2)==0 && length(x)>2
            for i=2:2:n
                y2(i)=y(i);
            end
            y2=4*sum(y2);
            for j=3:2:n-1
                y3(j)=(y(j));
            end
            y3=2*sum(y3);
            I=(y(1)+y2+y3+y(n+1))*(b-a)/(3*n)
        else if rem(n,2) ~= 0 && length(x)>2
                warning('trapazoid rule applied to last interval')
                for i=2:2:n-1
                    y2(i)=y(i);
                end
                y2=4*sum(y2);
                for j=3:2:n-2
                    y3(j)=(y(j));
                end
                y3=2*sum(y3);
                s=(y(1)+y2+y3+y(n))*(x(n)-a)/(3*(n-1));
                t=(b-x(n))*(y(n)+y(n+1))/2;
                I=s+t
        end
        end
else 
    error('x values must be equally spaced')
end
end
end
            
            
    
        
    
    

