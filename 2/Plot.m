function Plot(nelem,coor,conn,nnode,ndime,uglob)
 %infile=fopen('input.ipt.txt')
 %[ndime,nnode,nelem,nelnd,npres,ntrac,mate,coor,conn,pres,trac] = ReadInput(infile);
for iel=1:nelem
    elemcoor=coor(:,conn(:,iel));
    elemcoorloop=[elemcoor elemcoor(:,1)];
    X=elemcoorloop(1,:);
    Y=elemcoorloop(2,:);
    Z=elemcoorloop(3,:);
    line(X,Y,Z,'color',[0 1 0])
end
ucoor=[coor(1,:)+(uglob(1:ndime:ndime*nnode)*10)';coor(2,:)+(uglob(2:ndime:ndime*nnode)*50)';coor(3,:)+(uglob(3:ndime:ndime*nnode)*10)'];
for iel=1:nelem
    uelemcoor=ucoor(:,conn(:,iel));
    uelemcoorloop=[uelemcoor uelemcoor(:,1)];
    X=uelemcoorloop(1,:);
    Y=uelemcoorloop(2,:);
    Z=uelemcoorloop(3,:);
    line(X,Y,Z,'color',[1 0 0])
end 
% for inode=1:nnode
%     text (coor(1,inode),coor(2,inode),coor(3,inode),sprintf('%3.0f',inode))
% end