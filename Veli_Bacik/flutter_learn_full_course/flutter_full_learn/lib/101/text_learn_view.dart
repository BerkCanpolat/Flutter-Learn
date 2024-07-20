import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({super.key, this.userName,});

  final String name = 'Berk';
  final String? userName;
  final ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome $name ${name.length}',
              style: const TextStyle(
                  //WodSpacing => Kelimelerin arasına boşluk koyar.
                  wordSpacing: 5,
                  //LetterSpacing => Harflerin arasına boşluk koyar.
                  letterSpacing: 5,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  //TextDecoration => Yazının altı, üstü çizgili hale getirir.
                  decoration: TextDecoration.lineThrough,
                  fontStyle: FontStyle.italic,
                  height: 2,
                  color: Colors.red),
              //MaxLines => Satırın max kaç olacağını belirler.
              maxLines: 2,
              //OverFlow => 2'den fazla satır varsa 3 nokta olmasını sağlar.
              overflow: TextOverflow.ellipsis,
              //TextAlign => Yazının ortada, sağda, solda olmasını sağlar.
              textAlign: TextAlign.right,
            ),
            Text(
              'Hello $name ${name.length}',
              style: ProjectStyles.welcomeStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
            ),
            Text(
              'Hello $name ${name.length}',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: ProjectColors.welcomecolor
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
            ),
            Text(userName ?? ""),
            Text(keys.welcomeString),
          ],
        ),
      ),
    );
  }
}

class ProjectStyles {
  static TextStyle welcomeStyle = const TextStyle(
      wordSpacing: 5,
      letterSpacing: 5,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.lineThrough,
      fontStyle: FontStyle.italic,
      height: 5,
      color: Colors.red);
}

class ProjectColors {
  //Bu şekilde hotRestart atmamız gerek.
  static Color welcomecolor = Colors.yellow;
  // Bu şekilde direk değişikliği görebiliriz. 
  static Color get welcomecolors => Colors.yellow;
}

class ProjectKeys {
  final String welcomeString = "Merhaba";
}