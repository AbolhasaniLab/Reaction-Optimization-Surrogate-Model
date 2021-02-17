 function Outputs=ExpEnvMod(Inputs,ExperimentFailureRate,NaN_Model,GT_Model,sigma)

% Case I NaN: Equipment Failure
if rand<=ExperimentFailureRate
    Outputs=[NaN,NaN,0];
    return
end

% Case II NaN: Unviable Sampling Region
if predict(NaN_Model.NaNmodel,Inputs)==0
    Outputs=[NaN,NaN,0];
    return
end

% Sample Ground Truth
for ii=1:3
Outputs_GT(ii)=predict(GT_Model.model{ii},Inputs);
end

% Apply Noise
Outputs=Outputs_GT+sigma.*randn;


end