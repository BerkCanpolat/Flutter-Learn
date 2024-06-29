import 'package:bloc_cubit_odev_app/data/repo/notlardao_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KayitCubit extends Cubit<void> {
  KayitCubit() : super(0);

  var nrepo = NotlardaoRepo();

    Future<void> notEkle(String not_basligi, String not_icerik) async {
    await nrepo.notEkle(not_basligi, not_icerik);
  }
}