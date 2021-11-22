function [elemss,nodess,elemip,elemsn]=stress(ndime,nelnd,mate,nelem,coor,uglob,conn)
M = numIntegPt(ndime,nelnd);
cmat = Mat_kai(ndime,mate);
elemip = zeros(ndime,M,nelem);
xi=IntegPt(ndime,nelnd,M);
if(ndime == 2)
    elemsn = zeros(3,M,nelem);
    elemss = zeros(3,M,nelem);
else
    elemsn = zeros(6,M,nelem);
    elemss = zeros(6,M,nelem);
end
coorie = zeros(ndime,nelnd);
uglobie = zeros(ndime,nelnd);
xii = zeros(ndime,1);
N_element=zeros(nelnd,M);
%dxdxi = zeros(ndime,ndime);
%dNdx = zeros(nelnd,ndime);
%sn = zeros(ndime,ndime);
%ss = zeros(ndime,ndime);
for ie = 1:nelem
    for a = 1:nelnd
        for i = 1:ndime
            coorie(i,a) = coor(i,conn(a,ie));
        end
         for i = 1:ndime
            uglobie(i,a) = uglob(ndime*(conn(a,ie)-1)+i);
         end
    end
    for im = 1:M
        for i = 1:ndime
            xii(i) = xi(i,im);
        end
        N = ShpFunc(nelnd,ndime,xii);
        dNdxi = ShpFuncDeri(nelnd,ndime,xii);
        for i = 1:ndime
            for a = 1:nelnd
                elemip(i,im,ie) = elemip(i,im,ie) + coorie(i,a)*N(a);
            end
        end
        dxdxi = zeros(ndime,ndime);
        for i = 1:ndime
            for j = 1:ndime
                for a = 1:nelnd
                    dxdxi(i,j) = dxdxi(i,j)+coorie(i,a)*dNdxi(a,j);
                end
            end
        end
        dxidx = inv(dxdxi);
        dNdx = zeros(nelnd,ndime);
        for a = 1:nelnd
            for i = 1:ndime
                for j = 1:ndime
                    dNdx(a,i) = dNdx(a,i)+dNdxi(a,j)*dxidx(j,i);
                end
            end
        end
        sn = zeros(ndime,ndime);
        for i = 1:ndime
            for j = 1:ndime
                for a = 1:nelnd
                    sn(i,j) = sn(i,j)+0.5*(uglobie(i,a)*dNdx(a,j)+uglobie(j,a)*dNdx(a,i));
                end
            end
        end
        if(ndime == 2)
            elemsn(1,im,ie) = sn(1,1);
            elemsn(2,im,ie) = sn(2,2);
            elemsn(3,im,ie) = sn(1,2);
        else
            elemsn(1,im,ie) = sn(1,1);
            elemsn(2,im,ie) = sn(2,2);
            elemsn(3,im,ie) = sn(3,3);
            elemsn(4,im,ie) = sn(2,3);
            elemsn(5,im,ie) = sn(3,1);
            elemsn(6,im,ie) = sn(1,2);
        end
        ss = zeros(ndime,ndime);
        for i = 1:ndime
            for j = 1 : ndime
                for k = 1 : ndime
                    for l = 1: ndime
                        id=Cindex(i,j);
                        jd=Cindex(k,l);
                        ss(i,j) = ss(i,j)+cmat(id,jd)*sn(k,l);
                    end
                end
            end
        end
        if(ndime == 2)
            elemss(1,im,ie) = ss(1,1);
            elemss(2,im,ie) = ss(2,2);
            elemss(3,im,ie) = ss(1,2);
        else
            elemss(1,im,ie) = ss(1,1);
            elemss(2,im,ie) = ss(2,2);
            elemss(3,im,ie) = ss(3,3);
            elemss(4,im,ie) = ss(2,3);
            elemss(5,im,ie) = ss(3,1);
            elemss(6,im,ie) = ss(1,2);
        end
        N_element(:,im)=N;
    end
        nodess{ie,1}=elemss(:,:,ie)/N_element;
end
end