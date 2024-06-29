import 'package:besincigun_tasarim_odev/renkler.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  String icerik;
  ButtonText({required this.icerik});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: TextButton(
          onPressed: () {},
          child: Text(
            icerik,
            style: TextStyle(color: yaziRenk2),
          ),
          style: TextButton.styleFrom(backgroundColor: yaziRenk1),
        ),
      ),
    );
  }
}
