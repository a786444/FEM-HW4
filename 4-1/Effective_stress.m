function effec_stress=Effective_stress(node_stress)
effec_stress=zeros(1,length(node_stress));
for i=1:length(node_stress)
    stress_tensor=[node_stress(1,i) node_stress(3,i);node_stress(3,i) node_stress(2,i)];
    [~,D]=eig(stress_tensor);
    principal_stress=diag(D);
    principal_stress=sort(principal_stress,'descend');
    effec_stress(i)=1/(2^0.5)*((principal_stress(1)-principal_stress(2))^2+(principal_stress(2)^2)+(principal_stress(1)^2))^0.5;
end
end
