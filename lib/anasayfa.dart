import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/cubit/anasayfa_cubit.dart';
import 'package:todo_app/isler.dart';
import 'package:todo_app/detay_sayfa.dart';
import 'package:todo_app/kayit_sayfa.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().isleriYukle();
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
                  context.read<AnasayfaCubit>().ara(aramaSonucu);
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
                    context.read<AnasayfaCubit>().isleriYukle();
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
      body: BlocBuilder<AnasayfaCubit, List<Isler>>(
        builder: (context, islerListesi) {
          if (islerListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: islerListesi.length,
              itemBuilder: (context, index) {
                var yapilacak = islerListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => DetaySayfa(
                                  yapilacak: yapilacak,
                                )))).then((value) {
                      context.read<AnasayfaCubit>().isleriYukle();
                    });
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
                                  onPressed: () {
                                    context.read<AnasayfaCubit>().sil(yapilacak.yapilacak_id);
                                  },
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
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const KayitSayfa()))).then((value) {
            context.read<AnasayfaCubit>().isleriYukle();
          });
        },
      ),
    );
  }
}
