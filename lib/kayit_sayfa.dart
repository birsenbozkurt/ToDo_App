import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfYapilacakIs = TextEditingController();
  var tfIsNo = TextEditingController();

  Future<void> kayit(String yapilacak_is, String is_no) async {
    print("İş Kayıt : ${yapilacak_is} - ${is_no}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime[400],
        shadowColor: Colors.purple,
        title: const Text(
          "İş Kayıt",
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 22, color: Colors.black54),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.pencil_outline), iconSize: 35.0, color: Colors.orange[700])],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfYapilacakIs,
                decoration: const InputDecoration(hintText: "Yapılacak İş"),
              ),
              TextField(
                controller: tfIsNo,
                decoration: const InputDecoration(hintText: "İş No"),
              ),
              ElevatedButton(
                  onPressed: () {
                    kayit(tfYapilacakIs.text, tfIsNo.text);
                  },
                  child: const Text("KAYDET"))
            ],
          ),
        ),
      ),
    );
  }
}
