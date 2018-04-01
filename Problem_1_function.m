function dYdt = Problem_1_function(t,Y,Kc)
% Unpack vector of state variables
%
Fout = Y(1);
L = Y(2);

%
% Define constants for our problem
%
A = 0.3; %m^2
rho = 1000; %kg/m^3
tau_v = 5; %s
Lsp = 3;
Fbar = 1;
if t < 10
    Fin = 1 + 0.5*sin(pi*t/10);
elseif t >= 10
    Fin = 1;
end 
Fspec = Fbar + Kc*(Lsp - L);
%
% Defining our functions
%
dFoutdt=1/tau_v*(Fspec - Fout);
dLdt = 1/(rho*A)*(Fin-Fout);
dYdt = [dFoutdt; dLdt];