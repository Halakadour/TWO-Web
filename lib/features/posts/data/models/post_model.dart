import 'package:two_website/features/posts/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  final int id;
  final String description;
  final String image;

  PostModel({
    required this.id,
    required this.description,
    required this.image,
  }) : super(postId: id, body: description, poster: image);

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "image": image,
      };
}
