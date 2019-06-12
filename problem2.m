F0_11 = ans111.F0;

ans2 = p2fun(F0_11)

F2 = ans2.F;

[t2,x2] = simulate(eye(4),F2);
states = ["sideslip [deg]", "bank [deg]", "p [deg/s]", "r [deg/s]"];
figure;
for i=1:4
	subplot(4,1,i)
	plot(t2,x2(:,i),'k',"LineWidth",2);
	hold on;
	plot(t2,x111(:,i),'--k');
	plot(t2,x112(:,i),':k');
	plot(t2,x121(:,i),'-.k');
	xlim([0,5]);
	ylabel(states(i))
	grid on
% 	plot(t2,x122(:,i));
end
xlabel("time[s]")
subplot(4,1,1)
legend("Prob. 2","1-(1)", "1-(2)", "2-(1)")

sgtitle("Time-weighted LQR")