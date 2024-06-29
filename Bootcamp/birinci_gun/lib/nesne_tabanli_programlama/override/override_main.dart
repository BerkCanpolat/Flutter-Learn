import 'package:birinci_gun/nesne_tabanli_programlama/override/hayvan.dart';
import 'package:birinci_gun/nesne_tabanli_programlama/override/kedi.dart';
import 'package:birinci_gun/nesne_tabanli_programlama/override/kopek.dart';
import 'package:birinci_gun/nesne_tabanli_programlama/override/memeli.dart';

void main() {
  var hayvan = Hayvan();
  var memeli = Memeli();
  var kedi = Kedi();
  var kopek = Kopek();

  hayvan.sesCikar();
  memeli.sesCikar();
  kedi.sesCikar();
  kopek.sesCikar();


}