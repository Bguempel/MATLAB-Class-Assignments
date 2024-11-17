function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber() - Assignment 5
%
%        NAME:
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it, 
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github. There are between 9 - 12 bugs,
%              depending on how you correct them. 
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;    % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game (buggy)\n\n', ...
'This program plays the game of Guess That Number in which you have to guess\n', ...
'a secret number.  After each guess you will be told whether your \n', ...
'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): '); 

while level ~= beginner && level ~= moderate && level ~= advanced % (1) bug here: couldnt use || 'ors' because it would always evaluate to true and loop indefinitely. instead use && 'and' so that if level is one of these values, the condition will be false and the loop will stop. found after getting 'sorry' message.
   fprintf('Sorry, that is not a valid level selection.\n')
   level = input('Please re-enter a level of play (1-3): ');
end

% set highest secret number based on level selected

if level == beginner % (2) bug here: I found this by trying to run the code and getting a incorrect use of '=' error message. I added a second '=' to ensure it wasnt attempting to create an additional variable. found via code throwing error message                      

   highest = beginnerHighest;

elseif level == moderate

   highest = moderateHighest;

else
   highest = advancedHighest; % (3) bug here: advancedhighest should be advancedHighest. have to have a capitol 'H' or variable cannot be called. found while reading code and matching variables.         
end

% randomly select secret number between 1 and highest for level of play

% "secretNumber = floor(rand() + 1 * highest);" (4) bug here: this does not
% choose a random number inside the correct bounds. the code below will
% make sure it is always between 1 and the highest number. found while
% testing for actual randomness

secretNumber = randi([1,highest]);

% initialize number of guesses and User_guess

numOfTries = 1;
userGuess = 0;

% repeatedly get user's guess until the user guesses correctly

while userGuess ~= secretNumber % (5) Bug here: there was no 'end' to end 
    % this while loop. added to the end of the script. found by matlab
    % highlighting it for me

% get a valid guess (an integer from 1-Highest) from the user

        fprintf('\nEnter a guess (1-%d): ', highest);
        userGuess = input('');
    
        % 'while userGuess < 1 || userGuess >= highest' (6) bug here: should not be equal to or greater than. instead it should be just greater than. found while running code 
    while userGuess < 1 || userGuess > highest

        fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);

        userGuess = input('');

    end % of guess validation loop

% add 1 to the number of guesses the user has made

numOfTries = numOfTries + 1;

% report whether the user's guess was high, low, or correct

    if userGuess < secretNumber % (7) bug here: sign did not match the text display. switch sign to less than '<' to correct issue. found while reading the code
       fprintf('Sorry, %d is too low.\n', userGuess);
    elseif userGuess > secretNumber 
       fprintf('Sorry, %d is too high.\n', userGuess);
    
    % 'elseif numOfTries == 1' (8) bug here: this line of code never made a
    % comparison. userguess and secretnumber have to checked to see if this
    % was the first try or not. found while running code 
    elseif numOfTries == 1 && userGuess == secretNumber
       fprintf('\nLucky You!  You got it on your first try!\n\n');
    else
       fprintf('\nCongratulations!  You got %d in %d tries.\n\n', ...
       secretNumber, numOfTries); % (9) bug here: original text did not display
       % the amount of tries it took. added numOfTries to end of code.
       % found through running code and not seeing that info after text


% fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');
% (10) bug here: this line of code was inside the loop and thus in the
% wrong spot. moved it to outside of loop to correct. found while running script 

    end  % of guessing while loop
end

fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');
% end of game

%(11) maybe bug?: indented lines of code to make it easier to proof read
%and follow. was diving me nuts trying to read it initially. 