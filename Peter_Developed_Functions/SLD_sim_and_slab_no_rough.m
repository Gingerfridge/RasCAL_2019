function [xx,yy] = SLD_sim_and_slab_no_rough(params,bulk_in,bulk_out,contrast,surface_switch)

SLD_Step = 0.1;
%input here the parameters needed to make a slab model
    layNumber = params(2); %initilising the number of layers wanted in the fit
    for j = 1:layNumber
        layThickness(j) = params(4*j-1);
        laySLD(j) = params(4*j);
        layRough(j) = params(4*j+1);
        layHydration(j) = params(4*j+2);
    end
    %define the number of parameter before the simulation data
    starting_params_number = 3+4*layNumber;

    tracker = 0; %start position of the SLD profile

    for k = 1:layNumber

     x = transpose(0:SLD_Step:layThickness(k))
     size_xvector = size(x);
     SLD_Layer_hydration = ((laySLD(k)*((1-layHydration(k))))+(layHydration(k)*bulk_out(1,contrast)));
     y = ones(size_xvector(1,1),1)*SLD_Layer_hydration; % add hydration
     %inset logic to add each layer together
        if k == 1
         SLD_nextLayer_hydration = ((laySLD(k+1)*((1-layHydration(k+1))))+(layHydration(k+1)*bulk_out(1,contrast)));
         xout = x +tracker
         yout = y
         tracker = tracker+x(end)+SLD_Step

%          yout = yout+(SLD_nextLayer_hydration-SLD_Layer_hydration).*((erf((xout-tracker-SLD_Step)./layRough(k))+1)/2);
         %          yout = y*((laySLD(k+1)/laySLD(k))-1).*(((((erf((xout)/layRough(k)-tracker-SLD_Step))+1)/2)+1))
%              yout = y*((laySLD(k+1)/laySLD(k))-1).*((erf(((xout-tracker)/layRough(k)))+1)/2)+1;
 %add error fucntion here
               %layer between in and layer 2 need to be half an error function

        elseif k == layNumber

          x = x+tracker
          xout = [xout;x]
          yout = [yout;y]
          tracker = xout(end)+SLD_Step



        else
%          SLD_previousLayer_hydration = ((laySLD(k-1)*((1-layHydration(k-1))))+(layHydration(k-1)*bulk_out(1,contrast)));
%          SLD_nextLayer_hydration = ((laySLD(k+1)*((1-layHydration(k+1))))+(layHydration(k+1)*bulk_out(1,contrast)));
          tracker_before = tracker
          yout = [yout;y]
          x = x+tracker
          xout = [xout;x]


%           yout = yout*((SLD_Layer_hydration/SLD_previousLayer_hydration)-1).*(((erf((xout-tracker-SLD_Step)./-layRough(k))+1)/2)+1)
%           yout = yout-(SLD_previousLayer_hydration-SLD_Layer_hydration).*((erf((xout-tracker_before+SLD_Step)./1*layRough(k-1))+1)/2);

          tracker = xout(end)+SLD_Step

%           yout = yout*((SLD_nextLayer_hydration/SLD_Layer_hydration)-1).*(((erf((xout-tracker-SLD_Step)./-layRough(k))+1)/2)+1)

        end
  % %



        %add  half error unctions where the roughness is





    end

    %here add the error fuction to add roughness later need to add the
    %hydration
    %02/12/2020 hydration has been added

%     for p = 1:layNumber
%         xout
%
%     end
%
    if surface_switch == 1

    % this adds the simultion to the slab model
    [xx,yy] = Rascal_XY_maker_slab_initiliser(params,bulk_in,bulk_out,contrast,starting_params_number);
    xx=xx(:)+tracker;
    yy=yy(:);
    xx = [xout(:); xx(:)];
    yy = [yout(:); yy(:)];

    %this adds the water layer (bulk out to the slab model)
    elseif surface_switch == 2
        x = transpose(tracker:SLD_Step:tracker+10)
          size_xvector = size(x);
        y = bulk_out(1,contrast)*ones(size_xvector(1,1),1)

        xx = [xout(:); x];
        yy = [yout(:); y];
    end



end
