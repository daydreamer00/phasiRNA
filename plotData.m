function [ plotedData ] = plotData( fileName, chr , strand ,Start, End)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    retData = getData( fileName, chr , strand );
    plotedData = retData(retData(:,1)>Start & retData(:,1)<End,:);
    size = End - Start+1;
    curveData = zeros(size,1);
    curveData(plotedData(:,1)-Start) = plotedData(:,2);
    plot(1:size,curveData);
end

