function plotProb1(ansIn)
figure;
subplot(2,1,1)
plot(ansIn.indexList)
ylabel("Performance Index")

subplot(2,1,2)
plot(ansIn.normList)
xlabel("Iteration Number")
ylabel("Gain Norm")

sgtitle("convergence check")
[row,col] = size(ansIn.F);
figure;
for i=1:row
	for j= 1:col
		subplot(row,col,i*col-col+j)
		plot(squeeze(ansIn.FList(i,j,:)))
	end
end
sgtitle("Elements of the Gain Matrix")
end