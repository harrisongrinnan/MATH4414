beta=zeros(200,1);
y1= zeros(200, 1);
y2 = zeros(200, 1);
a = -0.1;
f=@(x) 433/260 + (10*cos(b))/13 - cos(b - x) - cos(x);
df=@(x) -sin(b - x) + sin(x)
for k = 0:200
    t = k*pi/300;
    i=k+1;
    beta(i)=t
    f=@(x)((10/13)*cos(t)-cos(x)-cos(t-x)+(305/260));
    df=@(x)(-sin(t - x) + sin(x))
    [zero, ~, ~] = newton(f, df,-0.1,10^-5,500);
    y1(i) = zero
    [zero, ~, ~] = newton(f, df,2*pi/3,10^-5,500);
    y2(i)= zero
end

plot(beta, y1,'r', beta, y2,'b')