import 'package:flutter/material.dart';

class PetDemosView extends StatelessWidget {
  const PetDemosView({super.key});
  final _title = "Unleash Your Pet's Full Potentials";
  final _subTitle = "Trust me there's way to make your pet love you more and more everyday";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: PetPaddingGeneral.petPadding,
        child: Column(
          children: [
            PetImageItemsWidget(path: PetImageItemsName().petImg),
            Padding(
              padding: PetPaddingGeneral.petSubPadding,
              child: _petTitleWidget(title: _title,),
            ),
            _subTitleWidget(title: _subTitle,),
            _petButton(),
          ],
        ),
      ),
    );
  }

  Padding _petButton() {
    return Padding(
            padding: PetPaddingGeneral.petSubPadding,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))
              ),
              onPressed: (){}, 
              child: SizedBox(
                height: 65,
                child: Center(
                  child: Text(
                    'Next', style: 
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                )
               ),
              ),
            ),
          );
  }
}

class _subTitleWidget extends StatelessWidget {
  const _subTitleWidget({
    super.key, required this.title
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Colors.grey,
        fontWeight: FontWeight.bold
      ),
      );
  }
}


/// Pet Title Widget
class _petTitleWidget extends StatelessWidget {
  const _petTitleWidget({super.key, this.textAlign = TextAlign.center, required this.title});
  final TextAlign textAlign;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
        fontWeight: FontWeight.bold
      ),
    );
  }
}

class PetImageItemsWidget extends StatelessWidget {
  const PetImageItemsWidget({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.asset(_pathName);
  }

  String get _pathName => 'assets/$path.png';
}

class PetImageItemsName {
  final String petImg = 'dog';
}

class PetPaddingGeneral {
  static final EdgeInsets petPadding = EdgeInsets.symmetric(horizontal: 10);
  static final petSubPadding = const EdgeInsets.only(top: 30, bottom: 15);
}