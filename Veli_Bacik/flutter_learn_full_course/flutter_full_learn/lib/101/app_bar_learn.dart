import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({super.key});
  final String _title = "Welcome Learn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leadingWidth: 23,
        actionsIconTheme: IconThemeData(color: Colors.red, size: 50),
        toolbarTextStyle: TextStyle(color: Colors.red),
        // Sayfada otomatik olarak 'BACK' butonu gelmesin demek.
        automaticallyImplyLeading: false,
        leading: Icon(Icons.gamepad),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          Center(child: CircularProgressIndicator()),
          Text("adsad")
        ],
      ),
    );
  }
}