
clear all
clc
format longe
results=zeros(8,8);
%necessary fields
tspan = [0 25];
u0=[0 1 0 0.8 0 1.2];

for j=1:7
    for k=1:7
        options=odeset('RelTol',10^-j,'AbsTol',10^-k);
        [T23, Y23]=ode23(@fvinc, tspan, u0, options);
        res=zeros(length(T23),1);
        res(:)=abs((Y23(:,1).^2+Y23(:,2).^2+Y23(:,3).^2)-ones(length(T23),1));
        results(j,k)=max(res);
        if max(res) < 1.0e-5
            [j k j+k max(res) length(T23) Y23(length(T23),2)]
        end
    end
end

results;

plot3(Y23(:,1),Y23(:,2),Y23(:,3),'Linewidth',1.5)