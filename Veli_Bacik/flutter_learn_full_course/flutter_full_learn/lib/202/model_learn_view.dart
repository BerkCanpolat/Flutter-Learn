import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user8 = PostModel8(body: 'B');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final user1 = PostModel();
    user1.body = 'Hello';

    final user2 = PostModel2(1, 1, 'Berk', 'Boddy');
    user2.body = 'a';

    final user3 = PostModel3(2, 2, 'title', 'body');


    //Localda işlemler yapıyorsak bunu kullanmak en mantıklısı.
    final user4 = PostModel4(userId: 3, id: 3, title: 'title', body: 'body');

    final user5 = PostModel5(userId: 4, id: 4, title: 'title', body: 'body');
    user5.userID;

    final user6 = PostModel6(userId: 5, id: 5, title: 'title', body: 'body');

    final user7 = PostModel7();

    //Servisten data çekiyorsak kullanılması en mantıklı yöntem budur.
    //final user8 = PostModel8(body: 'a');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          user8 = user8.copyWith(title: 'BC');
          user8.updateBody('Update');
        });
      },),
      appBar: AppBar(
        title: Text(user8.body ?? 'Not has any data', style: TextStyle(color: Colors.white),),
      ),

    );
  }
}