import 'package:two_website/config/constants/base_uri.dart';
import 'package:two_website/core/api/get_api.dart';
import 'package:two_website/core/api/post_api.dart';
import 'package:two_website/core/api/post_api_with_token.dart';
import 'package:two_website/core/param/project_param.dart';
import 'package:two_website/features/landing/data/models/create_contact_us_response_model.dart';
import 'package:two_website/features/landing/data/models/create_project_response_model.dart';
import 'package:two_website/features/landing/data/models/reply_to_post_response_model.dart';
import 'package:two_website/features/landing/data/models/show_about_us_response_model.dart';
import 'package:two_website/features/landing/data/models/show_post_response_model.dart';
import 'package:two_website/features/landing/data/models/show_service_response_model.dart';
import 'package:two_website/features/landing/data/models/show_why_us_response_model.dart';

abstract class LandingRemoteDatasource {
  Future<ShowAboutUsResponesModel> showAboutUs();
  Future<ShowWhyUsResponesModel> showWhyUs();
  Future<CreateContactUsResponseModel> createContactUs(
      String token, String subject, String description, String phone);
  Future<ShowServiceResponesModel> showServices();
  Future<ShowPostResponesModel> showActivePosts();
  Future<ReplyToPostResponesModel> replyToPost(
      String fullName, String email, String phone, String cv, int postId);
  Future<CreateProjectResponseModel> createProject(CreateProjectParam param);
}

class LandingRemoteDatasourceImpl extends LandingRemoteDatasource {
  @override
  Future<ShowAboutUsResponesModel> showAboutUs() async {
    final result = GetApi(
        uri: Uri.parse("$baseUri/api/show/about"),
        fromJson: showAboutUsResponesModelFromJson);
    return await result.callRequest();
  }

  @override
  Future<ShowWhyUsResponesModel> showWhyUs() async {
    final result = GetApi(
        uri: Uri.parse("$baseUri/api/show/whyUs"),
        fromJson: showWhyUsResponesModelFromJson);
    return await result.callRequest();
  }

  @override
  Future<CreateContactUsResponseModel> createContactUs(
      String token, String subject, String description, String phone) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/create/contactUs"),
        token: token,
        body: ({
          'subject': subject,
          'description': description,
          'phone': phone
        }),
        fromJson: createContactUsResponseModelFromJson);
    return await result.call();
  }

  @override
  Future<ReplyToPostResponesModel> replyToPost(String fullName, String email,
      String phone, String cv, int postId) async {
    final result = PostApi(
        uri: Uri.parse("$baseUri/api/create/reply"),
        body: ({
          'full_name': fullName,
          'email': email,
          'phone': phone,
          'cv': '$pdfBase64$cv',
          'post_id': postId
        }),
        fromJson: replyToPostResponesModelFromJson);
    return await result.call();
  }

  @override
  Future<ShowPostResponesModel> showActivePosts() async {
    final result = GetApi(
        uri: Uri.parse("$baseUri/api/show/active/posts"),
        fromJson: showPostResponesModelFromJson);
    return await result.callRequest();
  }

  @override
  Future<ShowServiceResponesModel> showServices() async {
    final result = GetApi(
        uri: Uri.parse('$baseUri/api/show/services'),
        fromJson: showServiceResponesModelFromJson);
    return await result.callRequest();
  }

  @override
  Future<CreateProjectResponseModel> createProject(
      CreateProjectParam param) async {
    if (param.document != null) {
      Map<String, dynamic> body = {
        "project_type": param.type,
        "project_description": param.description,
        "requirements": param.requirements,
        "document": "$pdfBase64${param.document!}",
        "cooperation_type": param.cooperationType,
        "contact_time": param.contactTime,
        "private": "1"
      };
      final result = PostApiWithToken(
          uri: Uri.parse("$baseUri/api/create/project"),
          body: body,
          fromJson: createProjectResponseModelFromJson,
          token: param.token);
      return await result.call();
    } else {
      Map<String, dynamic> body = {
        "project_type": param.type,
        "project_description": param.description,
        "requirements": param.requirements,
        "cooperation_type": param.cooperationType,
        "contact_time": param.contactTime,
        "private": "1"
      };
      final result = PostApiWithToken(
          uri: Uri.parse("$baseUri/api/create/project"),
          body: body,
          fromJson: createProjectResponseModelFromJson,
          token: param.token);
      return await result.call();
    }
  }
}
