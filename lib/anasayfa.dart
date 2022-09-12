import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/isler.dart';
import 'package:todo_app/detay_sayfa.dart';
import 'package:todo_app/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;
  Future<List<Isler>> tumIsleriGoster() async {
    var islerListesi = <Isler>[];
    var i1 = Isler(yapilacak_id: 1, yapilacak_is: "Kargo", is_no: "1");
    var i2 = Isler(yapilacak_id: 2, yapilacak_is: "İngilizce Çalışma", is_no: "2");
    var i3 = Isler(yapilacak_id: 3, yapilacak_is: "Kitaplık Düzenleme", is_no: "3");
    var i4 = Isler(yapilacak_id: 4, yapilacak_is: "Spor", is_no: "4");
    var i5 = Isler(yapilacak_id: 5, yapilacak_is: "Alışveriş", is_no: "5");
    islerListesi.add(i1);
    islerListesi.add(i2);
    islerListesi.add(i3);
    islerListesi.add(i4);
    islerListesi.add(i5);
    return islerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime[400],
        shadowColor: Colors.orange,
        title: aramaYapiliyorMu
            ? TextField(
                decoration: const InputDecoration(hintText: " Ara"),
                onChanged: (aramaSonucu) {
                  //harf girdikçe sildikçe çalışacak yapı
                },
              )
            : const Text(
                "Yapılacaklar",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25, color: Colors.black54),
              ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.pencil_outline), iconSize: 35.0, color: Colors.orange[700]),
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = false;
                    });
                  },
                  icon: Icon(Icons.clear),
                  iconSize: 35.0,
                  color: Colors.orange[700])
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  },
                  icon: Icon(CupertinoIcons.search),
                  iconSize: 35.0,
                  color: Colors.orange[700])
        ],
      ),
      body: FutureBuilder<List<Isler>>(
        future: tumIsleriGoster(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var islerListesi = snapshot.data;
            return ListView.builder(
              itemCount: islerListesi!.length,
              itemBuilder: (context, index) {
                var yapilacak = islerListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => DetaySayfa(
                                  yapilacak: yapilacak,
                                ))));
                  },
                  child: Card(
                    color: Colors.blueGrey[100],
                    child: Row(
                      children: [
                        Text(
                          "${yapilacak.is_no} - ${yapilacak.yapilacak_is}",
                          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("${yapilacak.yapilacak_is} silinsin mi ? "),
                                action: SnackBarAction(
                                  label: "Evet",
                                  onPressed: () {},
                                ),
                              ));
                            },
                            icon: const Icon(CupertinoIcons.delete))
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: Text("Kayıt"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const KayitSayfa())));
          //  var yapilacak = Isler(yapilacak_id: 1, yapilacak_is: "Kargo", is_no: "1");
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: ((context) => DetaySayfa(
          //                       yapilacak: yapilacak,
          //                     ))));
        },
      ),
    );
  }
}
