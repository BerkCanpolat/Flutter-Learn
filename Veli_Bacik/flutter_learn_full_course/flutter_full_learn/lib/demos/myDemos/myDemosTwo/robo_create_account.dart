import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_button_special.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_mailtextfield.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_navigate_managers.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_padding.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_richtext.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_sign_ortext.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_size.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_textfield.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_title.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/robo_colors.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/robo_home.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/robo_sign.dart';

class RoboCreateAccount extends StatelessWidget with RoboNavigateManagers {
  const RoboCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: RoboPadding.homeGeneral,
        child: Column(
          children: [
            CustomRoboLargeTitle(title: RoboTitle.createHeadTitle),
            RoboMailtextfield(),
            SizedBox(
              height: 20,
            ),
            RoboTextfield(),
            SizedBox(height: 20,),
            RoboTextfield(),
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                _CustomCreateTitle()
              ],
            ),
            Padding(
              padding: RoboPadding.createButtonSignUp,
              child: Container(
                width: double.infinity,
                height: RoboSize.homeButtonContainerSize,
                child: RoboButtonSpecial(
                  voidCallback: (){
                    roboNavigate(context, RoboHome());
                  }, 
                  backColor: RoboColors.roboTextColor, 
                  color: RoboColors.roboButtonTextColor,
                  title: RoboTitle.createButtonSignUp,
                  ),
              ),
            ),
            const Row(
              children: [
                Expanded(
                    child: Divider(
                  color: RoboColors.roboSignTextColor,
                )),
                Padding(
                    padding: RoboPadding.signOrTextPadding,
                    child: RoboSignOrtext(title: RoboTitle.createOrTitle)),
                Expanded(
                    child: Divider(
                  color: RoboColors.roboSignTextColor,
                )),
              ],
            ),
            Padding(
              padding: RoboPadding.createButtonRowGeneral,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 65,
                    child: RoboButtonSpecial(
                      voidCallback: (){}, 
                      backColor: RoboColors.roboButtonTextColor, 
                      color: RoboColors.roboTextColor,
                      icon: Icon(Icons.facebook, size: RoboSize.createButtonSocialSize,),
                      borderSide: BorderSide(color: RoboColors.roboSignTextColor),
                    ),
                  ),
                  Container(
                    height: 65,
                    child: RoboButtonSpecial(
                      voidCallback: (){}, 
                      backColor: RoboColors.roboButtonTextColor, 
                      color: RoboColors.roboTextColor,
                      icon: Icon(Icons.apple, size: RoboSize.createButtonSocialSize,),
                      borderSide: BorderSide(color: RoboColors.roboSignTextColor),
                    ),
                  ),
                  Container(
                    height: 65,
                    child: RoboButtonSpecial(
                      voidCallback: (){}, 
                      backColor: RoboColors.roboButtonTextColor, 
                      color: RoboColors.roboTextColor,
                      icon: Icon(Icons.g_mobiledata, size: RoboSize.createButtonSocialSize,),
                      borderSide: BorderSide(color: RoboColors.roboSignTextColor),
                    ),
                  ),
                ],
              ),
            ),
            RoboRichtext(titleHead: RoboTitle.createRichTextHeadTitle, titleSub: RoboTitle.createRichTextSubTitle)
          ],
        ),
      ),
    );
  }
}

//CUSTOM CREATE TİTLE CLASS
class _CustomCreateTitle extends StatelessWidget {
  const _CustomCreateTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Remember me',
      style: TextStyle(
          color: RoboColors.roboSignTextColor, fontWeight: FontWeight.bold),
    );
  }
}
