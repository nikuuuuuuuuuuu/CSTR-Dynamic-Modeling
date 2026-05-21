% CSTR Simulink Model Initialization Script (init_cstr.m)
% --- Design Parameters ---
V   = 100;      % Reactor Volume (Liters)
F   = 100;      % Volumetric Flow Rate (L/min)
CAf = 1.0;     % Feed Concentration of Reactant A (mol/L)
Tf  = 350;      % Feed Temperature (Kelvin, K)

% --- Initial States (Time = 0 par value) ---
CA0 = 0.5;      % Initial Concentration (mol/L)
T0  = 350;      % Initial Reactor Temperature (K)

% --- Controller Inputs (Manipulated Variable Initial Value) ---
Tc  = 300;      % Coolant Jacket Temperature (K)

% --- Thermodynamic & Kinetic Constants ---
k0       = 7.2e10;  % Pre-exponential Arrhenius factor (min^-1)
E_over_R = 8750;    % Activation Energy / Gas Constant (K)
deltaH   = -5e4;    % Heat of Reaction (J/mol) -> Exothermic Reaction
rho      = 1000;    % Density of Reaction Fluid (g/L)
Cp       = 0.239;   % Specific Heat Capacity (J/g*K)
UA       = 5e4;     % Heat Transfer Area * Coefficient (J/min*K)

disp('CSTR Workspace Parameters Loaded Successfully!');
