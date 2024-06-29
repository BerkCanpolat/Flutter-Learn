import 'package:birinci_gun/nesne_tabanli_programlama/enum_konserve_boyut.dart';

void main() {
  ucretHesapla(KonserveBoyut.kucuk, 20);
}

void ucretHesapla(KonserveBoyut boyut,int adet) {
  switch(boyut) {
    case KonserveBoyut.kucuk: {
      print("Toplam Maliyet: ${adet * 32}");
    }
    break;
    case KonserveBoyut.orta: {
      print("Toplam Maliyet: ${adet * 45}");
    }
    break;
    case KonserveBoyut.buyuk: {
      print("Toplam Maliyet: ${adet * 67}");
    }
    break;
  }
}