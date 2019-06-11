function [t,x]= simulate(C,F)
global t_f x_0
dt = 0.005;
time = 0:dt:t_f;

global A B
sys = ss(A-B*F*C,[],[],[]);

[~,t,x] = initial(sys,x_0,time);

end