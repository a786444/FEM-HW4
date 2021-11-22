function cmat = Mat_2D(ndime,mate)
    emod = mate(2);
    nu = mate(3);
    if ndime == 1
        cmat = zeros(1,1);
    else
        cmat = zeros(6,6);
    end
    if(ndime == 2)
        if (mate(1) == 1)
            cmat(1,1) = emod/(1+nu)/(1-2*nu)*(1-nu);
            cmat(1,2) = emod/(1+nu)/(1-2*nu)*nu;
            cmat(2,1) = emod/(1+nu)/(1-2*nu)*nu;
            cmat(2,2) = emod/(1+nu)/(1-2*nu)*(1-nu);
            cmat(6,6) = emod/(1+nu)/(1-2*nu)*(1-2*nu)/2;
        else
            cmat(1,1) = emod/(1-nu*nu);
            cmat(1,2) = emod/(1-nu*nu)*nu;
            cmat(2,1) = emod/(1-nu*nu)*nu;
            cmat(2,2) = emod/(1-nu*nu);
            cmat(6,6) = emod/(1-nu*nu)*(1-nu)/2;
        end
    elseif ndime == 1
        cmat(1,1) = emod/(1+nu)/(1-2*nu)*(1-nu);
    else
        cmat(1,1) = emod/(1+nu)/(1-2*nu)*(1-nu);
        cmat(2,2) = emod/(1+nu)/(1-2*nu)*(1-nu);
        cmat(3,3) = emod/(1+nu)/(1-2*nu)*(1-nu);
        cmat(1,2) = emod/(1+nu)/(1-2*nu)*nu;
        cmat(1,3) = emod/(1+nu)/(1-2*nu)*nu;
        cmat(2,1) = emod/(1+nu)/(1-2*nu)*nu;
        cmat(2,3) = emod/(1+nu)/(1-2*nu)*nu;
        cmat(3,1) = emod/(1+nu)/(1-2*nu)*nu;
        cmat(3,2) = emod/(1+nu)/(1-2*nu)*nu;
        cmat(4,4) = emod/2/(1+nu);
        cmat(5,5) = emod/2/(1+nu);
        cmat(6,6) = emod/2/(1+nu);
    end
end
