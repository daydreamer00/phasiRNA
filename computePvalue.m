function [ PvaluesForLoc ] = computePvalue( filename, chr , strand )
%GETDATA Summary of this function goes here
%   Detailed explanation goes here
    windowSize = 210;
    readCounts = getData(filename,chr,strand);

%     readCounts0 = getData(filename,chr,0);
%     readCounts16 = getData(filename,chr,16);
%     readCounts = sortrows([readCounts0 ; readCounts16],1);
        
    readCountsNum = size(readCounts,1);
    numPvalues = readCountsNum-windowSize+1;
    PvaluesForLoc = zeros(numPvalues,2);
    PvaluesForLoc(1:numPvalues,1) = readCounts(1:numPvalues,1);
    ns = zeros(numPvalues,1);
    ps = zeros(numPvalues,1);
    for i =1:numPvalues
        j = i+1;
        m=1;
        while(j<=readCountsNum && (readCounts(j,1) - readCounts(i,1) <=windowSize))
            
            ns(i) = ns(i) + readCounts(j,2);
            if ( mod(readCounts(j,1) - readCounts(i,1),21) == 0)
                m=m+1;
                ps(i) = ps(i) + readCounts(j,2);
            end
            j=j+1;
        end
        PvaluesForLoc(i,2) = (m-2)*log(1+10*ps(i)/(1+ ns(i) - ps(i)));
    end
end

