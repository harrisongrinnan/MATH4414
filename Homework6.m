%problem 1
a = zeros(10, 1);
real=-sin(0.5);
b=zeros(10,2);
for i=1:10
    a(i, 1) =abs(d43c(@(x) cos(x),0.5,1/(i*10))-real);
    b(i,1)=1;
    b(i,2)=1/(i*10);
end
a=log(a);
b(:,2)=log(b(:,2));
a\b;

%problem 2
a=-1;
b=1;
real=2*sin(1);
results=zeros(10,1);
for i=1:10
    results(i,1)=(quadrature_NCC(@(x) cos(x),a, b, i)-real);
end
results;

%problem 3
a=-1;
b=1;
real=0.54936030677800634434;
results=zeros(10,1);
for i=1:10
    results(i,1)=(quadrature_NCC(@(x) 1./(1+25*x.^2),a, b, i)-real);
end
results;
a=-1;
b=1;
real=2*sin(1);
results=zeros(10,1);
for i=1:10
    results(i,1)=(quadrature_GL(@(x) cos(x), i)-real);
end
results;

%problem 4
a=-1;
b=1;
real=0.54936030677800634434;
results=zeros(10,1);
for i=1:10
    results(i,1)=abs(quadrature_GL(@(x) 1./(1+25*x.^2), i)-real);
end
results;

%problem 5
m=[100 150 200 250 300 350 400 450 500];
results=zeros(9,1);
for i=1:9
    sum=0;
    h=2/m(i);
    for k=1:m(i)
        sum=sum+quadrature_NCC(@(x) 1./(1+25*x.^2),a+(k-1)*h,a+k*h,1);
    end
    results(i,1)=abs(sum-0.54936030677800634434);
end
results;

%problem 5
m=[100 150 200 250 300 350 400 450 500];
results=zeros(9,1);
for i=1:9
    sum=0;
    h=2/m(i);
    for k=1:m(i)
        sum=sum+quadrature_NCC(@(x) 1./(1+25*x.^2),a+(k-1)*h,a+k*h,2);
    end
    results(i,1)=abs(sum-0.54936030677800634434);
end
results
