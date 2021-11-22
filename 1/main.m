clear 
clc
filename='input1-1.txt';
[ntrac,mate,npres,pres_coor,trac_coor]=ReadData(filename);
iteration_max = 200;
h = 0.005;
filename = 'p01_h04';
[p,t] = p01_demo(iteration_max,h);
% plotmesh(p,t,filename);
 [ndime,nnode,nelem,nelnd,npres,pres,trac]=Attributes(p,t,npres,pres_coor,trac_coor,ntrac);
 [modk,modr]=ModMatrix(ndime,nnode,nelem,nelnd,npres,ntrac,mate,p,t,pres,trac);
u=modk\modr
Plot(nelem,p,t,nnode,ndime,u)