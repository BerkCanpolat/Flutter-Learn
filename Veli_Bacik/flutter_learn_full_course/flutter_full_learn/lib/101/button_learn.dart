import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: (){}, 
            child: Text(
              "Text Button", style: Theme.of(context).textTheme.titleLarge,
              ),
              style: ButtonStyle(
                
              ),
            ),
          ElevatedButton(onPressed: (){}, child: Text("Elevated Button")),
          IconButton(onPressed: (){}, icon: Icon(Icons.ac_unit_rounded)),
          FloatingActionButton(onPressed: (){

          }, child: Icon(Icons.add),),
          OutlinedButton(
            onPressed: (){}, 
            child: Text("Outlined Button"),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(),
            ),
            ),
          InkWell(
            onTap: () {},
            child: Text("Custom"),),
            Container(
              height: 200,
              color: Colors.white,
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){}, 
              child: Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20,right: 50,left: 50),
                child: Text(
                  "Place Bid", style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.black
                  ),
                  ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
                )
                ),
              ),
        ],
      ),
    );
  }
}