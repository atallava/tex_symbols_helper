function [cmdCell,meaningCell,texSymbolCell] = getTexSymbolsFromFiles(relPathFiles)
%GETTEXSYMBOLSFROMFILES 
% 
% [cmdCell,meaningCell,texSymbolCell] = GETTEXSYMBOLSFROMFILES(relPathFiles)
% 
% relPathFiles  - 
% 
% cmdCell       - 
% meaningCell   - 
% texSymbolCell - 

[cmdCell,meaningCell,texSymbolCell] = deal({});
for i = 1:length(relPathFiles)
    [thisCmdCell,thisMeaningCell,thisTexSymbolCell] = ...
        getTexSymbolsFromFile(relPathFiles{i});
    
    cmdCell = {cmdCell{:} thisCmdCell{:}};
    meaningCell = {meaningCell{:} thisMeaningCell{:}};
    texSymbolCell = {texSymbolCell{:} thisTexSymbolCell{:}};
end
end