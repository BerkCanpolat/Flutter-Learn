import 'package:birinci_gun/nesne_tabanli_programlama/kalitim/ev.dart';
import 'package:birinci_gun/nesne_tabanli_programlama/kalitim/saray.dart';
import 'package:birinci_gun/nesne_tabanli_programlama/kalitim/villa.dart';

void main() {
  var topkapiSarayi = Saray(kule_sayisi: 10, pencere_sayisi: 300);

  print(topkapiSarayi.kule_sayisi);
  print(topkapiSarayi.pencere_sayisi);

  var bogazVilla = Villa(garajVarmi: true, pencere_sayisi: 50);

  print(bogazVilla.garajVarmi);
  print(bogazVilla.pencere_sayisi);

  //Ev'i villaya dönüştürürsek Downcasting - Sarayı Ev'e Dönüştürüyorsak buna UpCasting Denir.

  //Tip Kontrolü
  if(topkapiSarayi is Saray) {
    print("Saraydır");
  } else {
    print("Saray Değildir");
  }

  //Downcasting
  var ev = Ev(pencere_sayisi: 10);
  var saray = ev as Saray;

  //Upcasting
  var s = Saray(kule_sayisi: 3, pencere_sayisi: 100);
  Ev e = s;
}