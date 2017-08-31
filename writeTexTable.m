function writeTexTable(meaningCell,groundSymbolCell,relPathOut)
%WRITETEXTABLE 
% 
% WRITETEXTABLE(meaningCell,groundSymbolCell,relPathOut)
% 
% meaningCell      - 
% groundSymbolCell - 
% relPathOut       - 

fid = fopen(relPathOut,'w');
line = sprintf('\\section*{List of symbols}\n\n');
fprintf(fid,'%s',line);
maxEntriesPerTable = 25;
nEntries = length(meaningCell);
entryStart = 1;
while entryStart <= nEntries
    entryEnd = entryStart+(maxEntriesPerTable-1);
    entryEnd = min(entryEnd,nEntries);
    texTableStr = genTexTableStr( ...
        meaningCell(entryStart:entryEnd),groundSymbolCell(entryStart:entryEnd));
    fprintf(fid,'%s',texTableStr);
    fprintf(fid,'\n\n');
    entryStart = entryStart+maxEntriesPerTable;
end
fclose(fid);
end