
clear all
clc
format longe
results=zeros(8,8);
%necessary fields
tspan = [0 25];
u0=[0 1 0 0.8 0 1.2];

for j=1:8
    for k=1:8
        options=odeset('RelTol',10^-j,'AbsTol',10^-k);
        [T45, Y45]=ode45(@fvinc, tspan, u0, options);
        res=zeros(length(T45),1);
        res(:)=abs((Y45(:,1).^2+Y45(:,2).^2+Y45(:,3).^2)-ones(length(T45),1));
        results(j,k)=max(res);
        if max(res) < 1.0e-5
            [j k j+k max(res) length(T45) Y45(length(T45),1)]
            break
        end
    end
end

results;

plot3(Y45(:,1),Y45(:,2),Y45(:,3),'Linewidth',1.5)