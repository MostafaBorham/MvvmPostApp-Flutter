class PostModel {
  int id;
  int userId;
  String title;
  String body;

  PostModel(
      {required this.id,
      required this.userId,
      required this.title,
      required this.body});

  factory PostModel.fromMap(Map<String, dynamic> map) => PostModel(
      id: map['id'],
      userId: map['userId'],
      title: map['title'],
      body: map['body']);

  Map<String, dynamic> toMap() => {
        'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      };
}
