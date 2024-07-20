import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/container_sizedbox_learn.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scaffold Samples'),),
      body: Text('merhaba'),
      backgroundColor: Colors.red,
      extendBody: true,
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context, builder: (context) => Container(
          height: 200,
          color: Colors.white,
        ));
      }, child: Text('a'),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(),
      bottomNavigationBar: Container(
        width: 200,
        height: 200,
        decoration: ProjectContainerDecoration(),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'Settings'),
            BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'Profile'),
          ]
        ),
      ),
    );
  }
}