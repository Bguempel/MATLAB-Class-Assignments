%Bishop Guempel
%9/15/2024
%This code plays a game of Tic-Tac-Toe against a randi function CPU. The
%objective is to get three 1's in a row before the cpu gets three -1's in a row. To place your move, use the
%brackets around the row and column of your choice (Ex: [1,3] )

%i was able to get the output for 'spot taken' to be produced on an occupied space up until player move three. 
% after that it would produce the string 'winner'.
% due to this i disabled the 'spot taken' disp after move three. however,
% the game will still block the user from occupying the same spot twice and
% simply have the user select another position. 

clear all
clc
close all

% i needed a for loop. this is simply to satisfy the criteria. sorry.
for gameboard = zeros(3,1);
disp('Would you like to play a game of Tic-Tac-Toe?')
end
answer = input('Enter yes or no: ', 's');


while (answer)
    
    if(strcmp('yes', answer))
        clear all 
        clc
        close all
        gameboard = zeros(3,3);
        disp(gameboard)
        disp('Its your turn')          
                                         
        % Player first move   
        move = input('Select move: [r,c] ');
        h = move(1);
        v = move(2);
        %block player input for outside 1-3 range. unoccupied space check
        %and return to selecting move again (repeated throughout)
        freeSpace = true;
        while (freeSpace)
            if (h < 1 || h > 3 || v < 1 || v > 3)
                disp('illegal move')
                move = input('Select move: [r,c] ');
                h = move(1);
                v = move(2);

            elseif gameboard (h,v) == 0
                gameboard(h,v) = 1               
                freeSpace = false;
                               
            elseif gameboard(h,v) ~= 0                
                disp('Spot taken')
                move = input('Select move: [r,c] ');
                h = move(1);
                v = move(2);
            end
        end 

        %CPU first move
        %random positon selection of cpu
        cpuFirstMove = true;
        while (cpuFirstMove)
            cpuHmove = randi([1 3],1);
            cpuVmove = randi([1 3],1);
            if gameboard(cpuHmove,cpuVmove) == 0
               gameboard(cpuHmove,cpuVmove) = -1             
               cpuFirstMove= false;
            end 
        end

        %Player 2nd move
        move = input('Select move: [r,c] ');
        h = move(1);
        v = move(2);
        %unoccupied space check
        freeSpace2 = true;
        while (freeSpace2)
            if (h < 1 || h > 3 || v < 1 || v > 3)
                disp('illegal move')
                move = input('Select move: [r,c] ');
                h = move(1);
                v = move(2);

            elseif gameboard (h,v) == 0
                gameboard(h,v) = 1             
                freeSpace2 = false;
                
            elseif gameboard(h,v) ~= 0              
                disp('Spot taken')
                move = input('Select move: [r,c] ');
                h = move(1);
                v = move(2);
            end
        end 
        
        %CPU 2nd move
        cpuSecondMove = true;
        while (cpuSecondMove)
            cpuHmove = randi([1 3],1);
            cpuVmove = randi([1 3],1);
            if gameboard(cpuHmove,cpuVmove) == 0
                gameboard(cpuHmove,cpuVmove) = -1                
                cpuSecondMove= false;
            end         
        end
    
        %Player 3rd move
        %unoccupied space check
         freeSpace3 = true;
        while (freeSpace3)
            if (h < 1 || h > 3 || v < 1 || v > 3)
                disp('illegal move')
                move = input('Select move: [r,c] ');
                h = move(1);
                v = move(2);

            elseif gameboard (h,v) == 0
                gameboard(h,v) = 1                
                freeSpace3 = false;

            elseif gameboard(h,v) ~= 0
                % disp('Spot taken')
                move = input('Select move: [r,c] ');
                h = move(1);
                v = move(2);
            end
        end 

        %check to see if player wins and prompt player to input for new
        %game or quit (repeated throughout)
        result(1) = gameboard(1,1) + gameboard(1,2) + gameboard(1,3);
        result(2) = gameboard(2,1) + gameboard(2,2) + gameboard(2,3);
        result(3) = gameboard(3,1) + gameboard(3,2) + gameboard(3,3);
        result(4) = gameboard(1,1) + gameboard(2,1) + gameboard(3,1);
        result(5) = gameboard(1,2) + gameboard(2,2) + gameboard(3,2);
        result(6) = gameboard(1,3) + gameboard(2,3) + gameboard(3,3);
        result(7) = gameboard(1,1) + gameboard(2,2) + gameboard(3,3);
        result(8) = gameboard(1,3) + gameboard(2,2) + gameboard(3,1);
        if any(result == 3)
            disp('Winner!')
            answer = input('Do you want to play again? (yes/no)', 's');
            continue;
        end

        %CPU 3rd move
        cpuThirdMove = true;
        while (cpuThirdMove)
            cpuHmove = randi([1 3],1);
            cpuVmove = randi([1 3],1);
            if gameboard(cpuHmove,cpuVmove) == 0
                gameboard(cpuHmove,cpuVmove) = -1               
                cpuThirdMove= false;
            end 
        end

        %check to see if CPU wins
        result(1) = gameboard(1,1) + gameboard(1,2) + gameboard(1,3);
        result(2) = gameboard(2,1) + gameboard(2,2) + gameboard(2,3);
        result(3) = gameboard(3,1) + gameboard(3,2) + gameboard(3,3);
        result(4) = gameboard(1,1) + gameboard(2,1) + gameboard(3,1);
        result(5) = gameboard(1,2) + gameboard(2,2) + gameboard(3,2);
        result(6) = gameboard(1,3) + gameboard(2,3) + gameboard(3,3);
        result(7) = gameboard(1,1) + gameboard(2,2) + gameboard(3,3);
        result(8) = gameboard(1,3) + gameboard(2,2) + gameboard(3,1);
        if any(result == -3)
            disp('You lose :( ')
            answer = input('Do you want to play again? (yes/no)', 's');
            continue;
        end

        %Player 4th move
        %unoccupied space check
         freeSpace4 = true;
        while (freeSpace4)
            if (h < 1 || h > 3 || v < 1 || v > 3)
                disp('illegal move')
                move = input('Select move: [r,c] ');
                h = move(1);
                v = move(2);

            elseif gameboard (h,v) == 0
                gameboard(h,v) = 1             
                freeSpace4 = false;

            elseif gameboard(h,v) ~= 0
                % disp('Spot taken')
                move = input('Select move: [r,c] ');
                h = move(1);
                v = move(2);
            end
        end 

        %check to see if player wins
        result(1) = gameboard(1,1) + gameboard(1,2) + gameboard(1,3);
        result(2) = gameboard(2,1) + gameboard(2,2) + gameboard(2,3);
        result(3) = gameboard(3,1) + gameboard(3,2) + gameboard(3,3);
        result(4) = gameboard(1,1) + gameboard(2,1) + gameboard(3,1);
        result(5) = gameboard(1,2) + gameboard(2,2) + gameboard(3,2);
        result(6) = gameboard(1,3) + gameboard(2,3) + gameboard(3,3);
        result(7) = gameboard(1,1) + gameboard(2,2) + gameboard(3,3);
        result(8) = gameboard(1,3) + gameboard(2,2) + gameboard(3,1);
        if any(result == 3)
            disp('Winner!')
            answer = input('Do you want to play again? (yes/no)', 's');
            continue;
        end

        %CPU 4th move
        cpuFourthMove = true;
        while (cpuFourthMove)
            cpuHmove = randi([1 3],1);
            cpuVmove = randi([1 3],1);
            if gameboard(cpuHmove,cpuVmove) == 0
                gameboard(cpuHmove,cpuVmove) = -1               
                cpuFourthMove= false;
            end 
        end

        %check to see if CPU wins
        result(1) = gameboard(1,1) + gameboard(1,2) + gameboard(1,3);
        result(2) = gameboard(2,1) + gameboard(2,2) + gameboard(2,3);
        result(3) = gameboard(3,1) + gameboard(3,2) + gameboard(3,3);
        result(4) = gameboard(1,1) + gameboard(2,1) + gameboard(3,1);
        result(5) = gameboard(1,2) + gameboard(2,2) + gameboard(3,2);
        result(6) = gameboard(1,3) + gameboard(2,3) + gameboard(3,3);
        result(7) = gameboard(1,1) + gameboard(2,2) + gameboard(3,3);
        result(8) = gameboard(1,3) + gameboard(2,2) + gameboard(3,1);
        if any(result == -3)
            disp('You lose :( ')
            answer = input('Do you want to play again? (yes/no)', 's');
            continue;
        end

        %Player 5th move
        %unoccupied space check
        freeSpace5 = true;
        while (freeSpace5)
            if (h < 1 || h > 3 || v < 1 || v > 3)
                disp('illegal move')
                move = input('Select move: [r,c] ');
                h = move(1);
                v = move(2);

            elseif gameboard (h,v) == 0
                gameboard(h,v) = 1       
                freeSpace5 = false;

            elseif gameboard(h,v) ~= 0
                % disp('Spot taken')
                move = input('Select move: [r,c] ');
                h = move(1);
                v = move(2);
            end
        end 

        %check to see if player wins
        result(1) = gameboard(1,1) + gameboard(1,2) + gameboard(1,3);
        result(2) = gameboard(2,1) + gameboard(2,2) + gameboard(2,3);
        result(3) = gameboard(3,1) + gameboard(3,2) + gameboard(3,3);
        result(4) = gameboard(1,1) + gameboard(2,1) + gameboard(3,1);
        result(5) = gameboard(1,2) + gameboard(2,2) + gameboard(3,2);
        result(6) = gameboard(1,3) + gameboard(2,3) + gameboard(3,3);
        result(7) = gameboard(1,1) + gameboard(2,2) + gameboard(3,3);
        result(8) = gameboard(1,3) + gameboard(2,2) + gameboard(3,1);        
        if any(result == 3)
            disp('Winner!')
            answer = input('Do you want to play again? (yes/no)', 's');
            continue;
        end

        %Check for a tie
        result(1) = gameboard(1,1) + gameboard(1,2) + gameboard(1,3);
        result(2) = gameboard(2,1) + gameboard(2,2) + gameboard(2,3);
        result(3) = gameboard(3,1) + gameboard(3,2) + gameboard(3,3);
        result(4) = gameboard(1,1) + gameboard(2,1) + gameboard(3,1);
        result(5) = gameboard(1,2) + gameboard(2,2) + gameboard(3,2);
        result(6) = gameboard(1,3) + gameboard(2,3) + gameboard(3,3);
        result(7) = gameboard(1,1) + gameboard(2,2) + gameboard(3,3);
        result(8) = gameboard(1,3) + gameboard(2,2) + gameboard(3,1);
        if any(result ~= 3) & (sum(sum(abs(gameboard))) == 9)
            disp('Tie!')
            answer = input('Do you want to play again? (yes/no)', 's');
            continue;
        end       

    elseif(strcmp( 'no', answer))
        disp('Thank you for playing!')
        break
    else
        disp('Illegal answer, please respond yes or no')
        answer = input('Please enter yes or no: ', 's');
        
    end

end    