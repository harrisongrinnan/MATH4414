function [ p ] = lagrange_interp( z, x, y, d_order )
p = 0;
n=size(x,2);
coef=zeros(n,length(z));
if d_order==0
    for k = 1:n
        term = 1;
        for kk = 1:n
            if (k ~= kk)
                term = term/(x(k)-x(kk)).*(z-x(kk));
            end
        end
        p = p + term.*y(k);
    end
else
    p = zeros(1,size(z,2));
    for k = 1:n
        coef(k,:)=lagrange_char_der(z,x,k,d_order);
    end
    for i = 1:n
        p = p + y(i)*coef(i,:);
    end
end

end

