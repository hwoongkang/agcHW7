F0_11 = ans111.F0;

ans2 = p2fun(F0_11);

F2 = ans2.F;

[t2,x2] = simulate(eye(4),F2);
figure;
for i=1:4
	subplot(4,1,i)
	plot(t2,x2(:,i));
	hold on;
	plot(t2,x111(:,i));
	plot(t2,x112(:,i));
	plot(t2,x121(:,i));
	plot(t2,x122(:,i));
end
legend("2","1-11","1-12","1-21","1-22")