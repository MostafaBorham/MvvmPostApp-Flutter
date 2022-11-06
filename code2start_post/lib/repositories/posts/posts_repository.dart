import 'package:code2start_post/models/post_model.dart';

abstract class PostsRepository{
  Future<List<PostModel>> fetchAllPosts();
  Future<PostModel> fetchPostById(int id);
}