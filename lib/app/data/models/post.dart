class Post {
  // type data
  final int id, userId;
  final String title, body;

  // wajib
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // factory/pabrik -> bikin sebuah objek dan diubah bentuknya menjadi sebuah json
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }
}
