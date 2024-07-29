import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/robo_colors.dart';

class RoboTextfield extends StatefulWidget {
  const RoboTextfield({super.key, this.textEditingController, this.roboSecure = true,});
  final TextEditingController? textEditingController;
  final bool roboSecure;

  @override
  State<RoboTextfield> createState() => _RoboTextfieldState();
}

class _RoboTextfieldState extends State<RoboTextfield> {
  late bool _isSecure;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isSecure = widget.roboSecure;
  }

  void _updateIsSecure() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 217, 225, 232),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: widget.textEditingController,
          obscureText: _isSecure,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Şifrenizi Girin',
            hintStyle: TextStyle(color: RoboColors.roboSignOrText),
            suffixIcon: IconButton(onPressed: (){
              _updateIsSecure();
            }, icon: Icon(_isSecure ? Icons.visibility : Icons.visibility_off),
            ),
            prefixIcon: Icon(Icons.lock, color: RoboColors.roboSignTextColor,)
          ),
        ),
      ),
    );
  }
}