import 'package:flutter/material.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({super.key});

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(color: Colors.white,);
        },
        itemCount: 10,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 300,
            child: Column(
              children: [
                Expanded(child: Image.network('https://picsum.photos/200/300')),
                Text('BERK'),
              ],
            ),
          );
        },
      ),
    );
  }
}