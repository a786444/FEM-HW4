function id = Cindex(i,j)
    % 本函式由同學R10522636黃暄文提供,將4階index轉換為2階
    if i == j
        id = i;
    elseif i+j == 5
        id = 4;
    elseif i+j == 4
        id = 5;
    elseif i+j == 3
        id = 6;
    end
end