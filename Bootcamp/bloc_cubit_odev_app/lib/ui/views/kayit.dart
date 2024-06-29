import 'package:bloc_cubit_odev_app/ui/cubit/kayit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfNotBaslik = TextEditingController();
  var tfNoticerik = TextEditingController();

  bool isNotBaslikEmpty = true;

  @override
  void initState() {
    super.initState();
    tfNotBaslik.addListener(() {
      setState(() {
        isNotBaslikEmpty = tfNotBaslik.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    tfNotBaslik.dispose();
    tfNoticerik.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Not Ekle"),
        actions: [
          IconButton(
            onPressed: isNotBaslikEmpty ? null : () {
              context.read<KayitCubit>().notEkle(tfNotBaslik.text, tfNoticerik.text);
            },
            icon: Icon(
              Icons.done,
              color: isNotBaslikEmpty ? Colors.black : Colors.green,
            ),
            iconSize: 30,
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: tfNotBaslik,
            decoration: InputDecoration(
                hintText: "Not Başlık",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                border: InputBorder.none),
            maxLines: null,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: tfNoticerik,
            decoration: InputDecoration(
                hintText: "Not İçerik",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 60),
                border: InputBorder.none),
            maxLines: null,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
