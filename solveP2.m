function Ps = solveP2(F,P,Q,R)
global A B
Ac = A-B*F;
[row,col] = size(P);
Ps = zeros(row,col,3);

Ps(:,:,1) = lyap(Ac.',P);

Ps(:,:,2) = lyap(Ac.',Ps(:,:,1));

Ps(:,:,3) = lyap(Ac.',2*Ps(:,:,2)+Q+F.'*R*F);

end