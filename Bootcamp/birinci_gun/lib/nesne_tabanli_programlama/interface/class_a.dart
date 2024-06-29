import 'package:birinci_gun/nesne_tabanli_programlama/interface/myInterface.dart';

class ClassA implements Myinterface{
  @override
  int degisken = 10;

  @override
  void metod1() {
    // TODO: implement metod1
    print("Metod1 Çalıştı");
  }

  @override
  String metod2() {
    // TODO: implement metod2
    return "Metod 2 çalıştı";
  }
}