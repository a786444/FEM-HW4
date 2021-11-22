clear 
clc
filename='input1-1.txt';
[ndime,ntrac,mate,trac_force,thickness]=ReadData(filename);
% kglob=GlobStiff(nelem,nnode,mate,coor,conn,nelnd,ndime);
% rglob=GlobTrac(ndime,nnode,ntrac,trac);
%Plot(nelem,coor,conn,nnode,ndime)
C=[2,4,6,8,12,16];
for i=C
    C=i;
    [coor,conn]=nodecreater(C);
    [ndime,nnode,nelem,nelnd,npres,pres,trac_nodes,trac]=Attributes(coor,conn,ntrac,trac_force,C);
    [modk,modr]=ModMatrix(ndime,nnode,nelem,nelnd,npres,ntrac,mate,coor,conn,pres,trac);
    u=modk\modr;
    postpro(u,coor)
end
Plot(nelem,coor,conn,nnode,ndime,u)