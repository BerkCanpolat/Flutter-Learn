import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: (){},
                title: RandomImage(),
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                //Dense sıkıştırmaya yarar
                dense: true,
                subtitle: Text('How do you use your card'),
                leading: Container(
                  color: Colors.red,
                  height: 50,
                  width: 23,
                  alignment: Alignment.topCenter,
                  child: Icon(Icons.money)),
                trailing: Icon(Icons.chevron_right_sharp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}