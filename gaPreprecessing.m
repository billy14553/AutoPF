function [x,fval] =gaPreprecessing(X,y,LV)
    global Configuration;
    Configuration.XtrainData = X;
    Configuration.ytrainData = y;
    %Configuration.XtestData =Xtest;
    %Configuration.ytestData = ytest;
    Configuration.Iter = 1;
    Configuration.RMSECV =[];
    Configuration.LVs = LV;
    Configuration.minVal = 1000000;
    nMaxComb = length(Configuration.Backbone);
    lb = ones(1, nMaxComb);
    ub = nMaxComb*ones(1, nMaxComb);
    for i = 1:1:nMaxComb
        ub(i) = length(Configuration.Backbone{i});
    end
    % define fitness function
    fitness_function = @(x) FitnessFunction(x);
    intcon=1:nMaxComb;
    %fix random seeds
    rng(0);
    FunctionTolerance_Data=1e-2;
   
    if strcmp(Configuration.task,"classfication")==1
        FunctionTolerance_Data = 0.05;
    end
    
   % ConstraintTolerance_Data=1e-1;
    options = optimoptions('ga');
    
    options = optimoptions(options,'PopulationSize', 8);
    options = optimoptions(options,'FunctionTolerance', FunctionTolerance_Data);
  %  options = optimoptions(options,'ConstraintTolerance', ConstraintTolerance_Data);
    options = optimoptions(options,'Display', 'off');
    options = optimoptions(options,'MaxTime',180);
    options = optimoptions(options,'MaxGenerations', 36);
    [x,fval,exitflag,output,population,score] = ga(fitness_function, nMaxComb,[],[],[],[],lb,ub,[],intcon,options);
end