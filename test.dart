import 'dart:io';

void main() {
  stdout.write("Entrer un nombre : ");
  String? x = stdin.readLineSync();
  print("Tu as entré : $x");
}
