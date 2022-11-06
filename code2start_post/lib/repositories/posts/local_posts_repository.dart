import 'package:code2start_post/models/post_model.dart';

import 'posts_repository.dart';

class LocalPostsRepository implements PostsRepository{
  @override
  Future<List<PostModel>> fetchAllPosts() {
    // TODO: implement fetchAllPosts
    throw UnimplementedError();
  }

  @override
  Future<PostModel> fetchPostById(int id) {
    // TODO: implement fetchPostById
    throw UnimplementedError();
  }
}