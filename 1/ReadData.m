function [ntrac,mate,npres,pres,trac]=ReadData(filename)
data=textscan(fopen(filename),'%s');
ndime=str2double(data{1}{find((strcmp(data{1,1},'num-dim:'))==true)+1});
mate=zeros(3,1);
mate(1)=str2double(data{1}{find((strcmp(data{1,1},'b-plane-strain:'))==true)+1});
mate(2)=str2double(data{1}{find((strcmp(data{1,1},'young''s-modulus:'))==true)+1});
mate(3)=str2double(data{1}{find((strcmp(data{1,1},'poisson''s-ratio:'))==true)+1});
% nnode=str2double(data{1}{find((strcmp(data{1,1},'num-node:'))==true)+1});
% ind=find((strcmp(data{1,1},'nodal-coord:'))==true);
% coor=zeros(ndime,nnode);
% for i=1:nnode%4
%     for j=1:ndime%2
%         ind=ind+1;
%         coor(j,i)=str2double(data{1}{ind});
%     end
% end
% nelem=str2double(data{1}{find((strcmp(data{1,1},'num-elem:'))==true)+1});
% nelnd=str2double(data{1}{find((strcmp(data{1,1},'num-elem-node:'))==true)+1});
% conn=zeros(nelnd,nelem);
% ind=find((strcmp(data{1,1},'elem-conn:'))==true);
% for i=1:nelem
%     for j=1:nelnd
%      ind=ind+1;
%      conn(j,i)=str2double(data{1}{ind});
%     end
% end
 npres=str2double(data{1}{find((strcmp(data{1,1},'num-prescribed-disp:'))==true)+1});
 pres=zeros(4,npres);
ind=find((strcmp(data{1,1},'pres_coor_dof:'))==true);
for i=1:npres
    for j=1:4
     ind=ind+1;
     pres(j,i)=str2double(data{1}{ind});
    end
end
ntrac=str2double(data{1}{find((strcmp(data{1,1},'num-prescribed-load:'))==true)+1});
ind=find((strcmp(data{1,1},'trac_coor_dof_trac:'))==true);
trac=zeros(4,ntrac);
for i=1:ntrac*4
    ind=ind+1;
    trac(i)=str2double(data{1}{ind});
end
% trac_nodes=zeros(ndime,ntrac);
% for i=1:ntrac
%     trac_nodes(i)=find(p(1,:)==trac_coor(1,i) & p(2,:)==trac_coor(2,i));
% end
% trac_force=zeros(ndime*2,ntrac);
% ind=find((strcmp(data{1,1},'trac:'))==true);
% for i=1:ndime*ntrac
%     ind=ind+1;
%     trac_force(i)=str2double(data{1}{ind});
% end

%thickness=str2double(data{1}{find((strcmp(data{1,1},'thickness:'))==true)+1});