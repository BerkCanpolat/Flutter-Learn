import 'package:birinci_gun/nesne_tabanli_programlama/a_sinifi.dart';

void main() {
  var a = ASinifi();

  //Standart kullanım
  //print(a.degisken);
  //a.metod();

  //Static kullanım
  print(ASinifi.degisken);
  ASinifi.metod();
}