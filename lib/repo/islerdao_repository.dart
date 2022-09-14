import 'package:todo_app/isler.dart';

class IslerDaoRepository {
  //veritabanı işlemleri için burada işlem yapılır

  Future<void> isKayit(String yapilacak_is, String is_no) async {}
  Future<void> guncelle(int yapilacak_id, String yapilacak_is, String is_no) async {}

  Future<List<Isler>> tumIsleriAl() async {
    var islerListesi = <Isler>[];
    var i1 = Isler(yapilacak_id: 1, yapilacak_is: "Kargo", is_no: "1");
    var i2 = Isler(yapilacak_id: 2, yapilacak_is: "İngilizce Çalışma", is_no: "2");
    var i3 = Isler(yapilacak_id: 3, yapilacak_is: "Kitaplık Düzenleme", is_no: "3");
    var i4 = Isler(yapilacak_id: 4, yapilacak_is: "Spor", is_no: "4");
    var i5 = Isler(yapilacak_id: 5, yapilacak_is: "Alışveriş", is_no: "5");
    var i6 = Isler(yapilacak_id: 6, yapilacak_is: "Astrolojik Danışmanlık", is_no: "6");
    islerListesi.add(i1);
    islerListesi.add(i2);
    islerListesi.add(i3);
    islerListesi.add(i4);
    islerListesi.add(i5);
    islerListesi.add(i6);
    return islerListesi;
  }

  Future<List<Isler>> isAra(String aramaKelimesi) async {
    var islerListesi = <Isler>[];
    var i1 = Isler(yapilacak_id: 1, yapilacak_is: "Kargo", is_no: "1");
    var i2 = Isler(yapilacak_id: 2, yapilacak_is: "İngilizce Çalışma", is_no: "2");

    islerListesi.add(i1);
    islerListesi.add(i2);
    return islerListesi;
  }

  Future<void> isSil(int yapilacak_id) async {}
}
