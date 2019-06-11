function output = p1fun(C,X)
global A B
Q = diag([1,50,0.01,1]);
R = eye(2);

%% ARE solution
[P,eigVal,K] = care(A,B,Q,R,[],[]);
if max(real(eigVal))>0
	error("ARE failed");
end
F = K*pinv(C);
Ac = A-B*F*C;

%% iteration settings
indexList = zeros(1,10000);
normList = zeros(1,10000);
FList = zeros(size(F,1),size(F,2),10000);
itNum = 1;
%% function handles
getS = @(Ac)solveS(Ac,X);
getV = @(Ac,F)solveV(Ac,C,F,Q,R);
getJ = @(V)evalJ(V,X);

%% initial values
S = getS(Ac);
V = getV(Ac,F);
J = getJ(V);

indexList(1) = J;
normList(1) = norm(F);

while (true)
	itNum = itNum +1;
	
	FPre = F;
	AcPre = A - B*FPre*C;
	SPre =S;
	VPre= V;
	
	JPre =J;
	
	delF = inv(R) * (B.'*V*S*C.') * inv(C*S*C.') -FPre;
	alpha = 1;
	while(true)
		F = FPre + alpha*delF;
		AcTemp = A - B*F*C;
		[~,eigVal] = eig(AcTemp,'vector');
		if max(real(eigVal))<0
			S = getS(AcTemp);
			V = getV(AcTemp,F);
			J = getJ(V);
			if J<JPre
				alpha
				break
			end
		end
		alpha = alpha/2;
		if alpha<1E-7
			error("failed")
		end
	end
	if alpha==0
		disp("failed")
	end
	indexList(itNum) = J;
	normList(itNum) = norm(F);
	FList(:,:,itNum) = F;
	if JPre - J< 1E-7
		J
		output.F = F;
		output.indexList = indexList(1:itNum);
		output.itNum = itNum;
		output.normList = normList(1:itNum);
		output.FList = FList(:,:,1:itNum);
		return
	end
	
end

end