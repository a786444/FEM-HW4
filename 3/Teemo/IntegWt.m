function w=IntegWt(ndime,nelnd,M)
    w=zeros(M,1);
if (ndime == 1)
   w(1) = 2;
elseif (ndime == 2)
    if (nelnd == 3) %2D 3 1
        w(1) = 1/2.;
    end
    if (nelnd == 6) %2D 3 2
        w(1) = -27/96;
        w(2) = 25/96;
        w(3) = 25/96;
        w(4) = 25/96;
    end
    if (nelnd == 4) %2D 4 1
        w(1) = 1; 
        w(2) = 1;
        w(3) = 1;
        w(4) = 1;
    end
    if (nelnd == 8) %2D 4 2
        a=0.308641974;
        b=0.493827159;
        c=0.790123455;
        w(1) = a;
        w(2) = b;
        w(3) = a;
        w(4) = b;
        w(5) = c;
        w(6) = b;
        w(7) = a;
        w(8) = b;
        w(9) = a;
    end
else
    if (nelnd == 4)% 3D 3 1
        w(1)=1/6;
    end
    if(nelnd == 10)%3D 3 2
        w(1)=1/24;
        w(1)=1/24;
        w(1)=1/24;
        w(1)=1/24;
    end
    if(nelnd == 8) %3D 4 1
        w(1)=1;
        w(2)=1;
        w(3)=1;
        w(4)=1;
        w(5)=1;
        w(6)=1;
        w(7)=1;
        w(8)=1;
    end  
   if(nelnd == 20) %3D 4 2
        a=0.171467763;
        b=0.274348421;
        c=0.438957474;
        d=0.702331959;
        w(1)=a;
        w(2)=b;
        w(3)=a;
        w(4)=b;
        w(5)=c;
        w(6)=b;
        w(7)=a;
        w(8)=b;
        w(9)=a;
        w(10)=b;
        w(11)=c;
        w(12)=b;
        w(13)=c;
        w(14)=d;
        w(15)=c;
        w(16)=b;
        w(17)=c;
        w(18)=b;
        w(19)=a;
        w(20)=b;
        w(21)=a;
        w(22)=b;
        w(23)=c;
        w(24)=b;
        w(25)=a;
        w(26)=b;
        w(27)=a;
   end
end
end