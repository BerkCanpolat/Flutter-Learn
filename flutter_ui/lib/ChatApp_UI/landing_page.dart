import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/ChatApp_UI/chat_home_screen.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late bool isFinished;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFinished = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.cover
              )
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30)
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                children: [
                  const Text(
                    textAlign: TextAlign.center,
                    'Express yourself with Xchat', style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    'Chat using avatar emoji gives a different impression, dare to try it ?', style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SwipeableButtonView(
                    isFinished: isFinished,
                    onFinish: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatHomeScreen()));
                    }, 
                    onWaitingProcess: (){
                      setState(() {
                        isFinished = true;
                      });
                    }, 
                    activeColor: Colors.blue, 
                    buttonWidget: Container(
                      child: Icon(CupertinoIcons.chevron_right_2, color: Colors.grey,),
                    ), 
                    buttonText: "Swipe to start"
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}