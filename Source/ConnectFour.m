clc
clear

% welcome box
answer = menu('Welcome to Connect Four!', 'Play');

% initialize scene
switch answer
    case 1
        game_scene = simpleGameEngine('ConnectFour.png', 86, 101);

        % sprite variables
        empty_space = 1;
        red_sprite = 2; % player 2
        black_sprite = 3; % player 1

        % draw empty board
        game_board = empty_space * ones(6,7); % board is a 6x7 matrix of 1's
        drawScene(game_scene,game_board)

        % setting columns and all rows at 6 (so disks drop to bottom row
        % and stack on top of each other)
        colNum = [1:7];
        for i = 1:7
            rowNum(i) = 6;
        end

        % player of black disks go first (player 1 is black, player 2 is red)
        player = black_sprite; 
        % no player has connected four
        c4 = 0;

        % while there is no connect four
        while (c4 == 0)

            % get user mouse input
            [row,col] = getMouseInput(game_scene);
            % set specific location of disk
            location = [row,col];
            % implement disk into the game board (so that it starts on the bottom)
            game_board(rowNum(location(2)),location(2)) = player;

            % after each disk placement in a column, move "bottom" row to be the
            % next one up
            if location(2) == colNum(1)
                rowNum(1) = rowNum(1) - 1;
            elseif location(2) == colNum(2)
                rowNum(2) = rowNum(2) - 1;   
            elseif location(2) == colNum(3)
                rowNum(3) = rowNum(3) - 1;
            elseif location(2) == colNum(4)
                rowNum(4) = rowNum(4) - 1;  
            elseif location(2) == colNum(5)
                rowNum(5) = rowNum(5) - 1;    
            elseif location(2) == colNum(6)
                rowNum(6) = rowNum(6) - 1;   
            elseif location(2) == colNum(7)
                rowNum(7) = rowNum(7) - 1; 
            end

            % update visual gameboard
            drawScene(game_scene,game_board)

            % check for connect four
            c4 = findConnectFour(game_board);

            % if there is no connect four and all spaces are taken up
            if rowNum == 0 
                c4 = 4;
            end

            % change players
            if player == red_sprite
               player = black_sprite;
            elseif player == black_sprite
                player = red_sprite;
            end
        end

        % display winning player (either black or red)
        if c4 == 2 || c4 == 3 
           msgbox(sprintf('Player %i wins!', player - 1))
        % if there is no spaces left, game is a draw
        elseif c4 == 4
           msgbox(sprintf('Game is a draw.'))
        end 
                    
end

