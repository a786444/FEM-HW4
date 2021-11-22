function [ndime,nnode,nelem,nelnd,npres,pres,trac_nodes,trac]=Attributes(coor,conn,ntrac,trac_force,C)
ndime=size(coor,1);
nnode=length(coor);
nelem=length(conn);
nelnd=size(conn,1);
L=2*10*C;
pres_nodes=find(coor(1,:)==L);
npres=length(pres_nodes)*2;
pres=zeros(ndime+1,npres);
k=0;
for i=1:ndime:npres
    k=k+1;
    pres(1,i:i+1)=pres_nodes(k);
    for j=0:ndime-1
        pres(2,i+j)=j+1;
    end
end
trac_nodes=zeros(1,ntrac);
for i=1:ntrac
    trac_nodes(i)=find(coor(1,:)==0 & coor(2,:)==10);
end
trac=[trac_nodes;trac_force];
end