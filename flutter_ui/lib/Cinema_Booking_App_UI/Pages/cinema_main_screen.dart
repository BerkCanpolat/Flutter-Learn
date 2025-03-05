import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/Cinema_Booking_App_UI/Pages/home_page_cinema.dart';
import 'package:flutter_ui/Cinema_Booking_App_UI/const.dart';

class CinemaMainScreen extends StatefulWidget {
  const CinemaMainScreen({super.key});

  @override
  State<CinemaMainScreen> createState() => _CinemaMainScreenState();
}

class _CinemaMainScreenState extends State<CinemaMainScreen> {
  List<IconData> bottomIcons = [
    Icons.home_filled,
    CupertinoIcons.compass_fill,
    CupertinoIcons.ticket_fill,
    Icons.person_rounded
  ];

  late final List<Widget> page;
  
  int currentIndex = 0;

  @override
  void initState() {
    page = [
      const HomePageCinema(),
      navBarPage(CupertinoIcons.compass_fill),
      navBarPage(CupertinoIcons.ticket_fill),
      navBarPage(Icons.person_rounded)
    ];
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackGroundColor,
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            bottomIcons.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: Stack(
                children: [
                  AnimatedContainer(duration: Duration(microseconds: 300),
                  height: currentIndex == index ? 25:0,
                  width: currentIndex == index ? 25:0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        spreadRadius: currentIndex == index ? 10:0,
                        blurRadius: currentIndex == index ? 15:0
                      )
                    ]
                  ),
                  ),
                  Icon(bottomIcons[index], color: currentIndex == index ? Colors.white:Colors.white.withOpacity(0.3))
                ],
              ),
            ),
          ),
        ),
      ),
      body: page[currentIndex],
    );
  }

  navBarPage(iconName) {
    return Center(
      child: Icon(iconName, size: 100, color: Colors.white,),
    );
  }
}
