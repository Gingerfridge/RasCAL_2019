function [Project_struct] = SLD_Rascal_Plotter(name_of_project,SLD_plot,Reflect_plot)

%use this function in the project folder to plot a nice pair of graphs of sld and reflectivity

Project_struct = load(name_of_project)
%SLD are found here a row the length the number of contrasts
grid off
if SLD_plot == 1
  for i = 1:Project_struct.problem.numberOfContrasts
  a = Project_struct.problem.calculations.slds{1,i}
  hold on

  plot(a(:,1),a(:,2))
  pubgraph(1,800,1200,640,640)
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
      
      b = Project_struct.problem.data{1,j}
  hold on
    pubgraph(2,-500,1200,1920/1.5,1080/1.5)

  loglog(a(:,1),a(:,2))
  hold on 
  loglog(b(:,1),b(:,2),"x")
  xlabel('q (A^-^1)')
  ylabel('Ref')
  set(gca, 'YScale', 'log')
  set(gca, 'XScale', 'log')
  pubgraph(2,-500,1200,1920/1.5,1080/1.5)

  end

end
saveas(gcf,'Temp_Ref.png')
end

