function [y,x] = gaussian_function(a,b,c,x_in,x_step,x_out)

%input x -->

x = x_in:x_step:x_out;
s = size(x)

y = zeros(s(1,2),1)



    for i = 1:s(1,2)
        if x(i) > b 
              y(i) = 0;
        else
               y(i,1) = a.*exp((-(x(i)-b)*(x(i)-b))/(2*c^2));
        end
    end
