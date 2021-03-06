function problem = rascal_DE_new_test(problem)

F_VTR = 0.00001; %Value to reach
I_D = length(problem.fitpars);

FVr_minbound = problem.fitconstr(:,1)'; 
FVr_maxbound = problem.fitconstr(:,2)'; 
I_bnd_constr = 1;  %1: use bounds as bound constraints, 0: no bound constraints

% I_NP            number of population members
I_NP = 20; 

% I_itermax       maximum number of iterations (generations)
I_itermax = problem.maxiter;

% F_weight        DE-stepsize F_weight ex [0, 2]
F_weight = 0.3; 

% F_CR            crossover probabililty constant ex [0, 1]
F_CR = 0.9; 

% I_strategy     1 --> DE/rand/1:
%                      the classical version of DE.
%                2 --> DE/local-to-best/1:
%                      a version which has been used by quite a number
%                      of scientists. Attempts a balance between robustness
%                      and fast convergence.
%                3 --> DE/best/1 with jitter:
%                      taylored for small population sizes and fast convergence.
%                      Dimensionality should not be too high.
%                4 --> DE/rand/1 with per-vector-dither:
%                      Classical DE with dither to become even more robust.
%                5 --> DE/rand/1 with per-generation-dither:
%                      Classical DE with dither to become even more robust.
%                      Choosing F_weight = 0.3 is a good start here.
%                6 --> DE/rand/1 either-or-algorithm:
%                      Alternates between differential mutation and three-point-
%                      recombination.           

I_strategy = 5;

% I_refresh     intermediate output will be produced after "I_refresh"
%               iterations. No intermediate output will be produced
%               if I_refresh is < 1
I_refresh = 1;

% I_plotting    Will use plotting if set to 1. Will skip plotting otherwise.
I_plotting = 1;

%-----Definition of tolerance scheme--------------------------------------
%-----The scheme is sampled at I_lentol points----------------------------
I_lentol   = 50;
FVr_x      = linspace(-1,1,I_lentol); %ordinate running from -1 to +1
FVr_lim_up = ones(1,I_lentol);   %upper limit is 1
FVr_lim_lo = -ones(1,I_lentol);  %lower limit is -1

%-----tie all important values to a structure that can be passed along----
problem.S_struct.I_lentol   = I_lentol;
problem.S_struct.FVr_x      = FVr_x;
problem.S_struct.FVr_lim_up = FVr_lim_up;
problem.S_struct.FVr_lim_lo = FVr_lim_lo;

problem.S_struct.I_NP         = I_NP;
problem.S_struct.F_weight     = F_weight;
problem.S_struct.F_CR         = F_CR;
problem.S_struct.I_D          = I_D;
problem.S_struct.FVr_minbound = FVr_minbound;
problem.S_struct.FVr_maxbound = FVr_maxbound;
problem.S_struct.I_bnd_constr = I_bnd_constr;
problem.S_struct.I_itermax    = I_itermax;
problem.S_struct.F_VTR        = F_VTR;
problem.S_struct.I_strategy   = I_strategy;
problem.S_struct.I_refresh    = I_refresh;
problem.S_struct.I_plotting   = I_plotting;

problem = rascal_deopt(@intrafun,problem,@PlotIt);

end


function S_MSE = intrafun(x,problem);

%x = cell2mat(struct2cell(x));

problem.fitpars = x;
problem = unpackparams(problem);
%setappdata(0,'problem',problem);
problem = reflectivity_calculation(problem);
%problem = getappdata(0,'problem');
fval = problem.calculations.sum_chi;

S_MSE.I_nc      = 0;%no constraints                 THESE FIRST FEW VALS MAY BE WRONG
S_MSE.FVr_ca    = 0;%no constraint array
S_MSE.I_no      = 1;%number of objectives (costs)
S_MSE.FVr_oa(1) = fval;

end


function PlotIt(FVr_bestmem,problem)

originalCalcSLD = problem.calcSLD;
problem.fitpars = FVr_bestmem;
problem = unpackparams(problem);
problem.calcSLD = 1;
problem = reflectivity_calculation(problem);
rJavaUpdatePlots();
problem.calcSLD = originalCalcSLD;
setappdata(0,'problem',problem);

end
