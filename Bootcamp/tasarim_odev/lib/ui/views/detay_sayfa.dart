import 'package:flutter/material.dart';
import 'package:tasarim_odev/data/entity/product.dart';

class DetaySayfa extends StatefulWidget {
  Product urun;
  DetaySayfa({required this.urun});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.urun.urun_isim),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/${widget.urun.urun_resim}",
              width: 350,
              height: 350,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.urun.urun_isim,
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        "${widget.urun.urun_fiyat} \$",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55, right: 40, top: 150, bottom: 30),
                  child: Row(
                    children: [
                      Text("Graphite Color",style: TextStyle(fontWeight: FontWeight.bold),),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.hexagon,
                            color: Colors.green,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.hexagon,
                            color: Colors.purple,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.hexagon,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  width: 350,
                  height: 55,
                  child: ElevatedButton(onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Ürün Karta Eklensin Mi?"),
                      action: SnackBarAction(label: "Evet", onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Ürün Karta Eklendi!"))
                        );
                      }),
                      ),
                    );
                  }, child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Add to cart",style: TextStyle(color: Colors.white),),
                      const Padding(padding: EdgeInsets.only(left: 10, right: 10)),
                      Icon(Icons.badge,color: Colors.white,)
                    ],
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
