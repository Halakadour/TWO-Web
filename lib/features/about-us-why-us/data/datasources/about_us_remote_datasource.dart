import 'package:two_website/config/constants/base_uri.dart';
import 'package:two_website/core/api/get_api.dart';
import 'package:two_website/core/api/get_with_token_api.dart';
import 'package:two_website/features/about-us-why-us/data/models/about-us-models/create_why_us_response_model.dart';
import 'package:two_website/features/about-us-why-us/data/models/about-us-models/show_about_us_response_model.dart';
import 'package:two_website/features/about-us-why-us/data/models/about-us-models/update_about_us_response_model.dart';
import 'package:two_website/features/about-us-why-us/domain/usecases/about-us-usecase/create_about_us_usecase.dart';
import 'package:two_website/features/about-us-why-us/domain/usecases/about-us-usecase/update_about_us_usecase.dart';

abstract class AboutUsRemoteDatasource {
  Future<ShowAboutUsResponesModel> showAboutUs();
  Future<CreateAboutUsResponesModel> createAboutUs(CreateAboutUsParam aboutUs);
  Future<UpdateAboutUsResponesModel> updateAbout(UpdateAboutUsParam aboutUs);
}

class AboutUsRemoteDatasourceImpl extends AboutUsRemoteDatasource {
  @override
  Future<CreateAboutUsResponesModel> createAboutUs(
      CreateAboutUsParam aboutUs) async {
    final result = GetWithTokenApi(
        uri: Uri.parse("$baseUri/api/create/about"),
        token: aboutUs.token,
        body: ({'work_time': aboutUs.workTime, 'site': aboutUs.site}),
        fromJson: createAboutUsResponesModelFromJson);
    return await result.callRequest();
  }

  @override
  Future<ShowAboutUsResponesModel> showAboutUs() async {
    final result = GetApi(
        uri: Uri.parse("$baseUri/api/show/about"),
        fromJson: showAboutUsResponesModelFromJson);
    return await result.callRequest();
  }

  @override
  Future<UpdateAboutUsResponesModel> updateAbout(
      UpdateAboutUsParam aboutUs) async {
    final result = GetWithTokenApi(
        uri: Uri.parse("$baseUri/api/update/about"),
        token: aboutUs.token,
        body: ({
          'work_time': aboutUs.aboutUs.workTime,
          'site': aboutUs.aboutUs.site,
          'about_id': aboutUs.aboutUs.aboutUsId.toString()
        }),
        fromJson: updateAboutUsResponesModelFromJson);
    return await result.callRequest();
  }
}
