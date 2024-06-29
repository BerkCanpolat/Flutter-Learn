import 'package:flutter/material.dart';

class WidgetAnasayfa extends StatefulWidget {
  const WidgetAnasayfa({super.key});

  @override
  State<WidgetAnasayfa> createState() => _WidgetAnasayfaState();
}

class _WidgetAnasayfaState extends State<WidgetAnasayfa> {
  var veri = TextEditingController();
  String alinanVeri = "";
  String resimAdi = "mutlu.png";
  bool switchKontrol = false;
  bool checkBoxKontrol = false;
  int radioDeger = 0;
  bool progressKontrol = false;
  double ilerleme = 30.0;
  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();

  var ulkelerListesi = <String>[];
  String secilenUlke = "Türkiye";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ulkelerListesi.add("Türkiye");
    ulkelerListesi.add("İtalya");
    ulkelerListesi.add("Japonya");
    ulkelerListesi.add("Almanya");
    ulkelerListesi.add("Hollanda");
    ulkelerListesi.add("Fransa");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              //TEXTFİELD ÇALIŞMASI BAŞLANGIÇ
              Text("Alınan Veri: $alinanVeri"),
              TextField(
                controller: veri,
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  alinanVeri = veri.text;
                });
              }, child: Text("Veriyi al")),
              //TEXTFİELD ÇALIŞMASI BİTİŞ
        
              //RESİM ÇALIŞMASI BAŞLANGIÇ
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      resimAdi = "mutlu.png";
                    });
                  }, child: Text("Resim1")),
                  Image.asset("resimler/$resimAdi"),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      resimAdi = "mutsuz.png";
                    });
                  }, child: Text("Resim2")),
                ],
              ),
              //RESİM ÇALIŞMASI BİTİŞ
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    child: SwitchListTile(
                      title: const Text("Dart"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: switchKontrol, 
                      onChanged: (veri){
                        setState(() {
                          switchKontrol = veri;
                        });
                      }
                      ),
                  ),
                  SizedBox(
                    width: 190,
                    child: CheckboxListTile(
                      title: const Text("Flutter"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: checkBoxKontrol, 
                      onChanged: (veri){
                        setState(() {
                          checkBoxKontrol = veri!;
                        });
                      }
                      ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 180,
                    child: RadioListTile(
                      title: Text("Barcelona"),
                      value: 1, 
                      groupValue: radioDeger, 
                      onChanged: (veri) {
                        radioDeger = veri!;
                      }
                      ),
                  ),
                  SizedBox(
                    width: 195,
                    child: RadioListTile(
                      title: Text("Real Madrid"),
                      value: 2, 
                      groupValue: radioDeger, 
                      onChanged: (veri) {
                        radioDeger = veri!;
                      }
                      ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progressKontrol = true;
                    });
                  }, child: Text("Başla"),),
                  Visibility(visible: progressKontrol,child: const CircularProgressIndicator()),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progressKontrol = false;
                    });
                  }, child: Text("Dur"),),
                ],
              ),
              Text(ilerleme.toInt().toString()),
              Slider(
                max: 100.0,
                min: 0.0,
                value: ilerleme, 
                onChanged: (veri){
                  setState(() {
                    ilerleme = veri;
                  });
                }),
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: TextField(
                        controller: tfSaat,
                        decoration: InputDecoration(hintText: "Saat"),
                      ),
                    ),
                    IconButton(onPressed: (){
                      showTimePicker(
                        context: context, 
                        initialTime: TimeOfDay.fromDateTime(DateTime.now()))
                        .then((value) {
                          tfSaat.text = "${value!.hour} - ${value.minute}";
                        });
                    }, icon: Icon(Icons.access_time),),
                    SizedBox(
                      width: 120,
                      child: TextField(
                        controller: tfTarih,
                        decoration: InputDecoration(hintText: "Tarih"),
                      ),
                    ),
                    IconButton(onPressed: (){
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000), 
                        lastDate: DateTime(2030))
                        .then((value) {
                          tfTarih.text = "${value!.day} - ${value.month} - ${value.year}";
                        });
                    }, icon: Icon(Icons.date_range),),
                  ],
                ),
                DropdownButton(
                  value: secilenUlke,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: ulkelerListesi.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e),);
                  }).toList(),
                  onChanged: (veri) {
                    setState(() {
                      secilenUlke = veri!;
                    });
                  }
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Containere tıklandı");
                    },
                    onDoubleTap: () {
                      print("Containere 2 kere tıklandı");
                    },
                    onLongPress: () {
                      print("Containere uzun tıklandı");
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.red,
                    ),
                  ),
              ElevatedButton(onPressed: (){
                print("Switch Durum: $switchKontrol");
                print("CheckBox: $checkBoxKontrol");
                print("RadioButton: $radioDeger");
                print("Slider Durum: $ilerleme");
                print("Seçilen Ülke: $secilenUlke");
              }, child: Text("Göster"))
            ],
          ),
        ),
      ),
    );
  }
}