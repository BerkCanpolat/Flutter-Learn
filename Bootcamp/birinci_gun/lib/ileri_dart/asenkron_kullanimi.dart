Future<void> main() async{
  print("Verilerin alınması beklenior");
  var veri = await veriAl();
  print("Alınan Veri: $veri");
}

Future<String> veriAl() async{
  for(var i=1;i<6; i++) {
    Future.delayed(Duration(seconds: i), () => print("Veri miktarı : %${i*20}"));
  }
  return Future.delayed(Duration(seconds: 5), () => "Merhaba");
}