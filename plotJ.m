figure;
plot(-1:0.01:1,JPre*ones(size(-1:0.01:1)),'r')
hold on
for alpha = 0:0.005:1
F = FPre + alpha*delF;
Ac = A - B*F*C;
[~,eigVal] = eig(Ac,'vector');
if (max(real(eigVal))<0)
S = getS(Ac);
V = getV(Ac,F);
J = getJ(V);
plot(alpha,J,'ok')
xlim([-1,1])
drawnow
else
break
plot(alpha,0,'ok')
xlim([-1,1])
drawnow
end
end

% xlim([0,1.2*alpha]);