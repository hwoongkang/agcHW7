function plotProb1(ansIn)
figure;
subplot(2,1,1)
plot(ansIn.indexList)
subplot(2,1,2)
plot(ansIn.normList)
sgtitle(sprintf("%d iteration",ansIn.itNum))
end