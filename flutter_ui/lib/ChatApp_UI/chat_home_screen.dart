import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/ChatApp_UI/chat_details.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  List<String> people = [
    'Colt',
    'Myra',
    'Neeta',
    'Sarah',
    'Natasha',
    'Robert'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Berk', style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
            ),
            Text(
              'Xchat message', style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.edit_square, color: Colors.grey,)
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: people.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/${index+1}.png"), scale: 10
                            )
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Text(people[index])
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            ListView.builder(
              itemCount: people.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetails()));
                    },
                    leading: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset("assets/${index + 10}.png"),
                      )
                    ),
                    title: Text(
                      people[index],style: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: const Text(
                      "blablablaalalabala.."
                    ),
                    trailing: Column(
                      children: [
                        const Text(
                          '00.21', style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey
                          ),
                          ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(CupertinoIcons.pin_fill, size: 15, color: Colors.grey,),
                            const SizedBox(width: 5,),
                            Container(
                              width: 15,
                              height: 15,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle
                              ),
                              child: const Center(
                                child: Text(
                                  '1', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}