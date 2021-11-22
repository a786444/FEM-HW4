
function [p,t] = p01_demo(iteration_max,h)
 rng('default');
 fd = @p01_fd;
 fh = @p01_fh;
 box = [-10.0,-20.0; 60.0,10.0];
 xend=60;
 trac_nodes=[0,0];
 corner = [0 0 0;0 0 6; 0 4 0;0 4 6;21 0 6;21 0 0;21 4 6;24 4 0];
 neutral_axis=zeros(floor(xend/h),3);
 neutral_axis(:,2)=2;
 neutral_axis(:,3)=3;

 fixed = [0 10;0 -10; 60 10;60 -10 ];
 [p,t] = distmesh_2d(fd,fh,h,box,iteration_max,fixed);
 p = p.';
 t = t.';
end
