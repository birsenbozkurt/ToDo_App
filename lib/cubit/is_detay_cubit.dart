import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/repo/islerdao_repository.dart';

class IsDetayCubit extends Cubit<void> {
  IsDetayCubit() : super(0);

  var irepo = IslerDaoRepository();

  Future<void> guncelle(int yapilacak_id, String yapilacak_is, String is_no) async {
    await irepo.guncelle(yapilacak_id, yapilacak_is, is_no);
  }
}
