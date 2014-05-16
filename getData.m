function [ resTable ] = getData( filename, chr , strand )
%GETDATA Summary of this function goes here
%   Detailed explanation goes here
    fileImported = importdata(filename);
    dataTable = fileImported.data;
    tmpTable = dataTable( dataTable(:,1) == chr & dataTable(:,3) == strand,:);
    if (strand == 16)
        tmpTable(:,2) = tmpTable(:,2)+2;
    end
    resTable = [tmpTable(:,2) tmpTable(:,4)];
end

