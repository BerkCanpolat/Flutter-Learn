import 'package:flutter/material.dart';

class CalismaAnasayfa extends StatefulWidget {
  const CalismaAnasayfa({super.key});

  @override
  State<CalismaAnasayfa> createState() => _CalismaAnasayfaState();
}

class _CalismaAnasayfaState extends State<CalismaAnasayfa> {
  int sayac = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Sonuç: $sayac"),
            ElevatedButton(onPressed: (){
              setState(() {
                sayac += 1;
              });
            }, child: Text("Arttır")
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                sayac -= 1;
              });
            }, child: Text("Azalt")
            ),
          ],
        ),
      ),
    );
  }
}