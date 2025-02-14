class PostModel {
  final int id;
  final String description;
  final String image;

  PostModel({
    required this.id,
    required this.description,
    required this.image,
  });

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
