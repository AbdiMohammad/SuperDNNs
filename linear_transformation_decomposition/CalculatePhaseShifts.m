clear all
clc

load("../results/superdnn_weights.mat")

keepVariables = "";
for layer = 1 : 3
    eval(strcat("T = fc", num2str(layer), "_weight"))
    [S_total, S_stack_total,Transformation_summary, phis_U, thetas_U, phi2_U, phis_V, thetas_V, phi2_V] = GeneralTransformationSolver(T);
    for phase = ["phis", "thetas", "phi2"]
        for matrix = ["U", "V"]
            eval(sprintf("%s_%s_%d = %s_%s", phase, matrix, layer, phase, matrix));
            keepVariables = strcat(keepVariables, sprintf("%s_%s_%d", phase, matrix, layer), " ");
        end
    end
end

eval(sprintf("clearvars -except %s", keepVariables))