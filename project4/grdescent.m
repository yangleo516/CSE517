function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%

if nargin<5,tolerance=1e-02;end;
i = 1;
w = w0;
[baseloss,gradient] = func(w);
while(i <= maxiter && norm(gradient)>tolerance)
    [loss,gradient] = func(w);
    if(loss > baseloss)
        stepsize = stepsize * 0.5;
    else
        stepsize = stepsize * 1.01;
    end
    w = w - stepsize * gradient;
    baseloss = loss;
    i = i + 1;
end
        
        
    
    
    