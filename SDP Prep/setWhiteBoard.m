function whiteBoard = setWhiteBoard(board1)
%UNTITLED creates an all white board
%   Makes an all white board based on the size of board1
for i = 1:numel(board1)
    board1(i) = 1;
end
whiteBoard = board1;
end

