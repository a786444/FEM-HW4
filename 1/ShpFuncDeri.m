function dNdxi=ShpFuncDeri(nelnd,ndime,xii)
 dNdxi=zeros(nelnd,ndime);
 if (ndime == 1)
    dNdxi(1,1) = 0.5;
    dNdxi(2,1) = -0.5;
 elseif (ndime == 2)
    if (nelnd == 3)
        dNdxi(1,1) = 1;
        dNdxi(2,2) = 1;
        dNdxi(3,1) = -1;
        dNdxi(3,2) = -1;
    end
    if (nelnd == 6)
        dNdxi(1,1) = 4*xii(1)-1;
        dNdxi(2,2) = 4*xii(2)-1;
        dNdxi(3,1) = -(4*(1-xii(1)-xii(2))-1);
        dNdxi(3,2) = -(4*(1-xii(1)-xii(2))-1);
        dNdxi(4,1) = 4*xii(2);
        dNdxi(4,2) = 4*xii(1);
        dNdxi(5,1) = -4*xii(2);
        dNdxi(5,2) = -4*xii(1);
        dNdxi(6,1) = 4*(1-xii(1)-xii(2))-4*xii(1);
        dNdxi(6,2) = 4*(1-xii(1)-xii(2))-4*xii(2);
    end
    if (nelnd == 4)
        dNdxi(1,1) = -0.25*(1-xii(2));
        dNdxi(1,2) = -0.25*(1-xii(1));
        dNdxi(2,1) = 0.25*(1-xii(2));
        dNdxi(2,2) = -0.25*(1+xii(1));
        dNdxi(3,1) = 0.25*(1+xii(2));
        dNdxi(3,2) = 0.25*(1+xii(1));
        dNdxi(4,1) = -0.25*(1+xii(2));
        dNdxi(4,2) = 0.25*(1-xii(1));
    end
    if (nelnd == 8)
        dNdxi(1,1) = 0.25*(1-xii(2))*(2*xii(1)+xii(2));
        dNdxi(1,2) = 0.25*(1-xii(1))*(xii(1)+2*xii(2));
        dNdxi(2,1) = 0.25*(1-xii(2))*(2*xii(1)-xii(2));
        dNdxi(2,2) = 0.25*(1+xii(1))*(2*xii(2)-xii(1));
        dNdxi(3,1) = 0.25*(1+xii(2))*(2*xii(1)+xii(2));
        dNdxi(3,2) = 0.25*(1+xii(1))*(2*xii(2)+xii(1));
        dNdxi(4,1) = 0.25*(1+xii(2))*(2*xii(1)-xii(2));
        dNdxi(4,2) = 0.25*(1-xii(1))*(2*xii(2)-xii(1));
        dNdxi(5,1) = -xii(1)*(1-xii(2));
        dNdxi(5,2) = -0.5*(1-xii(1)*xii(1));
        dNdxi(6,1) = 0.5*(1-xii(2)*xii(2));
        dNdxi(6,2) = -(1+xii(1))*xii(2);
        dNdxi(7,1) = -xii(1)*(1+xii(2));
        dNdxi(7,2) = 0.5*(1-xii(1)*xii(1));
        dNdxi(8,1) = -0.5*(1-xii(2)*xii(2));
        dNdxi(8,2) = -(1-xii(1))*xii(2);
    end
 elseif (ndime == 3)
    if (nelnd == 4) %3D 3 1
        dNdxi(1,1)=1;
        dNdxi(2,2)=1;
        dNdxi(3,3)=1;
        dNdxi(4,1)=-1;
        dNdxi(4,2)=-1;
        dNdxi(4,3)=-1;
    end
    if (nelnd == 10)% 3D 3 2 %還沒改
        dNdxi(1,1)=4*xii(1)-1;
        dNdxi(2,2)=4*xii(2)-1;
        dNdxi(3,3)=4*xii(3)-1;
        dNdxi(4,1)=4*xii(1)+4*xii(2)+4*xii(3)-3;
        dNdxi(4,2)=4*xii(1)+4*xii(2)+4*xii(3)-3;
        dNdxi(4,3)=4*xii(1)+4*xii(2)+4*xii(3)-3;
        dNdxi(5,1)=4*xii(2);
        dNdxi(5,2)=4*xii(1);
        dNdxi(6,2)=4*xii(3);
        dNdxi(6,3)=4*xii(2);
        dNdxi(7,1)=4*xii(3);
        dNdxi(7,3)=4*xii(1);
        dNdxi(8,1)=4*xii(4);
        dNdxi(8,4)=4*xii(1);
