import Pkg
# Pkg.add("MultivariateStats")
# Pkg.add(["MultivariateStats", "RDatasets", "Plots", "CSV", "DataFrames", "Statistics"])

using MultivariateStats, RDatasets, Plots
using CSV, DataFrames, Statistics


# print working directory
println(pwd())


# READ CSV
test1 = CSV.read("Data/Test1.csv", DataFrame; skipto = 3, header = 2)
names(test1)
println(describe(test1))


# find which columns have missing values

# test1 = test1[completecases(test1), :]

# split half to training set
Xtr = Matrix{Float64}(test1[!, 4:end])'
Xtr_labels = Vector(test1[:,1])
Xte_h1 = Vector(test1[:,3])

# Fit PCA
M = fit(PCA, Xtr; maxoutdim=3); # you can choose as many as the number of columns - 1

M

# Write the full content of the PCA object to a .txt file
open("Results/PCA_test1.txt", "w") do file
    show(file, MIME"text/plain"(), M)  # Use MIME"text/plain" for detailed output
end

Yte = predict(M, Xtr)

# add row labels 
rowlabs = collect(1:1:length(Xte_h1))
plabs = text.(rowlabs, :white, 8)
# PC1 vs PC2
h1a = scatter(Yte[1,:], Yte[2,:], group=Xte_h1, xlabel="PC1 (60.4%)", ylabel="PC2 (25.16%)", 
    legend=:bottomleft, markersize=10; size=(500, 500))
annotate!(Yte[1,:], Yte[2,:], plabs)

# change legend position to bottomleft
# PC1 vs PC3
h1b = scatter(Yte[1,:], Yte[3,:], group=Xte_h1, xlabel="PC1 (60.4%)", ylabel="PC3 (14.36%)",  legend=:true, markersize=10; size=(500, 500), labels = :false)   
annotate!(Yte[1,:], Yte[3,:], plabs)

# PC2 vs PC3
h1c = scatter(Yte[2,:], Yte[3,:], group=Xte_h1, xlabel="PC2 (25.16%)", ylabel="PC3 (14.36%)",  legend=:true, markersize=10; size=(500, 500), labels = :false)   
annotate!(Yte[2,:], Yte[3,:], plabs)

# Make 3d plot
h1d = scatter(Yte[1,:], Yte[2,:], Yte[3,:], group=Xte_h1, xlabel="PC1 (60.4%)", ylabel="PC2 (25.15%)", 
    zlabel="PC3 (14.3%)", legend=:true, markersize=10; size=(500, 500), labels = :false)
 

annotate!(Yte[1,:], Yte[2,:], Yte[3,:], plabs)

# put the plots in a single plot
plot1 = plot(h1a, h1b, h1c,h1d, layout=(2,2), size=(800, 800))
# add title to the plot
title!("H1")

# save the plot
savefig(plot1, "Plots/H1.pdf")
savefig(h1a, "Plots/H1a.pdf")

## Test 2 
test2 = CSV.read("Data/Test2.csv", DataFrame; skipto = 3, header = 2)
names(test2)
println(describe(test2))

# split half to training set
Xtr = Matrix{Float64}(test2[!, 4:end])'
Xtr_labels = Vector(test2[:,1])
Xte_h2 = Vector(test2[:,3])

# Fit PCA
M = fit(PCA, Xtr; maxoutdim=3)
Yte = predict(M, Xtr)

# Write the full content of the PCA object to a .txt file
open("Results/PCA_test2.txt", "w") do file
    show(file, MIME"text/plain"(), M)  # Use MIME"text/plain" for detailed output
end



# add row labels 
rowlabs = collect(1:1:length(Xte_h2))
plabs = text.(rowlabs, :white, 8)
# PC1 vs PC2
h2a = scatter(Yte[1,:], Yte[2,:], group=Xte_h2, xlabel="PC1 (62.79%)", ylabel="PC2 (24.8%)", legend=:bottomleft, markersize=10; size=(500, 500))
annotate!(Yte[1,:], Yte[2,:], plabs)

# PC1 vs PC3
h2b = scatter(Yte[1,:], Yte[3,:], group=Xte_h2, xlabel="PC1 (62.79%)", ylabel="PC3 (12.4%)",  legend=:true, markersize=10; size=(500, 500), labels = :false)
annotate!(Yte[1,:], Yte[3,:], plabs)

# PC2 vs PC3
h2c = scatter(Yte[2,:], Yte[3,:], group=Xte_h2, xlabel="PC2 (24.8%)", ylabel="PC3 (12.4%)",  legend=:true, markersize=10; size=(500, 500), labels = :false)
annotate!(Yte[2,:], Yte[3,:], plabs)

# Make 3d plot
h2d = scatter(Yte[1,:], Yte[2,:], Yte[3,:], group=Xte_h2, xlabel="PC1 (62.79%)", ylabel="PC2 (24.8%)", 
    zlabel="PC3 (12.4%)", legend=:true, markersize=10; size=(500, 500), labels = :false)

annotate!(Yte[1,:], Yte[2,:], Yte[3,:], plabs)

