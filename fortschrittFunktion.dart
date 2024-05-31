
// Begrüßung
// Gesamttage Anzahl
// Umwandlung Tage in Prozent
// Einlesen von daten mit stdin.readLineSync()
// Wie viele tage zum Ende des Kurses
// Meilensteine informieren

import 'dart:io';

int absoluteDays = 270;

// Eine Hauptfunktion, die das Programm steuert und die Ergebnisse ausgibt.
void main() {
  print("Willkommen zum Kursfortschrittsrechner:");
  int inputDays = readUserInput();

  // Das entspricht einem Fortschritt von 37.04%.

  double percent = daysToPercent(inputDays, absoluteDays);
  print("Das entspricht einem Fortschritt von ${percent.toStringAsFixed(2)} %");

  int milePercent = percent.toInt();

  milestones(milePercent);
}

void milestones(int milePercent) {
  if (milePercent < 25) {
    print("Du hast noch keinen Meilenstein erreicht");
  } else if (milePercent >= 25 && milePercent < 50) {
    print("Du hast den ersten Meilenstein erreicht");
  } else if (milePercent >= 50 && milePercent < 75) {
    print("Du hast den zweiten Meilenstein erreicht");
  } else if (milePercent >= 75 && milePercent < 100) {
    print("Du hast den dritten Meilenstein erreicht");
  } else {
    print("Du bist fertig");
  }
}

// Eine Funktion, um die Tage in Prozente umwandeln.

double daysToPercent(int finishedDays, int absoluteDays) {
  return (finishedDays / absoluteDays) * 100;
}

// Eine Funktion, um die Benutzereingaben zu lesen und zu verarbeiten.
int readUserInput() {
  print("Gib die Tage ein:");
  String? input = stdin.readLineSync();

  if (input!.isEmpty) {
    // Das kann leer sein, aber nicht null
    print("Das ist ein Fehler, keine Eingabe");
    return readUserInput();
  } else if (int.tryParse(input) == null) {
    print("Es handelt sich um eine falsche Eingabe");
    return readUserInput();
  } else {
    if (int.parse(input) > absoluteDays || int.parse(input) < 0) {
      print("Die Zahl entspricht nicht dem gegebenen Bereich");
      return readUserInput();
    } else {
      print("Du hast $input von $absoluteDays Tagen absolviert");
      return int.parse(input);
    }
  }
}