import 'package:flutter/material.dart';

class KullaniciEtkilesimi extends StatefulWidget {
  const KullaniciEtkilesimi({super.key});

  @override
  State<KullaniciEtkilesimi> createState() => _KullaniciEtkilesimiState();
}

class _KullaniciEtkilesimiState extends State<KullaniciEtkilesimi> {
  var tfControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kullanıcı Etkileşimi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Default Snackbar"),
                      action: SnackBarAction(
                          label: "Evet",
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text("hehe"),
                            ));
                          }),
                    ),
                  );
                },
                child: Text("Snackbar")),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        "Özel Snackbar",
                        style: TextStyle(color: Colors.orange),
                      ),
                      backgroundColor: Colors.white,
                      action: SnackBarAction(
                          label: "Evet",
                          textColor: Colors.red,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text("hehe"),
                              backgroundColor: Colors.orange,
                            ));
                          }),
                    ),
                  );
                },
                child: Text("Snackbar(özel)")),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Başlık"),
                          content: const Text("İçerik"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("İptal")),
                            TextButton(onPressed: () {}, child: Text("Tamam")),
                          ],
                        );
                      });
                },
                child: Text("Alert")),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Başlık"),
                          content: TextField(
                            controller: tfControl,
                            decoration: InputDecoration(hintText: "Veri"),
                          ),
                          backgroundColor: Colors.lightGreen,
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("İptal")),
                            TextButton(onPressed: () {
                              print("Kaydedilen Veri: ${tfControl.text}");
                            }, child: Text("Tamam")),
                          ],
                        );
                      });
                },
                child: Text("Alert(özel)")),
          ],
        ),
      ),
    );
  }
}
