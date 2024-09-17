import 'package:flutter/material.dart';

class EthernetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const EthernetExceptionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * .15,),
        const Icon(
          Icons.cloud_off,
          color: Colors.red,
          size: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              "We're unable to show results. \nPlease check your data\nconnection.",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .1,),
        ElevatedButton(
          onPressed: onPress, 
          child: Center(
            child: Text(
              'RETRY', style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ],
    );
  }
}