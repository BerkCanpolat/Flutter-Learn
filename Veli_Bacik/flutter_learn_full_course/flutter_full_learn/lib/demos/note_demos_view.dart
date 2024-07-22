import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/image_learn.dart';

class NoteDemosApp extends StatelessWidget {
  const NoteDemosApp({super.key});
  final _title = 'Create your firs note';
  final _description = 'Add a note';
  final _createNote = 'Create a Note';
  final _importNotes = 'Import Notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(systemOverlayStyle: SystemUiOverlayStyle.dark,),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            PngImage(path: ImageItems().appleBookWithouthPath),
            _TitleWidget(title: _title),
            Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubTitleWidget(title: _description,),
            ),
            Spacer(),
            _createButton(context),
            TextButton(
              onPressed: (){}, 
              child: Text(
                _importNotes
              )
            ),
            SizedBox(height: ButtonHeights.sizedBoxHeight,)
          ],
        ),
      ),
    );
  }

  ElevatedButton _createButton(BuildContext context) {
    return ElevatedButton(
            onPressed: (){}, 
            child: SizedBox(
              height: ButtonHeights.buttonNormalHeight,
              child: Center(
                child: Text(
                  _createNote,
                  style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
          );
  }
}


//SUB TİTLE WİDGET
class _SubTitleWidget extends StatelessWidget {
  const _SubTitleWidget({super.key, this.textAlign = TextAlign.center, required this.title});
  final TextAlign textAlign;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title * 15,
      textAlign: textAlign,
      style: Theme.of(context)
          .textTheme
          .titleSmall
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400
      ),
    );
  }
}

//TİTLE WİDGET
class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
    );
  }
}

//PADDİNG
class PaddingItems {
  static final EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 20);
  static final EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 20);
}


class ButtonHeights {
  static const double buttonNormalHeight = 50;
  static const double sizedBoxHeight = 30;
}