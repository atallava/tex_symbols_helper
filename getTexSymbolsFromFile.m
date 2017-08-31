function [cmdCell,meaningCell,texSymbolCell] = getTexSymbolsFromFile(relPathFile)
%GETTEXSYMBOLSFROMFILE 
% 
% [cmdCell,meaningCell,texSymbolCell] = GETTEXSYMBOLSFROMFILE(relPathFile)
% 
% relPathFile   - 
% 
% cmdCell       - 
% meaningCell   - 
% texSymbolCell - 

fid = fopen(relPathFile,'r');
[texSymbolCell,cmdCell,meaningCell] = deal({});
line =  fgetl(fid);
count = 0;
while ischar(line)
    % check if line begins with newcommand
    flag = strfind(line,'\newcommand');
    if ~isempty(flag)
        line = strtrim(line);
        count = count+1;
        openBracePosns = strfind(line,'{');
        closeBracePosns = strfind(line,'}');
        
        % cmd
        % assuming first brace pair is cmd
        cmdPosnStart = openBracePosns(1)+1;
        cmdPosnEnd = closeBracePosns(1)-1;
        cmd = line(cmdPosnStart:cmdPosnEnd);
        cmdCell{count} = cmd;
        
        % meaning
        meaning = convertTexCmdToMeaning(cmd);
        meaningCell{count} = meaning;
        
        % symbol
        % assuming second brace opening, and end of line is symbol
        texSymbolPosnStart = openBracePosns(2)+1;
        texSymbolPosnEnd = length(line)-1;
        texSymbol = line(texSymbolPosnStart:texSymbolPosnEnd);
        texSymbol = replaceMacroArgInTexSymbol(texSymbol);
        texSymbolCell{count} = texSymbol;
    end
    line = fgetl(fid);
end

end