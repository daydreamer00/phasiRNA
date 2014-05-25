function [ resTable ] = genData(  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    threshold_ratio = 2/3;
    datafiles = dir('GSM*');
    num_files = size(datafiles,1);
    load('known_phasi.mat');
    resTable = [];
    for i = 1:num_files
        file_name = datafiles(i,1).name;
        data_import = importdata(file_name);
        data_table = data_import.data;
        for chr = 1:16
            pvalues0 = computePvalue(file_name,chr,0);
            maxp0 = max(pvalues0(:,2));
            pvalues16 = computePvalue(file_name,chr,16);
            maxp16 = max(pvalues16(:,2));
%             peaki0 = find(pvalues0(:,2)>maxp0*threshold_ratio);
%             peaki16 = find(pvalues16(:,2)>maxp16*threshold_ratio);
            known_for_chr = exceldata(exceldata(:,1)==chr,:);
            accepti0 = zeros(size(pvalues0,1),1);
            accepti16 = zeros(size(pvalues16,1),1);
            for row = 1:size(known_for_chr,1)
                if(known_for_chr(row,2)==0)
                    accepti0 = accepti0 | (pvalues0(:,1)>= known_for_chr(row,3) & ...
                            ((pvalues0(:,1)<= known_for_chr(row,4)) & pvalues0(:,2)>maxp0*threshold_ratio));
                elseif (known_for_chr(row,2)==16 )
                    accepti16 = accepti16 | (pvalues16(:,1)>= known_for_chr(row,3) & ...
                            (pvalues16(:,1)<= known_for_chr(row,4)) & pvalues16(:,2)>maxp16*threshold_ratio);
                else
                    print('error\n');
                end
            end
            tmp = pvalues0(logical(accepti0),:);
            tmpn = size(tmp,1);
            resTable = [resTable; repmat([i chr 0],tmpn,1) tmp];
            tmp = pvalues16(logical(accepti16),:);
            tmpn = size(tmp,1);
            resTable = [resTable; repmat([i chr 16],tmpn,1) tmp];
        end    
        
    end

end

