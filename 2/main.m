clear 
clc
filename='input4-1.txt';
[ntrac,mate,trac_coor]=ReadData(filename);
iteration_max = 200;
 filename = 'q03';
 [p,t] = q03_demo(iteration_max);
 plotmesh(p,t,filename);
%triangulation_boundary_nodes('q03')
 [ndime,nnode,nelem,nelnd,npres,pres,trac_nodes,trac]=Attributes(p,t,ntrac,trac_coor);
  [modk,modr]=ModMatrix(ndime,nnode,nelem,nelnd,npres,ntrac,mate,p,t,pres,trac);
  u=modk\modr;
  force_sensor=find(round(p(1,:),1)==1 & round(p(2,:),1)==1.5 & round(p(3,:),1)==3);
  u(force_sensor*3)
  Plot(nelem,p,t,nnode,ndime,u)
% [elemss,nodess]=stress(ndime,nelnd,mate,nelem,p,u,t);
