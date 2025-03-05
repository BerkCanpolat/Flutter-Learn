import 'package:flutter/material.dart';
import 'package:flutter_ui/Cinema_Booking_App_UI/const.dart';

class HomePageCinema extends StatefulWidget {
  const HomePageCinema({super.key});

  @override
  State<HomePageCinema> createState() => _HomePageCinemaState();
}

class _HomePageCinemaState extends State<HomePageCinema> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackGroundColor,
      appBar: headerParts(),
      body: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          searchField(),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Padding searchField() {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 19),
              filled: true,
              fillColor: Colors.white.withOpacity(0.05),
              hintText: "Search",
              hintStyle: const TextStyle(color: Colors.white54),
              prefixIcon: const Icon(
                Icons.search,
                size: 35,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(27),
                borderSide: BorderSide.none
              )
            ),
          ),
        );
  }

  AppBar headerParts() {
    return AppBar(
      backgroundColor: appBackGroundColor,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "Welcome Angelina",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                        color: Colors.white54),
                  ),
                  TextSpan(
                    text: "👋",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ])),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Let's relax and watch a movie!",
                  style: TextStyle(
                    height: 0.6,
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            Container(
              width: 40,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://images.pexels.com/photos/2655509/pexels-photo-2655509.jpeg?auto=compress&cs=tinysrgb&w=1200"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