%           dNdxi(1,1) = 4*xii(1)-1;
%           dNdxi(2,2) = 4*xii(2)-1;
%           dNdxi(3,3) = 4*xii(3)-1;
%           dNdxi(4,4) = 4*xii(4)-1;
%           dNdxi(5,1) = 4*xii(2);
%           dNdxi(5,2) = 4*xii(1);
%           dNdxi(6,2) = 4*xii(3);
%           dNdxi(6,3) = 4*xii(2);
%           dNdxi(7,1) = 4*xii(3);
%           dNdxi(7,3) = 4*xii(1);
%           dNdxi(8,1) = 4*xii(4);
%           dNdxi(8,4) = 4*xii(1);
%           dNdxi(9,2) = 4*xii(4);
%           dNdxi(9,4) = 4*xii(2);
%           dNdxi(10,3) = 4*xii(4);
%           dNdxi(10,4) = 4*xii(3);
    end
    if (nelnd == 8)%3D 4 1
        dNdxi(1,1)=-0.125*(1-xii(2))*(1-xii(3));
        dNdxi(1,2)=-0.125*(1-xii(1))*(1-xii(3));
        dNdxi(1,3)=-0.125*(1-xii(1))*(1-xii(2));
        dNdxi(2,1)=0.125*(1-xii(2))*(1-xii(3));
        dNdxi(2,2)=-0.125*(1+xii(1))*(1-xii(3));
        dNdxi(2,3)=-0.125*(1+xii(1))*(1-xii(2));
        dNdxi(3,1)=0.125*(1+xii(2))*(1-xii(3));
        dNdxi(3,2)=0.125*(1+xii(1))*(1-xii(3));
        dNdxi(3,3)=-0.125*(1+xii(2))*(1+xii(1));
        dNdxi(4,1)=-0.125*(1+xii(2))*(1-xii(3));
        dNdxi(4,2)=0.125*(1-xii(1))*(1-xii(3));
        dNdxi(4,3)=-0.125*(1-xii(1))*(1+xii(2));
        dNdxi(5,1)=-0.125*(1-xii(2))*(1+xii(3));
        dNdxi(5,2)=-0.125*(1-xii(1))*(1+xii(3));
        dNdxi(5,3)=0.125*(1-xii(1))*(1-xii(2));
        dNdxi(6,1)=0.125*(1-xii(2))*(1+xii(3));
        dNdxi(6,2)=-0.125*(1+xii(1))*(1+xii(3));
        dNdxi(6,3)=0.125*(1-xii(2))*(1+xii(1));
        dNdxi(7,1)=0.125*(1+xii(2))*(1+xii(3));
        dNdxi(7,2)=0.125*(1+xii(1))*(1+xii(3));
        dNdxi(7,3)=0.125*(1+xii(1))*(1+xii(2));
        dNdxi(8,1)=-0.125*(1+xii(2))*(1+xii(3));
        dNdxi(8,2)=0.125*(1-xii(1))*(1+xii(3));
        dNdxi(8,3)=0.125*(1-xii(1))*(1+xii(2));
    end
    if (nelnd == 20)
        dNdxi(1,1)=0.125*((-1)*(1-xii(2))*(1-xii(3))*(-xii(1)-xii(2)-xii(3)-2)+(1-xii(1))*(1-xii(2))*(1-xii(3))*(-1));
        dNdxi(1,2)=0.125*((-1)*(1-xii(1))*(1-xii(3))*(-xii(1)-xii(2)-xii(3)-2)+(1-xii(1))*(1-xii(2))*(1-xii(3))*(-1));
        dNdxi(1,3)=0.125*((-1)*(1-xii(2))*(1-xii(1))*(-xii(1)-xii(2)-xii(3)-2)+(1-xii(1))*(1-xii(2))*(1-xii(3))*(-1));
        dNdxi(2,1)=0.125*((1)*(1-xii(2))*(1-xii(3))*(xii(1)-xii(2)-xii(3)-2)+(1+xii(1))*(1-xii(2))*(1-xii(3))*(1));
        dNdxi(2,2)=0.125*((-1)*(1+xii(1))*(1-xii(3))*(xii(1)-xii(2)-xii(3)-2)+(1+xii(1))*(1-xii(2))*(1-xii(3))*(-1));
        dNdxi(2,3)=0.125*((-1)*(1+xii(1))*(1-xii(2))*(xii(1)-xii(2)-xii(3)-2)+(1+xii(1))*(1-xii(2))*(1-xii(3))*(-1));
        dNdxi(3,1)=0.125*((1)*(1+xii(2))*(1-xii(3))*(xii(1)+xii(2)-xii(3)-2)+(1+xii(1))*(1+xii(2))*(1-xii(3))*(1));
        dNdxi(3,2)=0.125*((1)*(1+xii(1))*(1-xii(3))*(xii(1)+xii(2)-xii(3)-2)+(1+xii(1))*(1+xii(2))*(1-xii(3))*(1));
        dNdxi(3,3)=0.125*((-1)*(1+xii(2))*(1+xii(1))*(xii(1)+xii(2)-xii(3)-2)+(1+xii(1))*(1+xii(2))*(1-xii(3))*(-1));
        dNdxi(4,1)=0.125*((-1)*(1+xii(2))*(1-xii(3))*(-xii(1)+xii(2)-xii(3)-2)+(1-xii(1))*(1+xii(2))*(1-xii(3))*(-1));
        dNdxi(4,2)=0.125*((1)*(1-xii(1))*(1-xii(3))*(-xii(1)+xii(2)-xii(3)-2)+(1-xii(1))*(1+xii(2))*(1-xii(3))*(1));
        dNdxi(4,3)=0.125*((-1)*(1+xii(2))*(1-xii(1))*(-xii(1)+xii(2)-xii(3)-2)+(1-xii(1))*(1+xii(2))*(1-xii(3))*(-1));
        dNdxi(5,1)=0.125*((-1)*(1-xii(2))*(1+xii(3))*(-xii(1)-xii(2)+xii(3)-2)+(1-xii(1))*(1-xii(2))*(1+xii(3))*(-1));
        dNdxi(5,2)=0.125*((-1)*(1-xii(1))*(1+xii(3))*(-xii(1)-xii(2)+xii(3)-2)+(1-xii(1))*(1-xii(2))*(1+xii(3))*(-1));
        dNdxi(5,3)=0.125*((1)*(1-xii(2))*(1-xii(1))*(-xii(1)-xii(2)+xii(3)-2)+(1-xii(1))*(1-xii(2))*(1+xii(3))*(1));
        dNdxi(6,1)=0.125*((1)*(1-xii(2))*(1+xii(3))*(xii(1)-xii(2)+xii(3)-2)+(1+xii(1))*(1-xii(2))*(1+xii(3))*(1));
        dNdxi(6,2)=0.125*((-1)*(1+xii(1))*(1+xii(3))*(xii(1)-xii(2)+xii(3)-2)+(1+xii(1))*(1-xii(2))*(1+xii(3))*(-1));
        dNdxi(6,3)=0.125*((1)*(1-xii(2))*(1+xii(1))*(xii(1)-xii(2)+xii(3)-2)+(1+xii(1))*(1-xii(2))*(1+xii(3))*(1));
        dNdxi(7,1)=0.125*((1)*(1+xii(2))*(1+xii(3))*(xii(1)+xii(2)+xii(3)-2)+(1+xii(1))*(1+xii(2))*(1+xii(3))*(1));
        dNdxi(7,2)=0.125*((1)*(1+xii(1))*(1+xii(3))*(xii(1)+xii(2)+xii(3)-2)+(1+xii(1))*(1+xii(2))*(1+xii(3))*(1));
        dNdxi(7,3)=0.125*((1)*(1+xii(2))*(1+xii(1))*(xii(1)+xii(2)+xii(3)-2)+(1+xii(1))*(1+xii(2))*(1+xii(3))*(1));
        dNdxi(8,1)=0.125*((-1)*(1+xii(2))*(1+xii(3))*(-xii(1)+xii(2)+xii(3)-2)+(1-xii(1))*(1+xii(2))*(1+xii(3))*(-1));
        dNdxi(8,2)=0.125*((1)*(1-xii(1))*(1+xii(3))*(-xii(1)+xii(2)+xii(3)-2)+(1-xii(1))*(1+xii(2))*(1+xii(3))*(1));
        dNdxi(8,3)=0.125*((1)*(1+xii(2))*(1-xii(1))*(-xii(1)+xii(2)+xii(3)-2)+(1-xii(1))*(1+xii(2))*(1+xii(3))*(1));
        dNdxi(9,1)=0.25*(-2*xii(1))*(1-xii(2))*(1-xii(3));
        dNdxi(9,2)=0.25*(1-xii(1)*xii(1))*(-1)*(1-xii(3));
        dNdxi(9,3)=0.25*(1-xii(1)*xii(1))*(1-xii(2))*(-1);
        dNdxi(10,1)=0.25*(1)*(1-xii(2)*xii(2))*(1-xii(3));
        dNdxi(10,2)=0.25*(1+xii(1))*(-2*xii(2))*(1-xii(3));
        dNdxi(10,3)=0.25*(1+xii(1))*(1-xii(2)*xii(2))*(-1);
        dNdxi(11,1)=0.25*(-2*xii(1))*(1+xii(2))*(1-xii(3));
        dNdxi(11,2)=0.25*(1-xii(1)*xii(1))*(1)*(1+xii(3));
        dNdxi(11,3)=0.25*(1-xii(1)*xii(1))*(1+xii(2))*(-1);
        dNdxi(12,1)=0.25*(-1)*(1-xii(2)*xii(2))*(1-xii(3));
        dNdxi(12,2)=0.25*(1-xii(1))*(-2*xii(2))*(1-xii(3));
        dNdxi(12,3)=0.25*(1-xii(1))*(1-xii(2)*xii(2))*(-1);
        dNdxi(13,1)=0.25*(-2*xii(1))*(1-xii(2))*(1+xii(3));
        dNdxi(13,2)=0.25*(1-xii(1)*xii(1))*(-1)*(1+xii(3));
        dNdxi(13,3)=0.25*(1-xii(1)*xii(1))*(1-xii(2))*(1);
        dNdxi(14,1)=0.25*(1)*(1-xii(2)*xii(2))*(1+xii(3));
        dNdxi(14,2)=0.25*(1+xii(1))*(-2*xii(2))*(1+xii(3));
        dNdxi(14,3)=0.25*(1+xii(1))*(1-xii(2)*xii(2))*(1);
        dNdxi(15,1)=0.25*(-2*xii(1))*(1+xii(2))*(1+xii(3));
        dNdxi(15,2)=0.25*(1-xii(1)*xii(1))*(1)*(1+xii(3));
        dNdxi(15,3)=0.25*(1-xii(1)*xii(1))*(1+xii(2))*(1);
        dNdxi(16,1)=0.25*(-1)*(1-xii(2)*xii(2))*(1+xii(3));
        dNdxi(16,2)=0.25*(1-xii(1))*(-2*xii(2))*(1+xii(3));
        dNdxi(16,3)=0.25*(1-xii(1))*(1-xii(2)*xii(2))*(1);
        dNdxi(17,1)=0.25*(-1)*(1-xii(2))*(1-xii(3)*xii(3));
        dNdxi(17,2)=0.25*(1-xii(1))*(-1)*(1-xii(3)*xii(3));
        dNdxi(17,3)=0.25*(1-xii(1))*(1-xii(2))*(-2*xii(3));
        dNdxi(18,1)=0.25*(1)*(1-xii(2))*(1-xii(3)*xii(3));
        dNdxi(18,2)=0.25*(1+xii(1))*(-1)*(1-xii(3)*xii(3));
        dNdxi(18,3)=0.25*(1+xii(1))*(1-xii(2))*(-2*xii(3));
        dNdxi(19,1)=0.25*(1)*(1+xii(2))*(1-xii(3)*xii(3));
        dNdxi(19,2)=0.25*(1+xii(1))*(1)*(1-xii(3)*xii(3));
        dNdxi(19,3)=0.25*(1+xii(1))*(1+xii(2))*(-2*xii(3));
        dNdxi(20,1)=0.25*(-1)*(1+xii(2))*(1-xii(3)*xii(3));
        dNdxi(20,2)=0.25*(1-xii(1))*(1)*(1-xii(3)*xii(3));
        dNdxi(20,3)=0.25*(1-xii(1))*(1+xii(2))*(-2*xii(3));
    end
 end
end
