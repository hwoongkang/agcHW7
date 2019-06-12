APlus = A;
AMinus = A;

APlus(3,1) = A(3,1) * 1.2;
AMinus(3,1) = A(3,1) *0.8;

AcPlus = {APlus - B * ans111.F * C_1;
	APlus - B * ans112.F * C_1;
	APlus - B * ans121.F * C_2;
	APlus - B * ans122.F * C_2;
	APlus - B * ans2.F};

AcMinus = {AMinus - B * ans111.F * C_1;
	AMinus - B * ans112.F * C_1;
	AMinus - B * ans121.F * C_2;
	AMinus - B * ans122.F * C_2;
	AMinus - B * ans2.F};

Ac = {A - B * ans111.F * C_1;
	A - B * ans112.F * C_1;
	A - B * ans121.F * C_2;
	A - B * ans122.F * C_2;
	A - B * ans2.F};
sysName = ["1-(1)", "1-(2)", "2-(1)", "2-(2)", "time-weighted"]
states = ["sideslip [deg]", "bank [deg]", "p [deg/s]", "r [deg/s]"];
figure;
for sysNum = 1:5
	[t,x] = simulate3(Ac{sysNum});
	[~,xPlus] = simulate3(AcPlus{sysNum});
	[~,xMinus] = simulate3(AcMinus{sysNum});
	delPlus = xPlus - x;
	delMinus = xMinus - x;
	for figNum = 1:4
		subplot(4,2,2*figNum-1)
		plot(t,delPlus(:,figNum),'LineWidth',2);hold on
		ylabel(states(figNum))
		grid on
		subplot(4,2,2*figNum)
		plot(t,delMinus(:,figNum),'LineWidth',2); hold on
		grid on
	end
end
subplot(4,2,2)
legend(sysName)
sgtitle("Perturbed System Errors")
subplot(4,2,1)
title("+20%")
subplot(4,2,2)
title("-20%")
