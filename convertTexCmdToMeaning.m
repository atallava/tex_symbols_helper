function meaning = convertTexCmdToMeaning(cmd)
%CONVERTTEXCMDTOMEANING 
% 
% meaning = CONVERTTEXCMDTOMEANING(cmd)
% 
% cmd     - 
% 
% meaning - 

% throw the first slash away
cmd(1) = [];
% assuming camel case
uppercaseFlag = isstrprop(cmd,'upper');
wordStartPosns = find(uppercaseFlag);
if isempty(wordStartPosns)
    wordStartPosns = 1;
end
if wordStartPosns(1) ~= 1
    wordStartPosns = [1 wordStartPosns];
end
nWords = length(wordStartPosns);
meaning = '';
for i = 1:(nWords-1)
    wordStartPosn = wordStartPosns(i);
    wordEndPosn = wordStartPosns(i+1)-1;
    word = lower(cmd(wordStartPosn:wordEndPosn));
    if i == 1
        meaning = [meaning word];
    else
        meaning = [meaning ' ' word];
    end
end
wordStartPosn = wordStartPosns(end);
wordEndPosn = length(cmd);
word = lower(cmd(wordStartPosn:wordEndPosn));
meaning = [meaning ' ' word];
% remove trailing spaces
meaning = strtrim(meaning);
end