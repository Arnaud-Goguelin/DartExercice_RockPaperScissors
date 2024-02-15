import 'dart:io';

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
void main() {
  while (true) {
    stdout.write("""
Rock, paper or scissors? 
Press: 'r' or 'p' or 's'to play.
Press 'q' to exit the game.
Your input: """);
    final input = stdin.readLineSync();
    switch (input) {
      case 'q':
        exit(0);
      case 'r':
        break;
      case 'p':
        break;
      case 's':
        break;
      default:
        print("""
$input is an invalid input. Please choose a valid one.
        """);
        break;
    }
  }
}
