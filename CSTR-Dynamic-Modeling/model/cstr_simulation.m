function cstr_simulation()
% Simulation Time (0 se 10 minutes)
tspan = [0 10]; 

% Initial Conditions: [Initial Concentration (CA0), Initial Temperature (T0)]
% Shuruat mein reactor mein concentration 0.5 mol/L aur temp 350 K hai
x0 = [0.5; 350]; 

% System ko solve karna using ode45
[t, x] = ode45(@cstr_equations, tspan, x0);

% Results Plotting
figure;
subplot(2,1,1);
plot(t, x(:,1), 'b', 'LineWidth', 2);
grid on;
title('CSTR Concentration Profile');
xlabel('Time (min)');
ylabel('Concentration C_A (mol/L)');

subplot(2,1,2);
plot(t, x(:,2), 'r', 'LineWidth', 2);
grid on;
title('CSTR Temperature Profile');
xlabel('Time (min)');
ylabel('Temperature T (K)');
end

function dxdt = cstr_equations(t, x)
% State variables ko assign karna
CA = x(1); % Concentration of A
T  = x(2); % Temperature of Reactor

% Nominal Parameters (Standard values for CSTR)
F  = 100;     % Flow rate (L/min)
V  = 100;     % Reactor Volume (L)
CAf = 1.0;    % Feed Concentration (mol/L)
Tf  = 350;    % Feed Temperature (K)
Tc  = 300;    % Cooling Jacket Temperature (K) -> Manipulated Variable

% Kinetic and Thermodynamic Constants
k0 = 7.2e10;      % Pre-exponential factor (min^-1)
E_over_R = 8750;  % Activation Energy / Gas Constant (K)
deltaH = -5e4;    % Heat of Reaction (J/mol) - Negative matlab Exothermic
rho = 1000;       % Density (g/L)
Cp = 0.239;       % Specific Heat Capacity (J/g*K)
UA = 5e4;         % Heat Transfer Coefficient * Area (J/min*K)

% Arrhenius Rate Law calculation
k = k0 * exp(-E_over_R / T);

% Differential Equations (dCA/dt aur dT/dt)
dCAdt = (F/V)*(CAf - CA) - k*CA;
dTdt  = (F/V)*(Tf - T) + (-deltaH/(rho*Cp))*k*CA - (UA/(rho*Cp*V))*(T - Tc);

% Output derivative vector
dxdt = [dCAdt; dTdt];
end


%[appendix]{"version":"1.0"}
%---
