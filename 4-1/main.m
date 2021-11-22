clear 
clc
filename='input1-1.txt';
[ntrac,mate,npres,pres_coor,trac_coor]=ReadData(filename);
iteration_max = 200;
h = 0.03;
filename = 'p01_h04';
[p,t] = p01_demo(iteration_max,h);
 plotmesh(p,t,filename);
 [ndime,nnode,nelem,nelnd,npres,pres,trac]=Attributes(p,t,npres,pres_coor,trac_coor,ntrac);
 [modk,modr]=ModMatrix(ndime,nnode,nelem,nelnd,npres,ntrac,mate,p,t,pres,trac);
u=modk\modr;
[elemss,nodess,elemip,elemsn]=stress(ndime,nelnd,mate,nelem,p,u,t);
postpro(elemss,elemip,p,t,u,ndime,nnode,elemsn)
%Plot(nelem,p,t,nnode,ndime,u)
