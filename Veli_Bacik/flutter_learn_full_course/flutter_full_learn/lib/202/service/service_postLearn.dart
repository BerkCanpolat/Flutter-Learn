import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';

class ServiceLearnPostView extends StatefulWidget {
  const ServiceLearnPostView({super.key});

  @override
  State<ServiceLearnPostView> createState() => _ServiceLearnPostViewState();
}

class _ServiceLearnPostViewState extends State<ServiceLearnPostView> {
  String? name;
  bool _isLoading = false;
  //Değerini 1 kere alacak birdaha eşitlenmeyecek
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com';
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  TextEditingController _userController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(ServiceLearn serviceModel) async {
    _changeLoading();
    final response = await _dio.post('/posts', data: serviceModel);

    if(response.statusCode == HttpStatus.created) {
      name = 'Başarılı';
    }
    _changeLoading();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ''),
        actions: [ _isLoading ? 
          CircularProgressIndicator.adaptive() :
          SizedBox.shrink()
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
            ),
          TextField(
            controller: _bodyController,
            decoration: InputDecoration(labelText: 'Body'),
            ),
          TextField(
            controller: _userController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'UserId'),),
            TextButton(onPressed: _isLoading ? null :
             (){
              if(
                _titleController.text.isNotEmpty && 
                _bodyController.text.isNotEmpty && 
                _userController.text.isNotEmpty) {
                  final model = ServiceLearn(
                    body: _bodyController.text,
                    title: _titleController.text,
                    userId: int.tryParse(_userController.text)
                  );
                  _addItemToService(model);
              }
            }, child: const Text('Send'))
        ],
      )
    );
  }
}








class _PostCard extends StatelessWidget {
  const _PostCard({
    super.key,
    required ServiceLearn? model,
  }) : _model = model;

  final ServiceLearn? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 25),
      child: ListTile(
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}