import 'package:bloc_cubit_odev_app/data/entity/not.dart';
import 'package:bloc_cubit_odev_app/data/repo/notlardao_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Not>> {
  AnasayfaCubit() : super(<Not>[]);

  var nrepo = NotlardaoRepo();

  Future<void> notlariGetir() async {
    var list = await nrepo.notlariGetir();
    emit(list);
  }

    Future<void> notSil(int id) async {
    nrepo.notSil(id);
    await notlariGetir();
  }

  Future<void> notAra(String aramaKelimesi) async {
    var list = await nrepo.notAra(aramaKelimesi);
    emit(list);
  }
}