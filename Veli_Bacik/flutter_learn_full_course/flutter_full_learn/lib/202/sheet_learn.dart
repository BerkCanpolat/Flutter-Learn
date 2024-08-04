import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin{
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundColor,
      body: Center(child: TextButton(onPressed: (){
        showCustomSheet(context, ImageLearn202());
      }, child: Text('Show'),),),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
            context: context,
            backgroundColor: Colors.red,
            barrierColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            isScrollControlled: true,
            builder: (context) {
            return _CustomSheet(backgroundColor: _backgroundColor);
          });
          if (result is bool) {
            setState(() {
              _backgroundColor = Colors.cyan;
            });
          }
        }, 
        child: Icon(Icons.alternate_email_rounded),),
    );
  }
}



class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    super.key,
    required Color backgroundColor,
  });

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  Color _backgroundColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 24,
            child: Stack(
              children: [
                Divider(
                  thickness: 3, 
                  indent:  MediaQuery.of(context).size.width * 0.45,
                  endIndent: MediaQuery.of(context).size.width * 0.45,
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      }, 
                      icon: Icon(Icons.close, color: Colors.white,),
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.zero,
                      ),
                    )
              ],
            ),
          ),
          Text('data'),
          Image.network('https://picsum.photos/200/300'),
          ElevatedButton(onPressed: (){
            setState(() {
              _backgroundColor = Colors.amber;
            });
            Navigator.of(context).pop<bool>(true);
          }, child: Text('OK'))
        ],
      ),
    );
  }
}


mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async{
    return showModalBottomSheet<T>(
            context: context,
            backgroundColor: Colors.red,
            barrierColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            //isScrollControlled: true,
            builder: (context) {
            return _CustomMainSheet(childx: child);
          });
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({super.key, required this.childx});
  final Widget childx;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _BaseSheetHeader(),
          Expanded(child: childx)
        ],
      ),
    );
  }
}


//BASE SHEET HEADER CLASS
class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader({
    super.key,
  }) : _gripHeight = 30;
  final double _gripHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        children: [
          Divider(
            thickness: 3, 
            indent:  MediaQuery.of(context).size.width * 0.45,
            endIndent: MediaQuery.of(context).size.width * 0.45,
            ),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                icon: Icon(Icons.close, color: Colors.white,),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.zero,
                ),
              )
        ],
      ),
    );
  }
}