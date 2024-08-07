import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  CustomWidgetLearn({Key? key}) : super(key : key);
  final String title = "Food";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomFoodButton(title: title, callback: (){},)
            ),
           ),
          ),
          SizedBox(height: 20,),
          CustomFoodButton(title: title,callback: (){},),
        ],
      )
    );
  }
}

mixin _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

mixin _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8.0);
  final EdgeInsets normal2xPadding = const EdgeInsets.all(16.0);
}


/// CUSTOM FOOD BUTTON
class CustomFoodButton extends StatelessWidget with _ColorsUtility, _PaddingUtility{
   CustomFoodButton({super.key, required this.title, required this.callback});
   final String title;
   final VoidCallback callback;
   //final void Function() callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: redColor,
          shape: StadiumBorder()
        ),
        onPressed: callback, 
        child: Padding(
          padding: normal2xPadding,
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: whiteColor,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      );
  }
}