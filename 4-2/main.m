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
  [elemss,nodess,elemip]=stress(ndime,nelnd,mate,nelem,p,u,t);
  u_p=[p(1,:)+(u(1:ndime:ndime*nnode))';p(2,:)+(u(2:ndime:ndime*nnode))';p(3,:)+(u(3:ndime:ndime*nnode))'];
  %for i=1:length()
%   displacement=(u(1:ndime:ndime*nnode).^2+u(2:ndime:ndime*nnode).^2+u(3:ndime:ndime*nnode).^2).^0.5;
%   writeVTK('HW4-2-displacement',t',u_p',displacement)
%   writeVTK('HW4-1-origin',t',p',zeros(length(p),1))
  %postpro(elemss,elemip,p,t,u,ndime,nnode)
  %Plot(nelem,p,t,nnode,ndime,u)
