# Lithosphere Heat Flow and Geothermal Modeling Using Finite Volume Method

## Overview
This repository contains a collection of MATLAB codes designed for numerical modeling of lithosphere heat flow and geothermal systems using the Finite Volume Method (FVM). The codes are structured to solve heat transfer equations in a geophysical context, enabling researchers and engineers to model thermal processes within the Earth's lithosphere and evaluate geothermal potential.

## Features
- **Heat Flow Modeling**: Simulate conductive and convective heat transfer in the lithosphere.
- **Geothermal System Analysis**: Evaluate geothermal gradients and heat flux for energy potential.
- **Finite Volume Method (FVM)**: A robust numerical approach for solving partial differential equations (PDEs).
- **Customizable Parameters**: Define material properties, boundary conditions, and thermal source terms.
- **Visualization Tools**: Includes scripts for plotting temperature distribution and heat flow vectors.

## Prerequisites
- MATLAB (R2020b or later recommended)
- Basic knowledge of MATLAB and numerical modeling techniques

## Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/username/lithosphere-heat-flow.git
    cd lithosphere-heat-flow
    ```
2. Add the repository folder to your MATLAB path:
    ```matlab
    addpath(genpath('path_to_repository'))
    ```

## Code Structure
- **`main_heat_flow.m`**: Main script for lithosphere heat flow modeling.
- **`main_geothermal_model.m`**: Main script for geothermal system modeling.
- **`modules/`**: Contains reusable functions and subroutines for:
  - Mesh generation
  - Finite volume discretization
  - Solvers for heat transfer equations
  - Boundary condition handling
- **`examples/`**: Predefined example setups for various lithospheric and geothermal scenarios.
- **`output/`**: Scripts for visualizing results.

## Uploaded Files
### MATLAB Codes
- `LithoTemp.m`: Script for lithosphere temperature modeling.
- `heat_flow.m`: Script for heat flow calculations.

### Input Files
- `Solidus1_pollac1997.txt`: Solidus temperature data.
- `Solidus2_pollac1997.txt`: Additional solidus temperature data.
- `Solidus3_pollac1997.txt`: Further solidus temperature data.
- `T30.txt`, `T40.txt`, `T50.txt`, `T60.txt`, `T90.txt`: Temperature profile data.

### Output and Visualization
- `LithoTemp eps.eps`, `LithoTemp pdf.pdf`, `LithoTemp png.png`, `LithoTemp.jpg`: Visualization outputs for lithosphere temperature modeling.
- `geotherm.pdf`, `geotherm.png`: Geothermal modeling results.

### Reference Materials
- `Heat_Flow_from_the_Earths_Interior_Analysis_of_th.pdf`: Reference document on Earth's heat flow.
- `Pollackand chapman-1977- termal.pdf`: Classic study on thermal properties.
- `Rudnick_1998_CHEMGE.pdf`: Reference on lithosphere chemistry and geothermics.
- `Witteretal-cdp_heat flow.pdf`: Heat flow study by Witter et al.

### Figures and Examples
- `Pollack 1993.jpg`: Illustration from Pollack 1993.
- `eq.jpg`: Equation diagram.
- `test.pdf`: Example output.

## Usage
### Heat Flow Modeling
1. Set up model parameters in `input_parameters_heat_flow.m`:
    - Grid size, time step, and simulation duration
    - Material properties (thermal conductivity, heat capacity, density)
    - Boundary conditions (fixed temperature, heat flux, etc.)

2. Run the main script:
    ```matlab
    main_heat_flow
    ```

3. Outputs:
    - Temperature distribution over time
    - Heat flow vectors

### Geothermal System Modeling
1. Configure geothermal system parameters in `input_parameters_geothermal.m`:
    - Reservoir properties
    - Thermal source and sink terms
    - Fluid flow parameters (if applicable)

2. Run the main script:
    ```matlab
    main_geothermal_model
    ```

3. Outputs:
    - Geothermal gradients
    - Heat extraction potential

### Visualization
Use the provided visualization scripts to analyze results. For example:
```matlab
plot_temperature_distribution(results.temperature)
plot_heat_flow_vectors(results.heat_flux)
```

## Example
An example configuration is available in the `examples/` folder. To run an example:
1. Copy the example input file to the main directory.
2. Run the corresponding main script:
    ```matlab
    cp examples/input_example_heat_flow.m input_parameters_heat_flow.m
    main_heat_flow
    ```

## Customization
### Adding New Boundary Conditions
Modify the `apply_boundary_conditions.m` function in the `modules/` folder to implement custom boundary conditions.

### Adjusting Numerical Schemes
The `finite_volume_solver.m` script contains the FVM implementation. You can modify it to experiment with different numerical approaches or improve accuracy.

## Contributing
Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request with a detailed description of your changes.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact
For questions or issues, please contact:
- **Name**: Vahid Teknik
- **Email**: [vahid.teknik@gmail.com](mailto:vahid.teknik@gmail.com)

Happy modeling!

