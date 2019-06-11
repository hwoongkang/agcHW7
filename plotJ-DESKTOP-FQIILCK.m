function plotJ()
figure;
hold on
for alpha = alphaMin:dAlpha:alphaMax
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
plot(alpha,0,'ok')
xlim([-1,1])
drawnow
end
end
end