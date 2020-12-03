function [y,x] = gaussian_function_2(a,b,c,x_in,x_step,x_out)

%input x -->

x = x_in:x_step:x_out;
s = size(x)

y = zeros(s(1,2),1)



    for i = 1:s(1,2)
        if x(i) > b -0.1
               y(i,1) = a.*exp((-(x(i)-b)*(x(i)-b))/(2*c^2));
        else
              y(i) = 0;
        end
    end
