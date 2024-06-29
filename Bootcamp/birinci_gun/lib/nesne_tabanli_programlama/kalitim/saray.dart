import 'package:birinci_gun/nesne_tabanli_programlama/kalitim/ev.dart';

class Saray extends Ev{
  int kule_sayisi;

  //super ---> Bir üst sınıfı temsil eder
  Saray({required this.kule_sayisi, required int pencere_sayisi}) : super(pencere_sayisi: pencere_sayisi);
}