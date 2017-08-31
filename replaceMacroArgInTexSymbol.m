function symbolOut = replaceMacroArgInTexSymbol(symbolIn)
%REPLACEMACROARGINTEXSYMBOL 
% 
% symbolOut = REPLACEMACROARGINTEXSYMBOL(symbolIn)
% 
% symbolIn  - 
% 
% symbolOut - 

symbolOut = strrep(symbolIn,'#','\text{arg}');
end