function board = generateBoard(difficulty)
%GENERATEBOARD Generates a board for memory game
%   Generates a board based on entered difficulty

if (isequal(difficulty, 1))
    board = randi(2,3,3);
elseif (isequal(difficulty, 2))
    board = randi(2,3,4);
elseif (isequal(difficulty, 3))
    board = randi(2,4,4);
elseif (isequal(difficulty, 4))
    board = randi(2,4,5);
elseif (isequal(difficulty, 5))
    board = randi(2,5,5);
elseif (isequal(difficulty, 6))
    board = randi(2,5,6);
elseif (isequal(difficulty, 7))
    board = randi(2,6,6);
elseif (isequal(difficulty, 8))
    board = randi(2,6,7);
end

