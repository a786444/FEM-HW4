function cmat=MatStiff(ndime,mate)
 emod = mate(2);
 nu = mate(3);
 cmat = zeros(ndime,ndime,ndime,ndime);
 if(ndime == 2)
    if (mate(1) == 1)
        cmat(1,1,1,1) = emod/(1+nu)/(1-2*nu)*(1-nu);
        cmat(1,1,2,2) = emod/(1+nu)/(1-2*nu)*nu;
        cmat(2,2,1,1) = emod/(1+nu)/(1-2*nu)*nu;
        cmat(2,2,2,2) = emod/(1+nu)/(1-2*nu)*(1-nu);
        cmat(1,2,1,2) = emod/(1+nu)/(1-2*nu)*(1-2*nu)/2;
    else
        cmat(1,1,1,1) = emod/(1-nu*nu);
        cmat(1,1,2,2) = emod/(1-nu*nu)*nu;
        cmat(2,2,1,1) = emod/(1-nu*nu)*nu;
        cmat(2,2,2,2) = emod/(1-nu*nu);
        cmat(1,2,1,2) = emod/(1-nu*nu)*(1-nu)/2;
%         cmat(1,2,2,1) = emod/(1-nu*nu)*(1-nu)/2;
%         cmat(2,1,1,2) = emod/(1-nu*nu)*(1-nu)/2;
%         cmat(2,1,2,1) = emod/(1-nu*nu)*(1-nu)/2;
    end
 else
    cmat(1,1,1,1) = emod/(1+nu)/(1-2*nu)*(1-nu);
    cmat(2,2,2,2) = emod/(1+nu)/(1-2*nu)*(1-nu);
    cmat(3,3,3,3) = emod/(1+nu)/(1-2*nu)*(1-nu);
    cmat(1,1,2,2) = emod/(1+nu)/(1-2*nu)*nu;
    cmat(1,1,3,3) = emod/(1+nu)/(1-2*nu)*nu;
    cmat(2,2,1,1) = emod/(1+nu)/(1-2*nu)*nu;
    cmat(2,2,3,3) = emod/(1+nu)/(1-2*nu)*nu;
    cmat(3,3,1,1) = emod/(1+nu)/(1-2*nu)*nu;
    cmat(3,3,2,2) = emod/(1+nu)/(1-2*nu)*nu;
    cmat(2,3,2,3) = emod/2/(1+nu);
    cmat(1,3,1,3) = emod/2/(1+nu);
    cmat(1,2,1,2) = emod/2/(1+nu);
 end
end


