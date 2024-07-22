import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPadding.pagePaddingVertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: Container(
                color: Colors.white,
                height: 100,
              ),
            ),
            Padding(
              padding: ProjectPadding.pagePaddingRightOnly,
              child: Text('Berk'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectPadding {
  static final pagePaddingVertical = const EdgeInsets.symmetric(vertical: 10);
  static final pagePaddingRightOnly = const EdgeInsets.only(right: 20);
}