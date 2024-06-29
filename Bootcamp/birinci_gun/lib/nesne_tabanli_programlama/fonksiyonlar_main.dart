import 'package:birinci_gun/nesne_tabanli_programlama/fonksiyonlar.dart';

void main() {
  var f = Fonksiyonlar();

  f.selamla1();

  String gelenSonuc = f.selamla2();
  print(gelenSonuc);

  f.selamla3("isim");

  String gelenSonuc2 = f.selamla4("Beşiktaş");
  print(gelenSonuc2);
}