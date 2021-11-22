function [ndime,nnode,nelem,nelnd,npres,pres,trac_nodes,trac]=Attributes(p,t,ntrac,trac_coor)
ndime=size(p,1);
nnode=length(p);
nelem=length(t);
nelnd=size(t,1);
pres_nodes_bottom=find(round(p(3,:),2)==0);
pres_nodes_left=find(round(p(1,:),2)==0);
pres_nodes_right=find(round(p(1,:),2)==2);
pres_nodes_front=find(round(p(2,:),2)==0);
pres_nodes_back=find(round(p(2,:),2)==3);
pres_nodes_surface=[find(round(p(1,:),2)==0) find(round(p(1,:),2)==2) find(round(p(2,:),2)==0) find(round(p(2,:),2)==3)];
npres=length(pres_nodes_bottom)*3+length(pres_nodes_surface)*2;
pres=zeros(3,npres);
k=0;
for i=1:ndime:length(pres_nodes_bottom)*ndime
    k=k+1;
    pres(1,i:i+2)=pres_nodes_bottom(k);
    for j=0:ndime-1
        pres(2,i+j)=j+1;
    end
end
l=0;
for i=k*3+1:ndime-1:npres 
    l=l+1;
    pres(1,i:i+1)=pres_nodes_surface(l);
    for j=0:ndime-2
        pres(2,i+j)=j+1;
    end
end  
trac_nodes=zeros(1,ntrac);
for i=1:ntrac
    trac_nodes(i)=find(round(p(1,:),1)==trac_coor(1,i) & round(p(2,:),1)==trac_coor(2,i) & round(p(3,:),1)==trac_coor(3,i));
end
trac_force=trac_coor(4:6,1:ntrac);
trac=[trac_nodes;trac_force];
end