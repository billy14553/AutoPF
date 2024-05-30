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
    Configuration.minRealRMSECV = 1000000;
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
     options = optimoptions('ga');
    if strcmp(Configuration.task,"classfication")==1
        FunctionTolerance_Data = 0.02;
        options = optimoptions(options,'MaxStallGenerations', 3);
        options = optimoptions(options,'PopulationSize', 12);
    else
        options = optimoptions(options,'PopulationSize', 16);
    end
    
   % ConstraintTolerance_Data=1e-1;
  
    
    
    options = optimoptions(options,'FunctionTolerance', FunctionTolerance_Data);

   % MaxStallGenerations generations 
  %  options = optimoptions(options,'ConstraintTolerance', ConstraintTolerance_Data);
    options = optimoptions(options,'Display', 'iter');
    options = optimoptions(options,'MaxTime',600);
    options = optimoptions(options,'MaxGenerations', 16);
    [x,fval,exitflag,output,population,score] = ga(fitness_function, nMaxComb,[],[],[],[],lb,ub,[],intcon,options);
end