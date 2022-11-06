import 'package:code2start_post/models/post_model.dart';
import 'package:code2start_post/repositories/posts/api_posts_repository.dart';
import 'package:code2start_post/repositories/posts/local_posts_repository.dart';
import 'package:code2start_post/view_models/posts_view_model.dart';
import 'package:code2start_post/views/single_post_view.dart';
import 'package:flutter/material.dart';

class PostsView extends StatefulWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  final apiPostsRepo = ApiPostsRepository();
  final localPostsRepo = LocalPostsRepository();
  late PostsViewModel _postsViewModel;

  @override
  void initState() {
    super.initState();
    _postsViewModel = PostsViewModel(postsRepository: apiPostsRepo);
    _postsViewModel.getAllPosts().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_postsViewModel.title),
        titleSpacing: 0,
        leading: const Icon(Icons.facebook),
      ),
      body: Center(
        child: _postsViewModel.posts != null
            ? ListView.separated(
                itemBuilder: (context, index) =>
                    _buildPost(_postsViewModel.posts![index]),
                separatorBuilder: (context, index) =>
                    const Divider(color: Colors.blue, thickness: 2),
                itemCount: _postsViewModel.posts!.length)
            : const CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildPost(PostModel postModel) => ListTile(
        title: Text(postModel.title),
        subtitle: Text(postModel.body),
        leading: CircleAvatar(
          radius: 15,
          child: Text(postModel.userId.toString()),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SinglePostView(post: postModel)));
        },
      );
}
