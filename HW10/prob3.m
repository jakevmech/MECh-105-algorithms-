g = 9.81;
u = 0.55;
F = 150;
m = 25;

x = linspace(0,pi/2,360);
func = @(x)(u*m*g)./(cos(x)+u*sin(x))-150;
x = x;
y = func(x);
plot(x,y)
[root,fx,ea,iter] = bisect(func,1,1.3)
fprintf('%5.10f is the root %4.4f number of iterations %10.10f is the error and %10.10f is fx',root,iter,ea,fx)

