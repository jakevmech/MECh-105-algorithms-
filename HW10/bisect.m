function [root,fx,ea,iter] = bisect(func,xl,xu,es,maxit,varargin)
%Bisect: root location zweros
%uses bisection method to find the root of the function
%func - name of the function
%xl and xu = bound geusses
%es = desired relative error
%maxit = maxiumum allowable iterations (defult = 0.0001)
%p1,p2,.. = aditainal paramters
%root = real root
%fx = function value at root, 
%ea = aproxamite relativeerro
%iter = nu,mber of iterations
if nargin<3
    error('at least 3 imputs')
end
test = func(xl,varargin{:})*func(xu,varargin{:});
if test>0
    error('no sign change')
end
if nargin<4 || isempty(es)
    es = .0001 
end
if nargin<5 || isempty(maxit)
    maxit = 50
end
iter = 0;
xr = xl; ea = 100;
while (1)
    xrold = xr;
    xr = (xl + xu)/2;
    iter = iter + 1;
    if xr~=0
        ea = abs((xr-xrold)/xr)*100;
    end
    test = func(xl,varargin{:})*func(xr,varargin{:});
    if test < 0
        xu = xr;
    elseif test > 0
        xl = xr;
    else
        ea = 0;
    end
    if ea <= es || iter >= maxit
        break
    end
end
root = xr;
fx = func(xr, varargin{:});
end

        
