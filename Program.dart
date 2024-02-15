import 'dart:io';
import 'dart:math';

/* while true
  show prompt OK
  read user input OK

if input is valid move ('r', 'p', 's')
  choose the AI move at random
  compora the player move with the AI move
  show the result
else if input is 'q'
  quit the program
else
  print 'invalid input'

BONUS PERSO: établir un % de victoires / défaites
*/

enum Move {
  rock,
  paper,
  scissors,
  waiting,
}

void main() {
  while (true) {
    stdout.write("""
Rock, paper or scissors? 
Press: 'r' or 'p' or 's'to play.
Press 'q' to exit the game.
Your input: """);
    final randomNumber = Random().nextInt(3);
    final AIChoice = Move.values[randomNumber];

    final input = stdin.readLineSync();
    var playerChoice = Move.values[3];

    switch (input) {
      case 'q':
        exit(0);
      case 'r':
        playerChoice = Move.rock;
        break;
      case 'p':
        playerChoice = Move.values[1];
        break;
      case 's':
        playerChoice = Move.scissors;
        break;
      default:
        print("""
$input is an invalid input. Please choose a valid one.
        """);
        continue;
    }

    print('AI played ${AIChoice.name}');
    print('You played ${playerChoice.name}');

    if (playerChoice == AIChoice) {
      print("""It\'s a draw.
            """);
    } else if (playerChoice == Move.rock && AIChoice == Move.scissors ||
        playerChoice == Move.scissors && AIChoice == Move.paper ||
        playerChoice == Move.paper && AIChoice == Move.rock) {
      print("""You win!
            """);
    } else {
      print("""You loose.
            """);
    }
  }
}
