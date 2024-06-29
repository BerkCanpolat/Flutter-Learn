import 'package:birinci_gun/nesne_tabanli_programlama/composition/filmler.dart';
import 'package:birinci_gun/nesne_tabanli_programlama/composition/kategoriler.dart';
import 'package:birinci_gun/nesne_tabanli_programlama/composition/yonetmenler.dart';

void main() {
  var k1 = Kategoriler(kategori_id: 1, kategori_ad: "Korku");
  var k2 = Kategoriler(kategori_id: 2, kategori_ad: "Komedi");

  var y1 = Yonetmenler(yonetmen_id: 1, yonetmen_ad: "Nuri Bilge Ceylan");
  var y2 = Yonetmenler(yonetmen_id: 2, yonetmen_ad: "Ali Atay");

  var f1 = Filmler(film_id: 1, film_ad: "Ruhlar Bölgesi", film_yil: 2013, kategori: k1, yonetmen: y1);
  var f2 = Filmler(film_id: 2, film_ad: "Ölümlü Dünya", film_yil: 2024, kategori: k2, yonetmen: y2);

  print("Film İD: ${f1.film_id}");
  print("Film Ad: ${f1.film_ad}");
  print("Film Yıl: ${f1.film_yil}");
  print("Film Kategori: ${f1.kategori.kategori_ad}");
  print("Film Yönetmen: ${f1.yonetmen.yonetmen_ad}");

  print("-------------------------------");

    print("Film İD: ${f2.film_id}");
  print("Film Ad: ${f2.film_ad}");
  print("Film Yıl: ${f2.film_yil}");
  print("Film Kategori: ${f2.kategori.kategori_ad}");
  print("Film Yönetmen: ${f2.yonetmen.yonetmen_ad}");
}