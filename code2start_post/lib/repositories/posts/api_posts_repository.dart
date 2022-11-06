import 'dart:convert';
import 'package:code2start_post/models/post_model.dart';
import 'package:http/http.dart' as http;

import 'posts_repository.dart';

class ApiPostsRepository implements PostsRepository {
  final _baseUrl = 'https://jsonplaceholder.typicode.com/posts/';
  var headers = {'Accept': 'application/json',
    'Content-Type': 'application/json;charset=UTF-8'};
  @override
  Future<List<PostModel>> fetchAllPosts() async {
    final response = await http.get(Uri.parse(_baseUrl), headers: headers);
    final postsList = json.decode(response.body);
    print(postsList);
    return postsList.map<PostModel>((postMap) => PostModel.fromMap(postMap)).toList();
  }

  @override
  Future<PostModel> fetchPostById(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl$id'), headers: headers);
    final postMap = json.decode(response.body);
    return PostModel.fromMap(postMap);
  }
}
