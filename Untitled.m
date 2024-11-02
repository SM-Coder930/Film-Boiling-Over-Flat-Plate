% Validation of Cess & Sparrow Problem - Plot for Equation (10) only
clc
close all
clear

% Parameters
Delta_T_sup = 100; % Wall superheat in K
Re_L = 1e4;        % Reynolds Number
L = 1;             % Length of plate in meters

% Liquid Properties
rho_l = 231;       % Density of liquid in kg/m^3
mu_l = 2.96e-5;    % Dynamic viscosity of liquid in Pa.s

% Vapor Properties
rho_v = 58;        % Density of vapor in kg/m^3
mu_v = 1.28e-5;    % Dynamic viscosity of vapor in Pa.s
Cp_v = 2300;       % Specific heat of vapor in J/(kg·K)

% Latent heat and Prandtl number
h_lg = 1600;       % Latent heat of vaporization in J/kg
Pr = 1;            % Prandtl number

% Calculate free stream velocity based on Re_L
U_inf = mu_l * Re_L / (rho_l * L);

% Define x vector (dimensionless x/L)
x = linspace(0, L, 100) / L; % Added number of points for smoothness

% Calculate local Reynolds number
re_x = rho_l * U_inf * x / mu_l;

% Equation (10) - Corrected Nusselt number correlation
Nu_10 = (1/2) * ((rho_l * mu_l) / (rho_v * mu_v))^0.5 * ...
          (Cp_v * Delta_T_sup / (h_lg * Pr)) * sqrt(re_x); 

% Calculate shear stress
tau_x = (1/2) * rho_l * U_inf^2 ./ (sqrt((rho_l * mu_l * Cp_v * Delta_T_sup) / (rho_v * mu_v * h_lg * Pr)) .* sqrt(re_x));


% Convert Nusselt number to heat transfer coefficient (in kW/m²K)
k_f = 0.68;  % Thermal conductivity of liquid in W/(m·K)
h_x_10 = (Nu_10 * k_f ./ x) / 1000; % Convert to kW/m²K

% Handle division by zero at x/L = 0
h_x_10(isinf(h_x_10)) = NaN;

% Plot results for heat transfer coefficient
figure;
plot(x, h_x_10, 'r--', 'LineWidth', 2);
xlabel('$\frac{x}{L}$', 'Interpreter', 'latex');
ylabel('Heat Transfer Coefficient, $h_x$ (kW/m$^2$K)', 'Interpreter', 'latex');
ylim([0 140]); % Set y-axis from 0 to 140 kW/m²K
legend('Approximated (Eq. 10)', 'Interpreter', 'latex');
title('Local Heat Transfer Coefficient $h_x$ vs. $\frac{x}{L}$ (Equation 10)', 'Interpreter', 'latex');
grid on;

% Plot results for shear stress
figure;
plot(x, tau_x, 'r--', 'LineWidth', 2);
xlabel('$\frac{x}{L}$', 'Interpreter', 'latex');
ylabel('Shear Stress, $\tau_x$ (Pa)', 'Interpreter', 'latex'); % Updated ylabel to Pa
ylim([0 40]); % Set y-axis limits from 0 to 40
legend('Approximated (Eq. 10, $\tau_x$)', 'Interpreter', 'latex'); % Updated legend
title('Local Shear Stress $\tau_x$ vs. $\frac{x}{L}$ (Equation 10)', 'Interpreter', 'latex'); % Updated title
grid on;
