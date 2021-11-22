function cmat = Mat_kai(ndime,mate)
    % 本函式由同學R10522636黃暄文提供,將4階矩陣轉換為2階
    Emod = mate(2);
    nu = mate(3);
    mu = Emod/(2*(1+nu));
    lumda = Emod*nu/(1+nu)/(1-2*nu);
    if ndime == 1
        cmat = zeros(1,1);
    else
        cmat = zeros(6,6);
    end
    if(ndime == 2)
        if (mate(1) == 1)
            cmat(1,1) = Emod/(1+nu)/(1-2*nu)*(1-nu);
            cmat(1,2) = Emod/(1+nu)/(1-2*nu)*nu;
            cmat(2,1) = Emod/(1+nu)/(1-2*nu)*nu;
            cmat(2,2) = Emod/(1+nu)/(1-2*nu)*(1-nu);
            cmat(6,6) = Emod/(1+nu)/(1-2*nu)*(1-2*nu)/2;
        else
            cmat(1,1) = Emod/(1-nu*nu);
            cmat(1,2) = Emod/(1-nu*nu)*nu;
            cmat(2,1) = Emod/(1-nu*nu)*nu;
            cmat(2,2) = Emod/(1-nu*nu);
            cmat(6,6) = Emod/(1-nu*nu)*(1-nu)/2;
        end
    elseif ndime == 1
        cmat(1,1) = Emod/(1+nu)/(1-2*nu)*(1-nu);
    else
        cmat(1,1) = lumda+2*mu;
        cmat(2,2) = lumda+2*mu;
        cmat(3,3) = lumda+2*mu;
        cmat(1,2) = lumda;
        cmat(1,3) = lumda;
        cmat(2,1) = lumda;
        cmat(2,3) = lumda;
        cmat(3,1) = lumda;
        cmat(3,2) = lumda;
        cmat(4,4) = mu;
        cmat(5,5) = mu;
        cmat(6,6) = mu;
    end
end
