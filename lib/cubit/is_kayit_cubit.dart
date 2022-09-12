import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/repo/islerdao_repository.dart';

class IsKayitCubit extends Cubit<void> {
  IsKayitCubit() : super(0);

  var irepo = IslerDaoRepository();

  Future<void> kayit(String yapilacak_is, String is_no) async {
    await irepo.isKayit(yapilacak_is, is_no);
  }
}
