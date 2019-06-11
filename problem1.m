Q = diag([100,50,0.01,1]);
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