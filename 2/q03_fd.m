function d = q03_fd(p)
 t=0.1;
 %% whole
 whole= -min(...
 min(...
 min(...
 min(...
 min(p(:,3)-0.0,3.0-p(:,3)),...
 p(:,2)-0.0),...
 3.0-p(:,2)),...
 p(:,1)-0.0),...
 2.0-p(:,1));
 %% part1
 g1= -min(...
 min(...
 min(...
 min(...
 min(p(:,3)-0.0,((3-t)/2)-p(:,3)),...
 p(:,2)+1.0),...
 4.0-p(:,2)),...
 p(:,1)+1.0),...
 (2-t)-p(:,1));
 g2= -min(...
 min(...
 min(...
 min(...
 min(p(:,3)-0.0,(t)-p(:,3)),...
 p(:,2)+1.0),...
 4.0-p(:,2)),...
 p(:,1)+1.0),...
 (2-t)-p(:,1));
 part1=ddiff(g1,g2);
 %% part 2
 p1=pshift(p,-t,0);
 g1= -min(...
 min(...
 min(...
 min(...
 min(p1(:,3)-0.0,(3-t)-p1(:,3)),...
 p1(:,2)+1.0),...
 4.0-p1(:,2)),...
 p1(:,1)+0.0),...
 (2-t+1)-p1(:,1));
 g2= -min(...
 min(...
 min(...
 min(...
 min(p1(:,3)-0.0,((3+t)/2)-p1(:,3)),...
 p1(:,2)-0.0),...
 3.0-p1(:,2)),...
 p1(:,1)-0.0),...
 (2-t)-p1(:,1));
 part2=ddiff(g1,g2);
 d=ddiff(ddiff(whole,part1),part2);

end