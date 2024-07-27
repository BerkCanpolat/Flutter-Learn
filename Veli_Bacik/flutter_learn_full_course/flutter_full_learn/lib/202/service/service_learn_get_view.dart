import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';
import 'package:flutter_full_learn/202/service/post_service_manager.dart';

class ServiceLearnView extends StatefulWidget {
  const ServiceLearnView({super.key});

  @override
  State<ServiceLearnView> createState() => _ServiceLearnViewState();
}

class _ServiceLearnViewState extends State<ServiceLearnView> {
  List<ServiceLearn>? _items;
  String? name;
  bool _isLoading = false;
  //Değerini 1 kere alacak birdaha eşitlenmeyecek
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com';

  //Test edilebilir kod yazmaya yardımcı olur.
  late final IPostService _postService;


  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostServiceManager();
    name = 'Berk';
    fetchPostItemsAdvance();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  //1. KOD
  Future<void> fetchPostItems() async {
    _changeLoading();
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;

      if(_datas is List) {
        //BU listeyi yeni bir liste yapmaya çalışıyorum demek MAP.
        setState(() {
          _items = _datas.map((e) => ServiceLearn.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }


  //2. KOD
/*   Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    final response = await _dio.get('/posts');
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;

      if(_datas is List) {
        //BU listeyi yeni bir liste yapmaya çalışıyorum demek MAP.
        setState(() {
          _items = _datas.map((e) => ServiceLearn.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  } */


 Future<void> fetchPostItemsAdvance() async {
  _changeLoading();
  _items = await _postService.fetchPostItemsAdvance();
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
      body: _items == null ? CircularProgressIndicator() : ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          return _PostCard(model: _items?[index],);
        },
        ),
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