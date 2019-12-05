function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxit,varargin)
%falsePosition finds the root of a function using false position method
if nargin == 3
    es = .0001
    maxit = 200
else if nargin == 4
        maxit = 200
    else nargin < 3 
        error('need more imputs')
    end
end
sign = func(xl)*func(xu)
if sign < 0
    xl = xl
    xu = xu
else
    error('need new bounds')
end
xr = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)))
iter = 1
ea = 100
while iter <= maxit && es <= ea
    xr = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)))
    xold=xr
    if func(xr) == 0
        ea = 0
    else if func(xr)*func(xl) < 0 
            xu=xr
            xl = xl
        else func(xr)*func(xl) > 0
            xl = xr
            xu = xu
    end
    end
    xr = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)))
    ea = abs((xr-xold)/xr)*100
    iter = iter + 1
end
root = xr
fx = func(root)
ea = abs((xr-xold)/xr)*100
iter = iter - 1


  

end


  

end
