function [xx,yy] = SLD_sim_and_slab(params,bulk_in,bulk_out,contrast,surface_switch)
SLD_Step = 0.1;
%input here the parameters needed to make a slab model
    layNumber = params(2); %initilising the number of layers wanted in the fit
    for j = 1:layNumber
        layers(j,1) = params(4*j-1);
        SLD_no_water(j,1) = params(4*j);
        layHydration(j,1) = params(4*j+2);
        layers(j,2) = (layHydration(j,1)*bulk_out)+((1-layHydration(j,1))*SLD_no_water(j,1));


        layers(j,3) = params(4*j+1);

    end
    %define the number of parameter before the simulation data
    starting_params_number = 3+4*layNumber;
    distance = sum(layers(:,1))


    %layers is[ thickness SLD roughness]
    %change bulk out to be the last layer for just the surface add a fully
    %hydrated layer for bulk out
    [out,totalRange] = makeSLDProfileXY_for_peter_3(bulk_in,bulk_out,layers(1,3),layers,layNumber,distance)

    xout = out(:,1)
    yout = out(:,2)

    if surface_switch == 1

    % this adds the simultion to the slab model
    [xx,yy] = Rascal_XY_maker_slab_initiliser(params,bulk_in,bulk_out,contrast,starting_params_number);
    tracker = totalRange-1
    xx=xx(:)+tracker;
    yy=yy(:);
    xx = [xout(:); xx(:)];
    yy = [yout(:); yy(:)];

    %this adds the water layer (bulk out to the slab model)
    elseif surface_switch == 2
        xx = xout(:);
        yy = yout(:);
    end



end
