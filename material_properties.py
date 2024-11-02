from iapws import IAPWS97

# Define the temperature (in Kelvin) and pressure (in MPa)
T = 646.15  # Saturation temperature in Kelvin
P = 21.9    # Saturation pressure in MPa

# Calculate properties for saturated liquid (x = 0)
water_liquid = IAPWS97(T=T, P=P)
rho_liquid = water_liquid.rho      # Density [kg/m^3]
h_liquid = water_liquid.h          # Specific enthalpy [kJ/kg]
s_liquid = water_liquid.s          # Specific entropy [kJ/(kg K)]
cp_liquid = water_liquid.cp        # Specific heat capacity at constant pressure [kJ/(kg K)]
mu_liquid = water_liquid.mu        # Dynamic viscosity [Pa.s]
k_liquid = water_liquid.k          # Thermal conductivity [W/(m K)]

# Calculate properties for saturated vapor (x = 1)
water_vapor = IAPWS97(T=T, x=1)  # x=1 for saturated vapor
rho_vapor = water_vapor.rho       # Density [kg/m^3]
h_vapor = water_vapor.h           # Specific enthalpy [kJ/kg]
s_vapor = water_vapor.s           # Specific entropy [kJ/(kg K)]
cp_vapor = water_vapor.cp         # Specific heat capacity at constant pressure [kJ/(kg K)]
mu_vapor = water_vapor.mu         # Dynamic viscosity [Pa.s]
k_vapor = water_vapor.k           # Thermal conductivity [W/(m K)]

# Print results for Fluent input
print("Properties for Saturated Liquid (x=0):")
print(f"Density (rho): {rho_liquid} kg/m^3")
print(f"Specific Enthalpy (h): {h_liquid} kJ/kg")
print(f"Specific Entropy (s): {s_liquid} kJ/(kg K)")
print(f"Specific Heat Capacity (cp): {cp_liquid} kJ/(kg K)")
print(f"Dynamic Viscosity (mu): {mu_liquid} Pa.s")
print(f"Thermal Conductivity (k): {k_liquid} W/(m K)")

print("\nProperties for Saturated Vapor (x=1):")
print(f"Density (rho): {rho_vapor} kg/m^3")
print(f"Specific Enthalpy (h): {h_vapor} kJ/kg")
print(f"Specific Entropy (s): {s_vapor} kJ/(kg K)")
print(f"Specific Heat Capacity (cp): {cp_vapor} kJ/(kg K)")
print(f"Dynamic Viscosity (mu): {mu_vapor} Pa.s")
print(f"Thermal Conductivity (k): {k_vapor} W/(m K)")
