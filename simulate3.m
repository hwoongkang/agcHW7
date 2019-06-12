function [t,x] = simulate(Ac)
global t_f x_0
dt = 0.005;
time = 0:dt:t_f;

[~,t,x] = initial(ss(Ac,[],[],[]),x_0,time);
end