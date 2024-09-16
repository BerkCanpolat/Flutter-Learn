import 'dart:convert';

import 'package:bloc_zero_to_hero/models/post_model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
 Future<List<PostModel>> fetchPost() async {
  try {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    final body = json.decode(response.body) as List;
    if(response.statusCode == 200) {
      return body.map((dynamic e) {
        final map = e as Map<String,dynamic>;
        return PostModel(
          body: map['body'],
          email: map['email'],
          id: map['id'],
          name: map['name'],
          postId: map['postId']
        );
      }).toList();
    }
  } catch (e) {
    print(e);
  }
  throw Exception('Error Fetching data');
 } 
}