import 'package:two_website/features/services/domain/entities/service_entity.dart';

class ServiceModel extends ServiceEntity {
  final int id;
  final String title;
  final String description;
  final String image;

  ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  }) : super(idE: id, titleE: title, descriptionE: description, imageE: image);

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
      };
}
