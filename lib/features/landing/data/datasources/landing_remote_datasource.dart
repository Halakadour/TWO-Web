import 'package:two_website/config/constants/base_uri.dart';
import 'package:two_website/core/api/get_api.dart';
import 'package:two_website/core/api/post_api.dart';
import 'package:two_website/core/api/post_api_with_token.dart';
import 'package:two_website/features/landing/data/models/create_contact_us_response_model.dart';
import 'package:two_website/features/landing/data/models/reply_to_post_response_model.dart';
import 'package:two_website/features/landing/data/models/role_response_model.dart';
import 'package:two_website/features/landing/data/models/show_about_us_response_model.dart';
import 'package:two_website/features/landing/data/models/show_post_response_model.dart';
import 'package:two_website/features/landing/data/models/show_service_response_model.dart';
import 'package:two_website/features/landing/data/models/show_why_us_response_model.dart';
import 'package:two_website/features/landing/data/models/update_profile_response_model.dart';

abstract class LandingRemoteDatasource {
  Future<ShowAboutUsResponesModel> showAboutUs();
  Future<ShowWhyUsResponesModel> showWhyUs();
  Future<CreateContactUsResponseModel> createContactUs(
      String token, String subject, String description, String phone);
  Future<ShowPostResponesModel> showActivePosts();
  Future<ReplyToPostResponesModel> replyToPost(
      String fullName, String email, String phone, String cv, int postId);
  Future<UpdateProfileResponesModel> updateFreeLanceProfile(
      String token, String image, int roleId);
  Future<UpdateProfileResponesModel> updateGuestProfile(
      String token, String image, int roleId);
  Future<UpdateProfileResponesModel> updateClientProfile(
      String token,
      String image,
      int roleId,
      String subject,
      String description,
      String phone);
  Future<RoleResponesModel> showRoleClient();
  Future<ShowServiceResponesModel> showServices();
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
  Future<UpdateProfileResponesModel> updateClientProfile(
      String token,
      String image,
      int roleId,
      String subject,
      String description,
      String phone) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/update/client/profile"),
        body: ({
          'role_id': roleId.toString(),
          'image': '$imageBase64$image',
          'subject': subject,
          'description': description,
          'phone': phone
        }),
        fromJson: updateProfileResponesModelFromJson,
        token: token);
    return await result.call();
  }

  @override
  Future<UpdateProfileResponesModel> updateFreeLanceProfile(
      String token, String image, int roleId) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/update/freelancer/profile"),
        body: ({
          'role_id': roleId.toString(),
          'image': '$imageBase64$image',
        }),
        fromJson: updateProfileResponesModelFromJson,
        token: token);
    return await result.call();
  }

  @override
  Future<UpdateProfileResponesModel> updateGuestProfile(
      String token, String image, int roleId) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/update/user/profile"),
        body: ({
          'role_id': roleId.toString(),
          'image': '$imageBase64$image',
        }),
        fromJson: updateProfileResponesModelFromJson,
        token: token);
    return await result.call();
  }

  @override
  Future<RoleResponesModel> showRoleClient() async {
    final result = GetApi(
        uri: Uri.parse("$baseUri/api/show/role/client"),
        fromJson: roleResponesModelFromJson);
    return await result.callRequest();
  }

  @override
  Future<ShowServiceResponesModel> showServices() async {
    final result = GetApi(
        uri: Uri.parse('$baseUri/api/show/services'),
        fromJson: showServiceResponesModelFromJson);
    return await result.callRequest();
  }
}
