function [ trainData ] = genTrainData( posData )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    datafiles = dir('GSM*');
    num_files = size(datafiles,1);
    
    %Generate Pos
    for i = 1:num_files
        file_name = datafiles(i,1).name;
        data_import = importdata(file_name);
        data_table = data_import.data;
        for chr = 1:16
            windowSize = 210;
            readCounts = getData(filename,chr,strand);

end

