function Plot(nelem,coor,conn,nnode,ndime,u)
for iel=1:nelem
    elemcoor=coor(:,conn(:,iel));
    elemcoorloop=[elemcoor elemcoor(:,1)];
    X=elemcoorloop(1,:);
    Y=elemcoorloop(2,:);
    line(X,Y,'color',[0 1 0])
end
ucoor=[coor(1,:)+(u(1:ndime:2*nnode))';coor(2,:)+(u(2:ndime:2*nnode))'];
for iel=1:nelem
    uelemcoor=ucoor(:,conn(:,iel));
    uelemcoorloop=[uelemcoor uelemcoor(:,1)];
    X=uelemcoorloop(1,:);
    Y=uelemcoorloop(2,:);
    line(X,Y,'color',[1 0 0])
end 
for inode=1:nnode
    text (coor(1,inode),coor(2,inode),sprintf('%3.0f',inode))
end