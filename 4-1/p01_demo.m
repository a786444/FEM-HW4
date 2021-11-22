
function [p,t] = p01_demo(iteration_max,h)
 rng('default');
 fd = @p01_fd;
 fh = @p01_fh;
 box = [-1,-1; 1,1];
 trac_point=[0,0.5;0.4755,0.1545;-0.4755,0.1545];
 bc=[0.5,0;-0.5,0;0,-0.5];
 fixed=[trac_point;bc];
 [p,t] = distmesh_2d(fd,fh,h,box,iteration_max,fixed);
 p = p.';
 t = t.';
end
