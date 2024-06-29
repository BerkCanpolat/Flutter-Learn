import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';

class KisilerdaoRepository {
  Future<void> kaydet(String kisi_ad, String kisi_tel) async {
    print("Kişi Kaydet: $kisi_ad - $kisi_tel");
  }

  Future<void> guncelle(int kisi_id, String kisi_ad, String kisi_tel) async {
    print("Kişi Güncelle: $kisi_ad - $kisi_tel - $kisi_id");
  }

  Future<List<Kisiler>> kisileriYukle() async {
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "111111");
    var k2 = Kisiler(kisi_id: 2, kisi_ad: "Berk", kisi_tel: "5451234");
    var k3 = Kisiler(kisi_id: 3, kisi_ad: "Ali", kisi_tel: "32432423");

    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);

    return kisilerListesi;
  }

  Future<List<Kisiler>> ara(String aramaKelimesi) async {
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "111111");

    kisilerListesi.add(k1);

    return kisilerListesi;
  }

  Future<void> sil(int kisi_id) async {
    print("Kişi Sil: $kisi_id");
  }
}
