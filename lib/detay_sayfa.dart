import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:todo_app/entity/isler.dart';

class DetaySayfa extends StatefulWidget {
  Isler yapilacak;
  DetaySayfa({
    Key? key,
    required this.yapilacak,
  }) : super(key: key);

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var tfYapilacakIs = TextEditingController();
  var tfIsNo = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var yapilacak = widget.yapilacak;
    tfYapilacakIs.text = yapilacak.yapilacak_is;
    tfIsNo.text = yapilacak.is_no;
  }

  Future<void> guncelle(int yapilacak_id, String yapilacak_is) async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime[400],
        shadowColor: Colors.purple,
        title: const Text(
          "İş Detay",
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
                    guncelle(widget.yapilacak.yapilacak_id, tfYapilacakIs.text);
                  },
                  child: const Text("GÜNCELLE"))
            ],
          ),
        ),
      ),
    );
  }
}
