function [modk,modr]=ModMatrix(ndime,nnode,nelem,nelnd,npres,ntrac,mate,coor,conn,pres,trac)
kglob=GlobStiff(nelem,nnode,mate,coor,conn,nelnd,ndime);
rglob=GlobTrac(ndime,nnode,ntrac,trac);
for i=1:npres
    idof=ndime*(pres(1,i)-1)+pres(2,i);
    for ir=1:ndime*nnode
        rglob(ir)=rglob(ir)-kglob(ir,idof)*pres(3,i);
        kglob(ir,idof)=0;
    end
end
for i=1:npres
    idof=ndime*(pres(1,i)-1)+pres(2,i);
    kglob(idof,:)=0;
    kglob(idof,idof)=1;
    rglob(idof)=pres(3,i);
end
modk=kglob;
modr=rglob;
end