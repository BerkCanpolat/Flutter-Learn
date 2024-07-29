// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_button_special.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_navigate_managers.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_padding.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_richtext.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_sign_ortext.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_size.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_title.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/robo_colors.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/robo_create_account.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/robo_image.dart';

class RoboSign extends StatelessWidget with RoboNavigateManagers {
  const RoboSign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: RoboPadding.homeGeneral,
        child: Column(
          children: [
            const Padding(
              padding: RoboPadding.signImage,
              child: Center(child: RoboImage(path: RoboImagePath.roboImage)),
            ),
            const Padding(
              padding: RoboPadding.signHeadTitlePadding,
              child: CustomRoboLargeTitle(title: RoboTitle.roboSignText,),
            ),
            Container(
              width: double.infinity,
              height: RoboSize.homeButtonContainerSize,
              child: RoboButtonSpecial(
                title: RoboTitle.roboSigntButtonTextFacebook,
                 voidCallback: (){},
                  backColor: RoboColors.roboButtonTextColor,
                  color: RoboColors.roboTextColor,
                  icon: const Icon(Icons.facebook, size: RoboSize.signButtonIconSize,),
                  borderSide: const BorderSide(color: RoboColors.roboSignTextColor, width: RoboSize.signButtonSideSize),
                ),
            ),
            const SizedBox(height: 15,),
            Container(
              width: double.infinity,
              height: RoboSize.homeButtonContainerSize,
              child: RoboButtonSpecial(
                title: RoboTitle.roboSignButtonTextApple,
                 voidCallback: (){},
                  backColor: RoboColors.roboButtonTextColor,
                  color: RoboColors.roboTextColor,
                  icon: const Icon(Icons.apple, size: RoboSize.signButtonIconSize,),
                  borderSide: const BorderSide(color: RoboColors.roboSignTextColor, width: RoboSize.signButtonSideSize),
                ),
            ),
            SizedBox(height: 15,),
            Container(
              width: double.infinity,
              height: RoboSize.homeButtonContainerSize,
              child: RoboButtonSpecial(
                title: RoboTitle.roboSignButtonTextGoogle,
                 voidCallback: (){},
                  backColor: RoboColors.roboButtonTextColor,
                  color: RoboColors.roboTextColor,
                  icon: const Icon(Icons.g_mobiledata, size: RoboSize.signButtonIconSize,),
                  borderSide: const BorderSide(color: RoboColors.roboSignTextColor, width: RoboSize.signButtonSideSize),
                ),
            ),
            const SizedBox(height: 10,),
            const Row(
              children: [
                Expanded(child: Divider(color: RoboColors.roboSignTextColor,)),
                  Padding(
                    padding: RoboPadding.signOrTextPadding,
                    child: RoboSignOrtext(title: RoboTitle.roboSignOrText)
                  ),
                  Expanded(child: Divider(color: RoboColors.roboSignTextColor,)),
              ],
            ),
            Padding(
              padding: RoboPadding.signButtonPasswordPadding,
              child: Container(
                width: double.infinity,
                height: RoboSize.homeButtonContainerSize,
                child: RoboButtonSpecial(
                  title: RoboTitle.signButtonPassword, 
                  voidCallback: (){
                    roboNavigate(context, RoboCreateAccount());
                  }, 
                  backColor: RoboColors.roboTextColor, 
                  color: RoboColors.roboButtonTextColor,
                  borderRadius: const BorderRadius.all(Radius.circular(RoboSize.buttonSpecialGeneralSize)),
                  ),
              ),
            ),
            const RoboRichtext(titleHead: RoboTitle.signRichTextHeadTitle, titleSub: RoboTitle.signRichTextSubTitle)
          ],
        ),
      ),
    );
  }
}


//CUSTOM ROBO LARGE TİTLE CLASS
class CustomRoboLargeTitle extends StatelessWidget {
  const CustomRoboLargeTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: RoboColors.roboSignTextColor,
        fontSize: RoboSize.signHeadTitleSize,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
