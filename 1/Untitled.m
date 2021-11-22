
function [p,t] = q03_demo(iteration_max)
 rng('default');
 fd = @q03_fd;
 fh = @q03_fh;
 h = 0.2;
 box = [0, 0, 0; 1, 1, 1];
 fixed = [0, 0, 0; 0, 0, 1; 0, 1, 0; 0, 1, 1; 1, 0, 0; 1, 0, 1; 1, 1, 0; 1, 1, 1];
 [p,t] = distmesh_3d(fd,fh,h,box,iteration_max,fixed);
 p = p.';
 t = t.';
end