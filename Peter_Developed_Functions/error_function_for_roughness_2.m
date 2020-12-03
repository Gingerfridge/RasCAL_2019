function [x,y] = error_function_for_roughness_2(x_0,roughness,SLD_before,SLD_after,xout)
x = [x_0:0.1:x_0+3*roughness ]
y = (erf(((x(:)-x_0)/roughness)));
y = abs(y);
y = y+1;
y = y/2
y = -1*y *(SLD_after-SLD_before);


y = y +(SLD_after-SLD_before);