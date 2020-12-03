function [output] = SLD_4_Rascal(params,bulk_in,bulk_out,contrast)

Hydration = params(1)
%need to convert hydration to the same scale as 'Hydration variable'

xx(:) = [-10
    -5
    2.02945000000000
6.08836000000000
10.1473000000000
14.2062000000000
18.2651000000000
22.3240000000000
26.3829000000000
30.4418000000000
34.5007000000000
38.5596000000000
42.6185000000000
46.6774000000000
50.7363000000000
54.7953000000000
58.8542000000000
62.9131000000000
66.9720000000000
71.0309000000000
75.0898000000000
79.1487000000000
83.2076000000000
87.2665000000000
100];
yy(:) = [st_val;
3e-6
7.00000000000000e-06
7.00000000000000e-06
6.80597294052517e-06
6.31689083402323e-06
6.25000475589126e-06
6.21457130747894e-06
6.12482232703204e-06
6.10852486154969e-06
6.07881152954816e-06
6.11969687207791e-06
6.10329046546622e-06
6.19225256080178e-06
6.20971925157524e-06
6.13757679183820e-06
6.13376558989744e-06
6.06499861249461e-06
6.04061261111806e-06
6.09850105851972e-06
6.19043155155934e-06
6.25750966990464e-06
6.31832717147885e-06
6.34738997834258e-06;end_val];


switch contrast
    case {1}
        output = [ xx(:) yy(:) ] ;
%    case {3,4}
%        output = [ xx(:) yy(:) ]  ;

end