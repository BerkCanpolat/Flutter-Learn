import 'package:bloc_cubit_odev_app/data/entity/not.dart';
import 'package:bloc_cubit_odev_app/ui/cubit/anasayfa_cubit.dart';
import 'package:bloc_cubit_odev_app/ui/views/detay.dart';
import 'package:bloc_cubit_odev_app/ui/views/kayit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool aramaYapildiMi = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnasayfaCubit>().notlariGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: aramaYapildiMi ? 
      TextField(onChanged: (value) {
        context.read<AnasayfaCubit>().notAra(value);
      },) : 
      Text("Notlarım"),
      actions: [
        aramaYapildiMi ?
        IconButton(
          onPressed: (){
            setState(() {
              aramaYapildiMi = false;
            });
            context.read<AnasayfaCubit>().notlariGetir();
          }, 
          icon: Icon(Icons.clear),
          ) : IconButton(onPressed: (){
            setState(() {
              aramaYapildiMi = true;
            });
          }, icon: Icon(Icons.search))
      ],
      ),
      body: BlocBuilder<AnasayfaCubit,List<Not>>(
        builder: (context, notlarimiGetir) {
          if(notlarimiGetir.isNotEmpty) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.2,
                ), 
                itemCount: notlarimiGetir!.length,
              itemBuilder: (context, index) {
                var not = notlarimiGetir[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(notlar: not,))).then((value) {
                      context.read<AnasayfaCubit>().notlariGetir();
                    });
                  },
                  onLongPress: () {
                    context.read<AnasayfaCubit>().notSil(not.id);
                  },
                  child: Card(
                    color: Colors.black87,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(not.not_basligi,style: 
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
                          textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(not.not_icerik,style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              );
          } else {
            return Center();
          }
        }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => KayitSayfa())).then((value) {
              context.read<AnasayfaCubit>().notlariGetir();
            });
          },
          child: Icon(Icons.note_add,color: Colors.white,),
          backgroundColor: Colors.pink,
          ),
    );
  }
}