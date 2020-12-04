function [Project_struct] = SLD_Rascal_Plotter(name_of_project,SLD_plot,Reflect_plot)




%use this function in the project folder to plot a nice pair of graphs of sld and reflectivity

Project_struct = load(name_of_project)
%SLD are found here a row the length the number of contrasts
grid off
if SLD_plot == 1
  for i = 1:Project_struct.problem.numberOfContrasts
  a = Project_struct.problem.calculations.slds{1,i}
  hold on
  col = i/Project_struct.problem.numberOfContrasts;

  R = gaussmf(col,[0.4 1]);
  G = gaussmf(col,[0.25 0.5]);
  B = gaussmf(col,[0.4 0]);
  plot(a(:,1),a(:,2),'color',[R G B])
  pubgraph(1,600,1200,640,640)
  xlabel('Distance (A)')
  ylabel('SLD (A^-^2)')
  xlim([-inf, inf])
  ylim([-inf, inf])
end
saveas(gcf,'Temp_SLD.png')


if Reflect_plot == 1
    hold on
  for j = 1:Project_struct.problem.numberOfContrasts

      a = Project_struct.problem.calculations.Simulation{1,j}
      a(:,2) = Project_struct.problem.scalefactors(1,j)*10^(-1*j)*a(:,2);
      b = Project_struct.problem.data{1,j}
      b(:,2) = 10^(-1*j)*b(:,2);
  hold on
    col = j/Project_struct.problem.numberOfContrasts;

    R = gaussmf(col,[0.4 1]);
    G = gaussmf(col,[0.25 0.5]);
    B = gaussmf(col,[0.4 0]);
        pubgraph(2,-500,1200,1920/1.5,1080/1.5)
  loglog(a(:,1),a(:,2),'color',[R G B])
  hold on
  loglog(b(:,1),b(:,2),"x",'color',[R G B])
  xlabel('q (A^-^1)')
  ylabel('Ref')
  set(gca, 'YScale', 'log')
  set(gca, 'XScale', 'log')
  pubgraph(2,-500,1200,1920/1.5,1080/1.5)

  end

end
saveas(gcf,'Temp_Ref.png')
end
close all
