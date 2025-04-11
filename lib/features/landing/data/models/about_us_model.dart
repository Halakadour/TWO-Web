import 'package:two_website/features/landing/domain/entities/about_us_entity.dart';

class AboutUsModel extends AboutUsEntity {
  final int id;
  final String workTime;
  final String site;

  AboutUsModel({
    required this.id,
    required this.workTime,
    required this.site,
  }) : super(aboutId: id, aboutWorkTime: workTime, aboutSite: site);

  factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
        id: json["id"],
        workTime: json["work_time"],
        site: json["site"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "work_time": workTime,
        "site": site,
      };
}
