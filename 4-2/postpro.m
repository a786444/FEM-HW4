function postpro(elemss,elemip,p,t,u,ndime,nnode)
     stress11=zeros(1,length(elemss));
     %effec_stress=Effective_stress(elemss);
    for i=1:length(elemss)
        stress11(i)=elemss(1,:,i);
    end
    ipx=zeros(1,length(elemip));
    ipy=zeros(1,length(elemip));
    ipz=zeros(1,length(elemip));
    for i=1:length(elemip)
        ipx(i)=elemip(1,:,i);
        ipy(i)=elemip(2,:,i);
        ipz(i)=elemip(3,:,i);
    end
     px=p(1,:); 
     py=p(2,:);
     pz=p(3,:);
    xq=zeros(length(px));
    yq=zeros(length(py));
    zq=zeros(length(pz));
    %[xq,yq,zq] = meshgrid(px,py,pz);
    rbfop=rbfcreate([ipx(:)'; ipy(:)'], effec_stress(:)','RBFFunction','multiquadric','Stats', 'on');
    rbfcheck(rbfop);
    %[X,Y] = meshgrid(-0.5:0.001:0.5);
    vqrbf = rbfinterp([xq(:)'; yq(:)'],rbfop);
    figure(2);
    mesh(xq,yq,reshape(vqrbf,size(xq) ));
    %title('Radial basis function (RBF) interpolation');
    %legend('Sample Points','Interpolated Surface','Location','NorthWest');
    hold on 
    plot3(ipx(:)',ipy(:)',stress11(:)','mo');
    %% find value
     N=size(xq,1);
     interp=zeros(3,N*N);
     reshape_stress=reshape(vqrbf,size(xq) );
     for i=1:N
         pop=[xq(:,i)';yq(:,i)';reshape_stress(:,i)'];
         interp(1:3,((i-1)*N+1):i*N)=pop;
     end
     node_stress=zeros(3,length(p));
     for i=1:length(p)
         extra=interp(1:3,interp(1,:)==p(1,i)&interp(2,:)==p(2,i));
         node_stress(1:3,i)=extra(:,1);
     end
     u_p=[p(1,:)+(u(1:ndime:2*nnode))';p(2,:)+(u(2:ndime:2*nnode))'];
     displacement=(u(1:ndime:2*nnode).^2+u(2:ndime:2*nnode).^2).^0.5;
     % writeVTK('HW4-1-displacement',t',u_p',node_stress(3,:)')
%       writeVTK('HW4-1-displacement',t',u_p',displacement)
%       writeVTK('HW4-1-origin',t',p',zeros(length(p),1))
end