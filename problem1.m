Q = diag([1,50,0.01,1]);
R=eye(2);
titles = ["C_1, X_1", "C_1, X_2", "C_2, X_1", "C_2, X_2"];
% p1
ans111=p1fun(C_1,X_1);
[t,x111] = plotProb1(C_1,ans111,titles(1));
ans112=p1fun(C_1,X_2);
[~,x112] = plotProb1(C_1,ans112,titles(2));
% 
%%
ans121=p1fun(C_2,X_1);
[~,x121] = plotProb1(C_2, ans121, titles(3));
%%
ans122=p1fun(C_2,X_2);
[~,x122] = plotProb1(C_2, ans122, titles(4));
%%
states = ["sideslip [deg]", "bank [deg]", "p [deg/s]", "r [deg/s]"];
figure;
for figNum = 1:4
	subplot(4,1,figNum)
	plot(t,x111(:,figNum),'k');hold on
	plot(t,x112(:,figNum),'--k')
	plot(t,x121(:,figNum),'-.k')
	plot(t,x122(:,figNum),':k')
	ylabel(states(figNum))
end
sgtitle("comparison")
xlabel("time[s]")
subplot(4,1,1)
legend("C_1, X_1", "C_1, X_2", "C_2, X_1", "C_2, X_2")
