function J = solveJ2(Ps,X)
J=trace(Ps(:,:,end)*X)/2;
end