close all;clear all;
%% The system
global A B
A = [	-0.117		0.0386	-0.000295	-0.996;
		0			0		1			0;
		-5.2		0		-1			0.249;
		1.54		0		-0.0042		-0.154];

B = [	0		0.02;
		0		0;
		-1.12	0.337;
		-0.032	-0.744];
 
% bank, roll rate, yaw rate
C_1 = [	0	1	0	0;
		0	0	1	0;
		0	0	0	1];

% roll rate, yaw rate
C_2 = [	0	0	1	0;
		0	0	0	1];

%% Simulation settings
global x_0 t_f
x_0 = [1	0.1	0.1	0.1].';

t_f = 60;

X_1 = x_0*x_0.';

X_2 = eye(length(x_0));

%% Problem 1
problem1

%% Problem 2
problem2
% 