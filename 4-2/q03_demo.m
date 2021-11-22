function [p,t] = q03_demo(iteration_max)
 rng('default');
 fd = @q03_fd;
 fh = @q03_fh;
 h = 0.2;
 box = [-1, -1, 0-1;2,3,3];
%  xend=21;
 %trac_nodes=[0 0 3;2 0 3;0 3 3;2 3 3];
% corner = [0 0 0;0 0 6; 0 4 0;0 4 6;21 0 6;21 0 0;21 4 6;21 4 0;];
%  neutral_axis=zeros(floor(xend/h),3);
%  neutral_axis(:,2)=2;
%  neutral_axis(:,3)=3;
%   for i=1:floor(xend/h)
%      neutral_axis(i,1)=h*i;
%   end
 fixed=[1,1.5,3];
 [p,t] = distmesh_3d(fd,fh,h,box,iteration_max,fixed);
 p = p.';
 t = t.';
end
