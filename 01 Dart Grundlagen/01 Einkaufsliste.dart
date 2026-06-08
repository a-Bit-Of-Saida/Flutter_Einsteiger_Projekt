//Aufgabe 1: Einkaufsliste in Dart

//Anforderungen:

//- Erstelle eine Liste mit 5 Produkten.
//- Gib alle Produkte aus.
//- Füge ein neues Produkt hinzu.
//- Entferne ein Produkt.
//- Prüfe, ob „Milch“ enthalten ist.

void main() {
  List<String> produkte = [
    'Banane',
    'Apfel',
    'Eier',
    'Toast',
    'Schokolade',
    'Milch',
  ];
  produkte.add('Mayo');
  produkte.remove('Banane');
  for (var n in produkte) {
    print(n);
  }
  if (produkte.contains('Milch')) {
    print('Milch ist enthalten');
  } else {
    print('Milch ist nicht enthalten');
  }
}
