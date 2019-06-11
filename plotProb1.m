function [t,x] = plotProb1(C,ansIn,plotTitle)
figure;
subplot(2,1,1)
plot(ansIn.indexList)
ylabel("Performance Index")

subplot(2,1,2)
plot(ansIn.normList)
xlabel("Iteration Number")
ylabel("Gain Norm")

sgtitle("convergence check: "+plotTitle)
[row,col] = size(ansIn.F);
figure;
for i=1:row
	for j= 1:col
		subplot(row,col,i*col-col+j)
		plot(squeeze(ansIn.FList(i,j,:)))
	end
end
sgtitle("Elements of the Gain Matrix: "+plotTitle)

states = ["sideslip [deg]", "bank [deg]", "p [deg/s]", "r [deg/s]"];
figure;
[t,x] = simulate(C,ansIn.F);
for figNum = 1:size(x,2)
subplot(size(x,2),1,figNum)
plot(t,x(:,figNum),'k');grid on;
ylabel(states(figNum))
end
xlabel("time [s]")
sgtitle("Response: "+plotTitle)
end