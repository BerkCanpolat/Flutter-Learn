import 'package:birinci_gun/nesne_tabanli_programlama/araba.dart';

void main() {
  //Nesne Oluşturma.
  var bmw = Araba(renk: "Siyah", hiz: 100, calisiyorMu: true);

  bmw.bilgiAl();

  print("-------------------");
  bmw.renk = "Mor";
  bmw.hiz = 0;
  bmw.calisiyorMu = true;

  bmw.bilgiAl();
  bmw.calistir();
  bmw.bilgiAl();
  bmw.hizlanDir(50);
  bmw.bilgiAl();
  
  var sahin = Araba(renk: "Beyaz", hiz: 0, calisiyorMu: false);
}