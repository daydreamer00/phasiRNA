function [  ] = plotRangeSparseData( dataTable,st,en )
%PLOTSPARSEDATA Summary of this function goes here
%   Detailed explanation goes here
    firstI = min(dataTable(:,1));
    lastI = max(dataTable(:,1));
    size = lastI-firstI+1;
    curveData = zeros(size,1);
    
    curveData(dataTable(:,1)) = dataTable(:,2);
    range = firstI+(0:size-1);
    selectedIndex = range>st & range<en; 
    plot(range(selectedIndex),curveData(selectedIndex));
end

