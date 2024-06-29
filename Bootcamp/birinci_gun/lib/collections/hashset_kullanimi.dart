import 'dart:collection';

void main() {
  var plakalar = HashSet.from([16,24,55]);
  var meyveler = HashSet<String>();

  meyveler.add("Kiraz");
  meyveler.add("Muz");
  meyveler.add("Karpuz");
  print(meyveler);

  String meyve = meyveler.elementAt(1);
  print(meyve);
}