function winner = findConnectFour(game_board)
%FINDCONNECTFOUR scans the entire game board and determines if there is
%four connected disks

%   This function checks all possible ways a player can connect four disks
%   consecutively.

    % initialize winner to be no one
    winner = 0;
    
    % horizontal checks
    for i = 1:6 % row
        for j = 1:4 % column
            if game_board(i,j) == game_board(i,j+1) && game_board(i,j) == game_board(i,j+2) && game_board(i,j) == game_board(i,j+3) && game_board(i,j) ~= 1
                winner = game_board(i,j); % either 2 or 3 (player 2 or player 1)
                break;
            end
        end
    end
    
    % vertical checks
    for j = 1:7 % column
        for i = 1:3 % row
            if game_board(i,j) == game_board(i+1,j) && game_board(i,j) == game_board(i+2,j) && game_board(i,j) == game_board(i+3,j) && game_board(i,j) ~= 1
                winner = game_board(i,j); % either 2 or 3 (player 2 or player 1)
                break;
            end
        end
    end
    
    % back diagonal checks
    for i = 1:3 % row
        for j = 1:4 % column
             if game_board(i,j) == game_board(i+1,j+1) && game_board(i,j) == game_board(i+2,j+2) && game_board(i,j) == game_board(i+3,j+3) && game_board(i,j) ~= 1
                winner = game_board(i,j); % either 2 or 3 (player 1 or player 2)
                break;
            end
        end
    end
    
    % forward diagonal checks
    for i = 1:3 % row
        for j = 4:7 % column
             if game_board(i,j) == game_board(i+1,j-1) && game_board(i,j) == game_board(i+2,j-2) && game_board(i,j) == game_board(i+3,j-3) && game_board(i,j) ~= 1
                winner = game_board(i,j); % either 2 or 3 (player 1 or player 2)
                break; 
            end
        end
    end
    
end

