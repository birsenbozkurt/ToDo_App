import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/isler.dart';
import 'package:todo_app/repo/islerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Isler>> {
  AnasayfaCubit() : super(<Isler>[]);

  var irepo = IslerDaoRepository();
  //arayüze tüm kişileri yüklemek
  Future<void> isleriYukle() async {
    var liste = await irepo.tumIsleriAl();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await irepo.isAra(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int yapilacak_id) async {
    await irepo.isSil(yapilacak_id);
    await isleriYukle();
  }
}
