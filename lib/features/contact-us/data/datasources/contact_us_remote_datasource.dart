import 'package:two_website/config/constants/base_uri.dart';
import 'package:two_website/core/api/get_api.dart';
import 'package:two_website/core/api/get_with_token_api.dart';
import 'package:two_website/core/api/post_api_with_token.dart';
import 'package:two_website/features/contact-us/data/models/create_contact_us_response_model.dart';
import 'package:two_website/features/contact-us/data/models/mark_contact_us_as_approved_response_model.dart';
import 'package:two_website/features/contact-us/data/models/mark_contact_us_as_seen_reponse_model.dart';
import 'package:two_website/features/contact-us/data/models/show_not_approved_contact_us_response_model.dart';

abstract class ContactUsRemoteDatasource {
  Future<CreateContactUsResponseModel> createContactUs(
      String token, String subject, String description, String phone);
  Future<ShowNotApprovedContactUsResponseModel>
      showContactUsWithSeenAndApproved(int seenFilter, int approvedFilter);
  Future<MarkContactUsAsApprovedResponseModel> approveContactUs(
      String token, int contactUsId);
  Future<MarkContactUsAsSeenResponseModel> seenContactUs(
      String token, int contactUsId);
}

class ContactUsRemoteDatasourceImpl extends ContactUsRemoteDatasource {
  @override
  Future<MarkContactUsAsApprovedResponseModel> approveContactUs(
      String token, int contactUsId) async {
    final result = GetWithTokenApi(
        uri: Uri.parse("$baseUri/api/mark/contact/approved/$contactUsId"),
        token: token,
        fromJson: markContactUsAsApprovedModelFromJson);
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
  Future<MarkContactUsAsSeenResponseModel> seenContactUs(
      String token, int contactUsId) async {
    final result = GetWithTokenApi(
        uri: Uri.parse("$baseUri/api/mark/contact/seen/$contactUsId"),
        token: token,
        fromJson: markContactUsAsApprovedModelFromJson);
    return await result.callRequest();
  }

  @override
  Future<ShowNotApprovedContactUsResponseModel>
      showContactUsWithSeenAndApproved(
          int seenFilter, int approvedFilter) async {
    final result = GetApi(
        uri: Uri.parse(
            "$baseUri/api/show/contactUs?filter[seen]=$seenFilter&filter[tech_approved]=$approvedFilter"),
        fromJson: showNotApprovedContactUsResponseModelFromJson);
    return await result.callRequest();
  }
}
