function id = Cindex(i,j)
  
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