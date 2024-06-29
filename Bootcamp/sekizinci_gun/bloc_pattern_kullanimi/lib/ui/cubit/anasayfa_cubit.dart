import 'package:bloc_pattern_kullanimi/data/repo/matematik_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<int> {
  AnasayfaCubit() : super(0); //Varsayılan değer olarak sayar.

  var mrepo = MatematikRepo();

  void toplamaYap(String alinanSayi1, String alinanSayi2) {
    int sonuc = mrepo.toplamaYap(alinanSayi1, alinanSayi2);

    emit(sonuc); //Tetikleme ve Veri gönderme işlemini yapar.
  }

  void carpmaYap(String alinanSayi1, String alinanSayi2) {
    int sonuc = mrepo.carpmaYap(alinanSayi1, alinanSayi2);

    emit(sonuc); //Tetikleme ve Veri gönderme işlemini yapar.
  }
}
