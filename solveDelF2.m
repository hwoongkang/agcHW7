function delF = solveDelF2(B,Ps,Ss,C,R)

sum = zeros(size(B.',1),size(C.',2));
for ind = size(Ps,3)
	sum = sum + B.'*Ps(:,:,ind)*Ss(:,:,ind)*C.';
end
delF = inv(R) * sum * inv(C*Ss(:,:,end)*C.');

end