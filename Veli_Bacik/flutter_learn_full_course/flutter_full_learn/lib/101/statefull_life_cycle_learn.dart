import 'package:flutter/material.dart';

class StatefullLifeCycleLearn extends StatefulWidget {
  const StatefullLifeCycleLearn({super.key, required this.message});
  final String message;

  @override
  State<StatefullLifeCycleLearn> createState() => _StatefullLifeCycleLearnState();
}

class _StatefullLifeCycleLearnState extends State<StatefullLifeCycleLearn> {
  String _message = '';
  late final bool _isOdd;

  //initState'den sonra çalışır.
  //Komple sayfamız yenilendiğinde tekrar tekrar çağırılır.
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDepencies");

  }

  @override
  void didUpdateWidget(covariant StatefullLifeCycleLearn oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
    if(oldWidget.message != widget.message) {
      _message = widget.message;
      _computeName();
    }
  }

  //Sayfanın öldüğü anda çalışır.
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Alo");
    _message = "";
  }


  //Ekran başladığında önce initState çalışır ve ardından build edilir.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _computeName();
    print("initState");

  }

  void _computeName() {
    if(_isOdd) {
      _message += "Çift";
    } else {
      _message += "Tek";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //isEven => Çift, isOdd => Tek
        title: Text(_message),
      ),
      body: _isOdd ? TextButton(onPressed: (){
        setState(() {
          _message = 'a';
        });
      }, child: Text(_message)) :
      ElevatedButton(onPressed: (){}, child: Text(_message)),
    );
  }
}