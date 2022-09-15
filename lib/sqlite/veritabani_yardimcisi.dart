import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi {
  //static direkt sınıf ismiyle erişebiliriz
  static final String veritabaniAdi = "isler.sqlite";

  static Future<Database> veritabaniErisim() async {
    String veritabaniYolu = join(await getDatabasesPath(), veritabaniAdi);

    if (await databaseExists(veritabaniYolu)) {
      print("Veritabanı zaten var");
    } else {
      //Kopyalama işlemi
      ByteData data = await rootBundle.load("veritabani/$veritabaniAdi");
      //kopyalamak için   lerden oluşan bytın türevi
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(veritabaniYolu).writeAsBytes(bytes, flush: true);
      print("Veritabanı Kopyalandı");
    }
    return openDatabase(veritabaniYolu);
  }
}
