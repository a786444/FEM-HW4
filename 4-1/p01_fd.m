function d = p01_fd(p)
% c1=dcircle(p,0,0,0.5);
% c2=dcircle(p,0,0,0.45);
% r1=drectangle(p,-0.025,0.025,0,0.5);
% r2=drectangle(protate(p,2*pi/5*1),-0.025,0.025,0,0.5);
% r3=drectangle(protate(p,2*pi/5*2),-0.025,0.025,0,0.5);
% r4=drectangle(protate(p,2*pi/5*3),-0.025,0.025,0,0.5);
% r5=drectangle(protate(p,2*pi/5*4),-0.025,0.025,0,0.5);
% c3=dcircle(p,0,0,0.125);
% d=dunion(dunion(dunion(dunion(dunion(dunion(ddiff(c1,c2),r1),r2),r3),r4),r5),c3);
c1=dcircle(p,0,0,0.5);
c2=dcircle(p,0,0,0.4);
r1=drectangle(p,-0.05,0.05,0,0.47);
r2=drectangle(protate(p,2*pi/5*1),-0.05,0.05,0,0.47);
r3=drectangle(protate(p,2*pi/5*2),-0.05,0.05,0,0.47);
r4=drectangle(protate(p,2*pi/5*3),-0.05,0.05,0,0.47);
r5=drectangle(protate(p,2*pi/5*4),-0.05,0.05,0,0.47);
c3=dcircle(p,0,0,0.125);
d=dunion(dunion(dunion(dunion(dunion(dunion(ddiff(c1,c2),c3),r1),r2),r3),r4),r5);
end
