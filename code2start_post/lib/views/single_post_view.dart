import 'package:code2start_post/models/post_model.dart';
import 'package:code2start_post/view_models/single_post_view_model.dart';
import 'package:flutter/material.dart';

class SinglePostView extends StatefulWidget {
  const SinglePostView({Key? key, required this.post}) : super(key: key);
  final PostModel post;

  @override
  State<SinglePostView> createState() => _SinglePostViewState();
}

class _SinglePostViewState extends State<SinglePostView> {
  late SinglePostViewModel singlePostViewModel;

  @override
  void initState() {
    super.initState();
    singlePostViewModel = SinglePostViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${singlePostViewModel.title} ${widget.post.id}'),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.post.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              initialValue: widget.post.body,
              maxLines: 100,
              minLines: 1,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                    '${singlePostViewModel.postBtnPrefix} ${widget.post.userId}'))
          ],
        ),
      ),
    );
  }
}
