function [  ] = plotSparseData( dataTable )
%PLOTSPARSEDATA Summary of this function goes here
%   Detailed explanation goes here
    firstI = min(dataTable(:,1));
    lastI = max(dataTable(:,1));
    size = lastI-firstI+1;
    curveData = zeros(size,1);
    
    curveData(dataTable(:,1)-firstI+1) = dataTable(:,2);
    plot(firstI+(0:size-1),curveData);
end

