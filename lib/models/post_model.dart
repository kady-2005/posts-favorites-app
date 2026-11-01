import 'package:hive/hive.dart';

class Post extends HiveObject {
  final int id;
  final String title;
  final String body;
  final int userId;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      userId: json['userId'] as int,
    );
  }
}

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 0;

  @override
  Post read(BinaryReader reader) {
    final int id = reader.readByte();
    final String title = reader.readString();
    final String body = reader.readString();
    final int userId = reader.readByte();

    return Post(
      id: id,
      title: title,
      body: body,
      userId: userId,
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer.writeByte(4);
    writer.writeByte(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.body);
    writer.writeByte(obj.userId);
  }
}
