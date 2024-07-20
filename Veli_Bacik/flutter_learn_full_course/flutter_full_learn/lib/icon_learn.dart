import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({super.key});
  final IconSizes iconSizes = IconSizes();
  final IconColors iconColors = IconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.message_rounded),
            color: iconColors.froly,
            iconSize: iconSizes.iconSmall,
          ),
          SizedBox(height: 10,),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.message_rounded),
            color: Theme.of(context).dialogBackgroundColor,
            iconSize: IconSizes.iconSmall2x,
          ),
        ],
      ),
    );
  }
}

class IconSizes {
  final double iconSmall = 40;
  static double iconSmall2x = 80;
}

class IconColors {
  final Color froly = Color(0xFFED617A);
}