function Plot(nelem,p,t,nnode,ndime,u)
for iel=1:nelem
    elemcoor=p(:,t(:,iel));
    elemcoorloop=[elemcoor elemcoor(:,1)];
    X=elemcoorloop(1,:);
    Y=elemcoorloop(2,:);
   % Z=elemcoorloop(3,:);
    line(X,Y,'color',[0 1 0])
end
ucoor=[p(1,:)+(u(1:ndime:2*nnode))';p(2,:)+(u(2:ndime:2*nnode))'];
for iel=1:nelem
    uelemcoor=ucoor(:,t(:,iel));
    uelemcoorloop=[uelemcoor uelemcoor(:,1)];
    X=uelemcoorloop(1,:);
    Y=uelemcoorloop(2,:);
    line(X,Y,'color',[1 0 0])
end 
% for inode=1:nnode
%     text (p(1,inode),p(2,inode),sprintf('%3.0f',inode),'fontsize',10)
% end