import 'package:filmler_app/data/entity/filmler.dart';

class FilmlerCevap {
  List<Filmler> filmler;
  int success;

  FilmlerCevap({required this.filmler, required this.success});

  factory FilmlerCevap.fromJson(Map<String,dynamic> json) {
    var cevap = json["filmler"] as List;
    var success = json["success"] as int;
    
    var gelenFilmler = cevap.map((jsonArrayNesnesi) => Filmler.fromJson(jsonArrayNesnesi)).toList();

    return FilmlerCevap(filmler: gelenFilmler, success: success);
  }
}