import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Text('a' * 500),
          ),
          SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text('b' * 50),
          ),
          Container(
              width: 50,
              constraints:
                  BoxConstraints(maxWidth: 150, minWidth: 100, maxHeight: 100),
              child: Text('a' * 50),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: ProjectContainerDecoration()),
        ],
      ),
    );
  }
}


// 1.YOL
class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
          //color: Colors.red,
          gradient: LinearGradient(colors: [Colors.red, Colors.black]),
          boxShadow: [
            BoxShadow(
                color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)
          ],
          shape: BoxShape.circle,
          border: Border.all(width: 10, color: Colors.white),
          //borderRadius: BorderRadius.circular(10)
        );
}


// 2.YOL
class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
    //color: Colors.red,
    gradient: LinearGradient(colors: [Colors.red, Colors.black]),
    boxShadow: [
      BoxShadow(color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)
    ],
    shape: BoxShape.circle,
    border: Border.all(width: 10, color: Colors.white),
    //borderRadius: BorderRadius.circular(10)
  );
}
