import 'package:flutter/material.dart';

class ColorDemosView extends StatefulWidget {
  const ColorDemosView({super.key, required this.initialColor});
  final Color? initialColor;

  @override
  State<ColorDemosView> createState() => _ColorDemosViewState();
}

class _ColorDemosViewState extends State<ColorDemosView> {
  Color? _backgroundColor;

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemosView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print(oldWidget.initialColor != widget.initialColor && widget.initialColor != null);
    if(widget.initialColor != _backgroundColor && widget.initialColor != null) {
      changeBackgroundColor(widget.initialColor!);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _colorOnTap,
        items: [
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.red,), label: 'Red'),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.yellow), label: 'Yellow'),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.blue), label: 'Blue'),
      ]),
    );
  }

  void _colorOnTap(value) {
        if(value == _MyColors.red.index) {
          changeBackgroundColor(Colors.red);
        } else if(value == _MyColors.yellow.index) {
          changeBackgroundColor(Colors.yellow);
        } else if(value == _MyColors.blue.index) {
          changeBackgroundColor(Colors.blue);
        }
      }
}

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    super.key, required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(color: color, width: 10,height: 10,);
  }
}

enum _MyColors {
  red,
  yellow,
  blue
}