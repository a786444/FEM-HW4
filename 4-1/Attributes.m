function [ndime,nnode,nelem,nelnd,npres,pres,trac]=Attributes(p,t,npres,pres_coor,trac_coor,ntrac)
ndime=size(p,1);
nnode=length(p);
nelem=length(t);
nelnd=size(t,1);
for i=1:npres
    pres_nodes(i)=find(p(1,:)==pres_coor(1,i)&p(2,:)==pres_coor(2,i));
end
pres=[pres_nodes;pres_coor(3:4,:)];
%npres=length(pres_nodes)*2;
%pres=zeros(ndime+1,npres);
% k=0;
% for i=1:ndime:npres
%     k=k+1;
%     pres(1,i:i+1)=pres_nodes(k);
%     for j=0:ndime-1
%         pres(2,i+j)=j+1;
%     end
% end
trac_nodes=zeros(1,ntrac);
for i=1:ntrac
    trac_nodes(i)=find(p(1,:)==(trac_coor(1,i)) & p(2,:)==(trac_coor(2,i)));
end
trac=[trac_nodes;trac_coor(3:4,:)];
end