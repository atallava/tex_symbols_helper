% specify files
relPathFiles = {'data/symbols_1.tex','data/symbols_2.tex'};

%% symbols from files
[cmdCell,meaningCell,texSymbolCell] = getTexSymbolsFromFiles(relPathFiles);
groundSymbolCell = groundTexSymbolReferences(cmdCell,texSymbolCell,texSymbolCell);

%%
[clashingSymbols,clashingCmdSets] = checkSymbolClashes(cmdCell,groundSymbolCell);
for i = 1:length(clashingSymbols)
    fprintf('clashing symbol: %s\n',clashingSymbols{i});
    fprintf('clashing cmds: \n');
    disp(clashingCmdSets{i});
end

%% generate latex table
texTableStr = genTexTableStr(meaningCell,groundSymbolCell);

%% write tex table to file
relPathOut = 'data/symbol_list.tex';
writeTexTable(meaningCell,groundSymbolCell,relPathOut);


