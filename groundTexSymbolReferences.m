function groundSymbolCell = groundTexSymbolReferences(refCmdCell,refSymbolCell,querySymbolCell)
%GROUNDTEXSYMBOLREFERENCES 
% 
% groundSymbolCell = GROUNDTEXSYMBOLREFERENCES(refCmdCell,refSymbolCell,querySymbolCell)
% 
% refCmdCell       - 
% refSymbolCell    - 
% querySymbolCell  - 
% 
% groundSymbolCell - 

nQuerySymbols = length(querySymbolCell);
nCmds = length(refCmdCell);
groundSymbolCell = querySymbolCell;
for i = 1:nQuerySymbols
    workingSymbol = querySymbolCell{i};
    for j = 1:nCmds
        cmd = refCmdCell{j};
        posn = strfind(workingSymbol,cmd);
        if isempty(posn)
            continue;
        else
            wordStartPosn = posn;
            wordEndPosn = posn+length(cmd)-1;
            % assuming not more than one level of references. general needs
            % a graph
            workingSymbol = [workingSymbol(1:(wordStartPosn-1)) ...
                refSymbolCell{j} workingSymbol((wordEndPosn+1):end)];
        end
    end
    groundSymbolCell{i} = workingSymbol;
end
end