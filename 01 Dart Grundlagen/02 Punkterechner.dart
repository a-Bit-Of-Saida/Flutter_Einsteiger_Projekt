// Aufgabe 2: Punkte-Rechner

//Anforderungen:

//- Eine Funktion bekommt Punkte als Zahl.
//- Ab 50 Punkten: bestanden.
//- Unter 50 Punkten: nicht bestanden.

void main() {
  punkterechner(50);
  punkterechner(34);
  punkterechner(88);
}

void punkterechner(int punkteanzahl) {
  if (punkteanzahl >= 50) {
    print('Du hast bestanden');
  } else {
    print('Du hast nicht bestanden');
  }
}
