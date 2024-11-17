import 'package:flutter_architecture_v2/product/service/manager/product_service_path.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

final class LoginService {
  final INetworkManager<EmptyModel> _serviceManager;

  LoginService(INetworkManager<EmptyModel> productServiceManager) : _serviceManager = productServiceManager;  

  Future<List<User>> users() async {
    final response = await _serviceManager.send<User, List<User>>(
      ProductServicePath.posts.value, 
      parseModel: User(), 
      method: RequestType.GET
    );

    return response.data ?? [];
  }
}