import 'dart:io';
import 'dart:math';

enum Move {
  rock,
  paper,
  scissors,
  waiting,
}

var gameCount = 0;
var victoriesCount = 0;
var defeatsCount = 0;
var nullGame = 0;
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
    // Il est nécessaire d'initialiser la variable playerChoice, une valeur null par défaut empêche une excécution correcte.
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
    gameCount++;
    if (playerChoice == AIChoice) {
      print("""It\'s a draw.
            """);
      nullGame++;
    } else if (playerChoice == Move.rock && AIChoice == Move.scissors ||
        playerChoice == Move.scissors && AIChoice == Move.paper ||
        playerChoice == Move.paper && AIChoice == Move.rock) {
      print("""You win!
            """);
      victoriesCount++;
    } else {
      print("""You loose.
            """);
      defeatsCount++;
    }
    print("""You played $gameCount game(s).
You winned ${((victoriesCount / gameCount) * 100).toStringAsPrecision(4)}% of your game(s).
You loose ${((defeatsCount / gameCount) * 100).toStringAsPrecision(4)}% of your game(s).
${((nullGame / gameCount) * 100).toStringAsPrecision(4)}% of the game(s) ended in a draw.
    """);
  }
}
