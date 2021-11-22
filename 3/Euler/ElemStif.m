function kel=ElemStif(conn,ndime,nelnd,coor,mate,iel)
kel=zeros(ndime*nelnd,ndime*nelnd);
xii=zeros(ndime,1);
%dxdxi=zeros(ndime,ndime);
%dNdx=zeros(nelnd,ndime);
M=numIntegPt(ndime,nelnd);
xi=IntegPt(ndime,nelnd,M);
w=IntegWt(ndime,nelnd,M);
for im=1:M
    for i = 1:ndime
        xii(i)=xi(i,im);
    end
    %N=ShpFunc(nelnd,ndime,xii);
    dNdxi=ShpFuncDeri(nelnd,ndime,xii);
    dxdxi=zeros(ndime,ndime);
    for i=1:ndime
        for j=1:ndime
            for a=1:nelnd
                dxdxi(i,j)=dxdxi(i,j)+dNdxi(a,j)*coor(i,conn(a,iel));
            end
        end
    end
    dxidx=inv(dxdxi);
    %J=det(dxidx);
    J=det(dxdxi);
    dNdx=zeros(nelnd,ndime);
    for a=1:nelnd
        for i=1:ndime
            for j=1:ndime
                dNdx(a,i)=dNdx(a,i)+dNdxi(a,j)*dxidx(j,i);
            end
        end
    end
    %cmat=MatStiff(ndime,mate);
    cmat=Mat_kai(ndime,mate);
    for a=1:nelnd
        for i=1:ndime
            for b=1:nelnd
                for k=1:ndime
                    ir=ndime*(a-1)+i;
                    ic=ndime*(b-1)+k;
                    for j=1:ndime
                        for l=1:ndime
                            id=Cindex(i,j);
                            jd=Cindex(k,l);
                            kel(ir,ic)=kel(ir,ic)+cmat(id,jd)*dNdx(b,l)*dNdx(a,j)*w(im)*abs(J);
                        end
                    end
                end
            end
        end
    end
end

end