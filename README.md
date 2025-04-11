# PCA Analysis with Julia

This repository contains Julia code for performing Principal Component Analysis (PCA) on multiple datasets and visualizing the results. The code processes CSV files, applies PCA, and generates 2D and 3D scatter plots of the principal components.

## Requirements

To run the code, you need to have Julia installed on your system. Additionally, the following Julia packages are required:

- `MultivariateStats`
- `RDatasets`
- `Plots`
- `CSV`
- `DataFrames`
- `Statistics`

You can install these packages by running the following command in the Julia REPL:

```julia
import Pkg
Pkg.add(["MultivariateStats", "RDatasets", "Plots", "CSV", "DataFrames", "Statistics"])