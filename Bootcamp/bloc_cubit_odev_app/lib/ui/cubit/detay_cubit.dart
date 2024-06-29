import 'package:bloc_cubit_odev_app/data/repo/notlardao_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetayCubit extends Cubit<void> {
  DetayCubit() : super(0);

  var nrepo = NotlardaoRepo();

  Future<void> notGuncelle(
      int id, String not_basligi, String not_icerik) async {
   await nrepo.notGuncelle(id, not_basligi, not_icerik);
  }
}
