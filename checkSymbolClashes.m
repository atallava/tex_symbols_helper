function [clashingSymbols,clashingCmdSets] = checkSymbolClashes(cmds,symbols)
%CHECKSYMBOLCLASHES 
% 
% [clashingSymbols,clashingCmdSets] = CHECKSYMBOLCLASHES(cmds,symbols)
% 
% cmds            - 
% symbols         - 
% 
% clashingSymbols - 
% clashingCmdSets - 

unqSymbols = unique(symbols);
nUnqSymbols = length(unqSymbols);
nCmds = length(cmds);
strcmpResArray = zeros(nUnqSymbols,nCmds);
[clashingSymbols,clashingCmdSets] = deal({});
for i = 1:nUnqSymbols
    flag = strcmp(symbols,unqSymbols{i});
    if sum(flag) > 1
        clashingSymbols{end+1} = unqSymbols{i};
        clashingCmdSets{end+1} = cmds(flag);
    end
    strcmpResArray(i,:) = flag;
end
end
