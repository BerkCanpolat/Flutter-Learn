import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_button_special.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_navigate_managers.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_padding.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_size.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_text.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_title.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/robo_colors.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/robo_image.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/robo_sign.dart';

class RoboDemos extends StatelessWidget with RoboNavigateManagers{
  const RoboDemos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: RoboPadding.homeGeneral,
        child: Column(
          children: [
            const Padding(
              padding: RoboPadding.homeImage,
              child: Center(child: RoboImage(path: RoboImagePath.roboImage)),
            ),
            const Padding(
              padding: RoboPadding.homeTitle,
              child: RoboText(title: RoboTitle.roboHomeTitle),
            ),
            const Spacer(),
            Padding(
              padding: RoboPadding.homeButton,
              child: Container(
                height: RoboSize.homeButtonContainerSize,
                width: double.infinity,
                child: RoboButtonSpecial(
                  title: RoboTitle.roboButtonHome, 
                  voidCallback: (){
                    roboNavigate(context, RoboSign());
                  },
                  backColor: RoboColors.roboTextColor,
                  color: RoboColors.roboButtonTextColor,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}