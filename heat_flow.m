% surface_heat_flow - heat flow at the surface. Units in mW/m/m.
% base_heat_flow -heat flow at the base. Units in mW/m/m.
% coef_therm_conductivity - coefficient of thermal conductivity.
% Units in W/m/K.
% temp_surface_c - temperature at the surface. Units in degrees Celsius.
% temp_base_c - temperature at the base. Units in degrees Celsius.
function [ ] = heat_flow (surface_heat_flow, base_heat_flow,...
coef_therm_conductivity, temp_surface_c, temp_base_c)
% Convert temperature values from degrees Celsius to Kelvin.
temp_surface_k = temp_surface_c + 273.15;
temp_base_k = temp_base_c + 273.15;
% Calculate the thickness of the layer (km) by substituting
% the volumetric heat
% production value from Equation (4.23) into Equation (4.17).
layer_thickness = (temp_base_k - temp_surface_k) /...
(surface_heat_flow / (2 * coef_therm_conductivity))
% Calculate the volumetric heat production (microwatts/ meter cubed) using
% Equation (4.22).
volum_heat_production = (surface_heat_flow + base_heat_flow) /...
layer_thickness