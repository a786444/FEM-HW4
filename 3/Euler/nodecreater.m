function [coor,conn]=nodecreater(C)
line_nodes=4*C+1;
coor=zeros(line_nodes*5,2);
for i=1:5
    for j=1:line_nodes
        coor((i-1)*line_nodes+j,1)=(j-1)*5;
        coor((i-1)*line_nodes+j,2)=(i-1)*5;
    end
end
line_elem=line_nodes-1;
conn=zeros(line_elem*4,4);
for i=1:4
    for j=1:line_elem
        conn((i-1)*line_elem+j,1:4)=[i*line_nodes+j i*line_nodes+1+j (i-1)*line_nodes+1+j (i-1)*line_nodes+j];
    end
end
conn=conn';
coor=coor';
end