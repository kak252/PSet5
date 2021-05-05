#code taken from Slack, only changes made to function and in streamplot comand the plotting range was changed to 0-1 and arrow weight was decreased 
using Pkg
Pkg.add("Makie")
Pkg.add("AbstractPlotting")
using Makie
using AbstractPlotting
using AbstractPlotting.MakieLayout
AbstractPlotting.inline!(true)
# Model Delta in Notch-Delta system 
# D1: Active Delta in cell 1
# D2: Active Delta in cell 2 
function delta_dynamics(D1, D2)
       
    u = 1/(1+10(D2^2/(0.1+D2^2)))-D1     #dD1/dT
    v = 1/(1+10(D1^2/(0.1+D1^2)))-D2     #dD2/dT
    
    return Point(u,v)
end
# Construct the streamplot
plt1 = Scene(resolution =(400,400))
streamplot!(plt1, delta_dynamics, 0..1, 0..1, colormap = :plasma, 
    gridsize= (32,32), arrow_size = 0.01)
# Display the plot
display(plt1)
# Save the plot
save("odeField.png", plt1)