# put the plots in a single plot
plot2= plot(h2a, h2b, h2c,h2d, layout=(2,2), size=(800, 800))
# add title to the plot
title!("H2")

## Test 3
test3 = CSV.read("Data/Test3.csv", DataFrame; skipto = 3, header = 2)
names(test3)
println(describe(test3))

# split half to training set

Xtr = Matrix{Float64}(test3[!, 4:end])'
Xtr_labels = Vector(test3[:,1])
Xte_h3 = Vector(test3[:,3])

# Fit PCA
M = fit(PCA, Xtr; maxoutdim=3)
Yte = predict(M, Xtr)


# Write the full content of the PCA object to a .txt file
open("Results/PCA_test3.txt", "w") do file
    show(file, MIME"text/plain"(), M)  # Use MIME"text/plain" for detailed output
end

# add row labels
rowlabs = collect(1:1:length(Xte_h3))
plabs = text.(rowlabs, :white, 8);
# PC1 vs PC2

h3a = scatter(Yte[1,:], Yte[2,:], group=Xte_h3, xlabel="PC1 (60.9%)", ylabel="PC2 (24.9%)", legend=:bottomleft, markersize=10; size=(500, 500))
annotate!(Yte[1,:], Yte[2,:], plabs)

# PC1 vs PC3
h3b = scatter(Yte[1,:], Yte[3,:], group=Xte_h3, xlabel="PC1 (60.9%)", ylabel="PC3 (14.2%)",  legend=:true, markersize=10; size=(500, 500), labels = :false)
annotate!(Yte[1,:], Yte[3,:], plabs)

# PC2 vs PC3
h3c = scatter(Yte[2,:], Yte[3,:], group=Xte_h3, xlabel="PC2 (24.9%)", ylabel="PC3 (14.2%)",  legend=:true, markersize=10; size=(500, 500), labels = :false)
annotate!(Yte[2,:], Yte[3,:], plabs)

# Make 3d plot
h3d = scatter(Yte[1,:], Yte[2,:], Yte[3,:], group=Xte_h3, xlabel="PC1 (60.9%)", ylabel="PC2 (24.9%)", 
    zlabel="PC3 (14.2%)", legend=:true, markersize=10; size=(500, 500), labels = :false)

annotate!(Yte[1,:], Yte[2,:], Yte[3,:], plabs)

# put the plots in a single plot
plot3 = plot(h3a, h3b, h3c,h3d, layout=(2,2), size=(800, 800))

# add title to the plot
title!("H3")


# Test 4
test4 = CSV.read("Data/Test4.csv", DataFrame; skipto = 3, header = 2)
names(test4)
println(describe(test4))

# split half to training set
Xtr = Matrix{Float64}(test4[!, 4:end])'
Xtr_labels = Vector(test4[:,1])
Xte_h4 = Vector(test4[:,3])

# Fit PCA
M = fit(PCA, Xtr; maxoutdim=3)
Yte = predict(M, Xtr)

# Write the full content of the PCA object to a .txt file
open("Results/PCA_test4.txt", "w") do file
    show(file, MIME"text/plain"(), M)  # Use MIME"text/plain" for detailed output
end


# add row labels
rowlabs = collect(1:1:length(Xte_h4))
plabs = text.(rowlabs, :white, 8)

# PC1 vs PC2
h4a = scatter(Yte[1,:], Yte[2,:], group=Xte_h4, xlabel="PC1 (62.5%)", ylabel="PC2 (23.5%)", legend=:bottomleft, markersize=10; size=(500, 500))
annotate!(Yte[1,:], Yte[2,:], plabs)


# PC1 vs PC3
h4b = scatter(Yte[1,:], Yte[3,:], group=Xte_h4, xlabel="PC1 (62.5%)", ylabel="PC3 (14%)",  legend=:true, markersize=10; size=(500, 500), labels = :false)
annotate!(Yte[1,:], Yte[3,:], plabs)

# PC2 vs PC3
h4c = scatter(Yte[2,:], Yte[3,:], group=Xte_h4, xlabel="PC2 (23.5%)", ylabel="PC3 (14%)",  legend=:true, markersize=10; size=(500, 500), labels = :false)
annotate!(Yte[2,:], Yte[3,:], plabs)

# Make 3d plot

h4d = scatter(Yte[1,:], Yte[2,:], Yte[3,:], group=Xte_h4, xlabel="PC1 (62.5%)", ylabel="PC2 (23.5%)", 
    zlabel="PC3 (14%)", legend=:true, markersize=10; size=(500, 500), labels = :false)

annotate!(Yte[1,:], Yte[2,:], Yte[3,:], plabs)

# put the plots in a single plot
plot4 = plot(h4a, h4b, h4c,h4d, layout=(2,2), size=(800, 800))

# add title to the plot
title!("H4")

# save each combine plot
savefig(plot1, "Plots/H1.pdf")
savefig(plot2, "Plots/H2.pdf")
savefig(plot3, "Plots/H3.pdf")
savefig(plot4, "Plots/H4.pdf")