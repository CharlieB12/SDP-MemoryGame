replay = true;
boardDifficulty = 1;
%While incorrect guesses is less than 3, restart loop with greater
%difficulty.
while replay == true

    board = generateBoard(boardDifficulty);
    whiteBoard = setWhiteBoard(board);
    numBlack = 0;
    numCorrect = 0;
    numIncorrect = 0;
    
    %counts the number of black squares in the board
    for i = 1:numel(board)
        if board(i) == 2
            numBlack = numBlack + 1;
            disp(numBlack)
        end
    end
    
    %draws the board with black and white squares
    myScene = simpleGameEngine('retro_blank.png',16,16,10,[255,255,255]);
    drawScene(myScene,board);
    
    %after 3 seconds, board switches to all white, covering black squares.
    pause(3);
    drawScene(myScene, board, whiteBoard)
    
    %loop for deciding number of correct guesses and number of incorrect
    %guesses. Shows green and red squares respectivly.
    while(numCorrect < numBlack && numIncorrect < 3)
        [r, c] = getMouseInput(myScene);
        if board(r, c) == 2
            numCorrect = numCorrect + 1;
            whiteBoard(r, c) = 3;
            drawScene(myScene, whiteBoard)
        elseif board(r, c) == 1
            numIncorrect = numIncorrect + 1;
            whiteBoard(r, c) = 4;
            drawScene(myScene, whiteBoard)
        end
    end
    %if the number of correct guesses equals the number of black squares,
    %win screen is displayed.
    if numCorrect == numBlack
        title("Nice!", "Color", "green")
        xlabel("Get ready for the next round!", "FontSize", 22, "Color", 'green')
        replay = true;
        pause(3)
    %if three incorrect guesses occur, lose screen appears.
    else
        xlabel("You Lost.", "FontSize", 24, "Color", 'red')
        replay = false;
        pause(3)
    end
    boardDifficulty = boardDifficulty + 1;
    close();
end


