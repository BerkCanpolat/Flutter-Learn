import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_full_learn/303/reqrest_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/reqrest_resource/service/reqrest_service.dart';
import 'package:flutter_full_learn/303/reqrest_resource/view/reqres_view.dart';
import 'package:flutter_full_learn/product/service/project_dio.dart';

abstract class ReqresViewModel extends LoadingStatefull<ReqresView> with ProjectDioMixin{

  late final IReqresService reqresService;

  List<Data> resources = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reqresService = ReqrestService(service);
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}