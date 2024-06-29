import 'package:birinci_gun/nesne_tabanli_programlama/kalitim/ev.dart';

class Villa extends Ev{
  bool garajVarmi;

  Villa({required this.garajVarmi, required int pencere_sayisi}) : super(pencere_sayisi: pencere_sayisi);
}