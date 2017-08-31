function tableStr = genTexTableStr(meaningCell,symbolCell)
%GENTEXTABLESTR 
% 
% tableStr = GENTEXTABLESTR(meaningCell,symbolCell)
% 
% meaningCell - 
% symbolCell  - 
% 
% tableStr    - 

tableStr = '';
line = sprintf('\\begin{table}[]\n'); addLine(line);
line = sprintf('\\centering\n'); addLine(line);
line = sprintf('\\caption{List of symbols}\n'); addLine(line);
line = sprintf('\\label{table:symbol_list}\n'); addLine(line);
line = sprintf('\\begin{tabular}{cl}\n'); addLine(line);
line = sprintf('\\hline\n'); addLine(line);
line = sprintf('symbol & meaning \\\\\n'); addLine(line);
line = sprintf('\\hline\n'); addLine(line);
% assuming symbols don't already have $$ around them
for i = 1:length(symbolCell)
    line = sprintf('$%s$ & %s \\\\\n',symbolCell{i},meaningCell{i}); 
    addLine(line);
end
line = sprintf('\\hline\n'); addLine(line);
line = sprintf('\\end{tabular}\n'); addLine(line);
line = sprintf('\\end{table}\n'); addLine(line);

function addLine(l)
    tableStr = [tableStr l];
end
end