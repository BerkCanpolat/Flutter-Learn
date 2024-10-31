import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatDetails extends StatefulWidget {
  final int index;
  final String name;
  const ChatDetails({super.key, required this.index, required this.name});

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  List<String> message = [
    "bu benim ilk mesajım nasılsın",
    "iiyim sen nasılsın?",
    "Bende iiyim dostum",
    "Teşekkürler görüşmek üzere bro",
  ];
  TextEditingController _controller = TextEditingController();
  String msg = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              CupertinoIcons.chevron_back,
              color: Colors.black,
            )),
        title: Row(
          children: [
            Container(
              width: kToolbarHeight - 10,
              height: kToolbarHeight - 10,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200, shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset("assets/${widget.index}.png"),
                )),
                const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 2,),
                const Text(
                  "Online",
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.green, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(CupertinoIcons.video_camera, color: Colors.grey.shade600, size: 40,),
          const SizedBox(width: 10,),
          Icon(CupertinoIcons.phone, color: Colors.grey.shade600, size: 30,),
          const SizedBox(width: 10,),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Container(
              child: ListView.builder(
                itemCount: message.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    child: index.isEven ? 
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(message[index]),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '09.24', style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12
                              ),
                              ),
                          ),
                        ],
                      ),
                    )
                    :
                    Align(
                      alignment: Alignment.topRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                textAlign: TextAlign.end,
                                message[index], style: const TextStyle(
                                  color: Colors.white
                                ),
                                ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '09.28', style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12
                              ),
                              ),
                          ),
                        ],
                      ),
                    )
                  );
                },
              ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, kToolbarHeight),
              child: Container(
                //width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.paperclip),
                      const SizedBox(width: 20,),
                      Expanded(child: TextField(
                        controller: _controller,
                        onChanged: (value) {
                          setState(() {
                            msg = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type message..."
                        ),
                      )),
                      const SizedBox(width: 20,),
                      msg.isEmpty
                      ?
                      Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle
                        ),
                        child: const Icon(
                          CupertinoIcons.mic,
                          color: Colors.white,
                        ),
                      )
                      :
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            message.add(msg);
                            _controller.clear();
                          });
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle
                          ),
                          child: const Icon(
                            CupertinoIcons.paperplane,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
