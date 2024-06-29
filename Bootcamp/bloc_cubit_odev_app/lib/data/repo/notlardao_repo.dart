import 'package:bloc_cubit_odev_app/data/entity/not.dart';
import 'package:bloc_cubit_odev_app/sqlite/veritabani_yardimcisi.dart';

class NotlardaoRepo {

  Future<void> notEkle(String not_basligi, String not_icerik) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var yeniNot = Map<String,dynamic>();
    yeniNot["not_basligi"] = not_basligi;
    yeniNot["not_icerik"] = not_icerik;
    await db.insert("not", yeniNot);
  }

  Future<void> notGuncelle(int id, String not_basligi, String not_icerik) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var guncellenenNot = Map<String,dynamic>();
    guncellenenNot["id"] = id;
    guncellenenNot["not_basligi"] = not_basligi;
    guncellenenNot["not_icerik"] = not_icerik;
    await db.update("not", guncellenenNot, where: "id = ?", whereArgs: [id]);
  }

  Future<List<Not>> notlariGetir() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery('SELECT * FROM "not"');
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Not(id: satir["id"], not_basligi: satir["not_basligi"], not_icerik: satir["not_icerik"]);
    });
  }


    Future<void> notSil(int id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("not", where: "id = ?", whereArgs: [id]);
  }

    Future<List<Not>> notAra(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery('SELECT * FROM "not" WHERE not_basligi like "%$aramaKelimesi%"');
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Not(id: satir["id"], not_basligi: satir["not_basligi"], not_icerik: satir["not_icerik"]);
    });
  }
}
