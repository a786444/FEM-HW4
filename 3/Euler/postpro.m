function postpro(u,coor)
   %ux=u(1:2:length(u));
   uy=u(2:2:length(u));
   neutral_nodes=find(coor(2,:)==10);
   uy(neutral_nodes);
    un=uy(neutral_nodes);
   X=(0:5:(length(uy(neutral_nodes))-1)*5);
   plot(X,uy(neutral_nodes))
   hold on 
end