function output = p2fun(F0)
P = diag([1,50,.01,1]);
Q = P;
R = eye(2);

X = eye(4);
global A B
Ac = A-B*F0;
[~,eigVal] = eig(Ac, 'vector');
if max(real(eigVal))>0
	error("  ")
end
%% function handles
getP = @(F)solveP2(F,P,Q,R);
getS = @(F,Ps)solveS2(F,Ps,X);
getDelF = @(Ps,Ss)solveDelF2(B,Ps,Ss,eye(4),R);
getJ = @(Ps)solveJ2(Ps,X);
%% initial
F = F0;
Ps = getP(F0);
Ss = getS(F0,Ps);
% delF = getDelF(Ps,Ss);

J = getJ(Ps);
JList = zeros(1,1000);
it = 1;
JList(it) = J;
while(true)
	it = it+1;
	PsPre = Ps;
	SsPre = Ss;
	FPre = F;
	
	delF = getDelF(Ps,Ss) - F;
	JPre = J;
	
	alpha = 1;
	while(true)
		if alpha>1E-2
			alpha = alpha/2;
		else
			alpha = alpha*0.98;
		end
		if alpha<1E-7
			error("something wrong")
		end
		
		F = FPre + alpha * delF;
		
		Ac = A - B*F;
		[~,eigVal ] = eig(Ac,'vector');
		if max(real(eigVal))<0
			Ps = getP(F);
			J = getJ(Ps);
			if J<JPre
				alpha;
				Ss = getS(F,Ps);
				JList(it) =J;
				break
			end
		end
	end
	
	if JPre-J<1E-7
		disp("we are here")
		break
	end
end
output.F = F;
output.J=J;
output.JList = JList(1:it);
end