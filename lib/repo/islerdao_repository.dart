import 'package:todo_app/isler.dart';
import 'package:todo_app/sqlite/veritabani_yardimcisi.dart';

class IslerDaoRepository {
  //veritabanı işlemleri için burada işlem yapılır

  Future<void> isKayit(String yapilacak_is, String is_no) async {
    var db= await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler= Map<String,dynamic>();
    bilgiler["yapilacak_is"]=yapilacak_is;
    bilgiler["is_no"]=is_no;
    await db.insert("yapilacaklar", bilgiler);
  }

  Future<void> guncelle(int yapilacak_id, String yapilacak_is, String is_no) async {
    var db=await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler=Map<String,dynamic>();
    bilgiler["yapilacak_is"]=yapilacak_is;
    bilgiler["is_no"]=is_no;
    await db.update("yapilacaklar", bilgiler,where:"yapilacak_id= ?",whereArgs: [yapilacak_id]);
  }

  Future<List<Isler>> tumIsleriAl() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    //dynamic her türde olabilir
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM yapilacaklar");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Isler(yapilacak_id: satir["yapilacak_id"], yapilacak_is: satir["yapilacak_is"], is_no: satir["is_no"]);
    });
  }

  Future<List<Isler>> isAra(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    //dynamic her türde olabilir
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM yapilacaklar WHERE yapilacak_is like '%$aramaKelimesi%'");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Isler(yapilacak_id: satir["yapilacak_id"], yapilacak_is: satir["yapilacak_is"], is_no: satir["is_no"]);
    });
  }

  Future<void> isSil(int yapilacak_id) async {
    var db=await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("yapilacaklar",where:"yapilacak_id= ?",whereArgs: [yapilacak_id]);
  }
}
