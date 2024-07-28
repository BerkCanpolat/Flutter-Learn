import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/myDemos/image_settings.dart';
import 'package:flutter_full_learn/demos/myDemos/myCore/my_core.dart';

class MailDemos extends StatelessWidget {
  const MailDemos({super.key});
  final _title = 'Check your mail';
  final _subTitle = 'We have sent a reset password to your email addres.';
  final _buttonTitle = 'Open email app';
  final _headTitle = "Didn't you receive any code?";
  final _subRichTitle = ' Resend';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const _CustomAppBarContainer(),
      ),
      body: Padding(
        padding: MailDemosPadding.generalPadding,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: MailDemosPadding.customTitleHeadPadding,
                child: _CustomTitleHead(title: _title, textAlign: TextAlign.left,),
              )),
            _CustomSubTitle(title: _subTitle,),
            _CustomImage(),
            _CustomButton(title: _buttonTitle,),
            Spacer(),
            _CustomRichText(headTitle: _headTitle, subTitle: _subRichTitle,),
          ],
        ),
      ),
    );
  }
}


//Custom Rich Text Class
class _CustomRichText extends StatelessWidget {
  const _CustomRichText({
    super.key, required this.headTitle, required this.subTitle,
  });
  final String headTitle;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MailDemosPadding.customRichTextPadding,
      child: RichText(text: TextSpan(
        text: headTitle, style: TextStyle(color: MailDemosColor.colorSubTitle),
        children: [
          TextSpan(text: subTitle,style: TextStyle(color: MailDemosColor.colotTitleHead, fontWeight: FontWeight.bold))
        ]
      )
                 ),
    );
  }
}


//Custom Button Class
class _CustomButton extends StatelessWidget {
  const _CustomButton({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MailDemosPadding.customButtonPadding,
      child: Container(
        height: MailDemosSize.buttonHeight,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: (){}, 
          child: Text(
            title,
            style: TextStyle(
              color: MailDemosColor.colorButton,
              fontWeight: FontWeight.bold,
              fontSize: MailDemosSize.buttonTitleSize,
            ),
            ),
          style: ElevatedButton.styleFrom(
            backgroundColor: MailDemosColor.colotTitleHead,
            shape: RoundedRectangleBorder(
              borderRadius: _customButtonShape()
            )
          ),
          ),
      ),
    );
  }

  BorderRadius _customButtonShape() => BorderRadius.all(Radius.circular(20));
}


//Custom Image Class
class _CustomImage extends StatelessWidget {
  const _CustomImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MailDemosColor.colorRGB,
        borderRadius: _customImageBorderShape()
      ),
      child: ImageSettings(path: ImagePathDemos.mailImage)
      );
  }

  BorderRadius _customImageBorderShape() => BorderRadius.all(Radius.circular(30));
}


//Custom Sub Title Class
class _CustomSubTitle extends StatelessWidget {
  const _CustomSubTitle({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: MailDemosPadding.customSubTitlePadding,
        child: Text(
          title,
          style: TextStyle(
            color: MailDemosColor.colorSubTitle,
          ),
        ),
      ),
    );
  }
}


//Custom Title Head Class
class _CustomTitleHead extends StatelessWidget {
  const _CustomTitleHead({
    super.key, required this.title, this.textAlign = TextAlign.start,
  });
  final String title;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: MailDemosSize.titleHeadSize,
        fontWeight: FontWeight.bold,
        color: MailDemosColor.colotTitleHead
      ),
      textAlign: textAlign,
    );
  }
}


//Custom AppBar Container Class
class _CustomAppBarContainer extends StatelessWidget {
  const _CustomAppBarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MailDemosPadding.appBarSymetric,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: _customAppBarBorderRadius(),
          color: MailDemosColor.colorRGB,
        ),
        child: Icon(Icons.arrow_back)
      ),
    );
  }

  BorderRadius _customAppBarBorderRadius() => BorderRadius.all(Radius.circular(10));
}