import 'package:code2start_post/models/post_model.dart';
import 'package:code2start_post/repositories/posts/posts_repository.dart';

class PostsViewModel {
  final String title = 'Posts';
  PostsRepository postsRepository;
  List<PostModel>? posts;


  PostsViewModel({required this.postsRepository});

  Future<void> getAllPosts() async{
    posts= await postsRepository.fetchAllPosts();
  }
}