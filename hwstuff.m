x0=[-0.3, 0.05];
Bob=jacob(@(x) f(x), ones(20),10^-3)
[x,res,niter,err, B] = broyden(@(x) f(x),Bob,ones(1,20),10^-7,100000)