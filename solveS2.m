function Ss = solveS2(F,Ps,X)
global A B
Ac = A-B*F;
[row,col] = size(Ps(:,:,end));
Ss =zeros(row,col,3);

Ss(:,:,end) = lyap(Ac,X);

Ss(:,:,2) = lyap(Ac,2*Ss(:,:,end));

Ss(:,:,1) = lyap(Ac,Ss(:,:,2));


end