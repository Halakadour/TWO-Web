import 'package:two_website/config/constants/base_uri.dart';
import 'package:two_website/core/api/get_with_token_api.dart';
import 'package:two_website/core/api/post_api_with_token.dart';
import 'package:two_website/features/contracts/data/models/contract/add_contract_response_model.dart';
import 'package:two_website/features/contracts/data/models/contract/add_sign_response_model.dart';
import 'package:two_website/features/contracts/data/models/contract/show_contract_response_model.dart';
import 'package:two_website/features/contracts/data/models/draft/add_draft_response_model.dart';
import 'package:two_website/features/contracts/data/models/draft/delete_draft_response_model.dart';
import 'package:two_website/features/contracts/data/models/draft/show_draft_response_model.dart';

abstract class ContractDatasource {
  //Contract ones
  Future<AddContractResponseModel> addContract(
      String token, String contract, int clientId, int drafId);
  Future<AddSignResponseModel> addSign(
      String token, String signature, int contractId);
  Future<ShowContractResponseModel> getContracts(String token, int filter);
  Future<ShowContractResponseModel> getClientContract(
      String token, int filter, String clientId);
  // Draf ones
  Future<AddDraftResponseModel> createDraft(
      String token, String draf, int clientId);
  Future<DeleteDraftResponseModel> deletDraft(String token, int drafId);
  Future<ShowDraftResponseModel> getDrafts(String token, int filter);
}

class ContractDatasourceImpl implements ContractDatasource {
  @override
  Future<AddContractResponseModel> addContract(
      String token, String contract, int clientId, int drafId) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/create/contract"),
        token: token,
        body: ({
          'contract': contract,
          'client_id': clientId,
          'draft_id': drafId
        }),
        fromJson: addContractResponseModelFromJson);
    return await result.call();
  }

  @override
  Future<AddSignResponseModel> addSign(
      String token, String signature, int contractId) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/add/sign"),
        token: token,
        body: ({'signature': signature, 'contract_id': contractId}),
        fromJson: addSignResponseModelFromJson);
    return await result.call();
  }

  @override
  Future<AddDraftResponseModel> createDraft(
      String token, String draf, int clientId) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/create/draft"),
        token: token,
        body: ({
          'contract': draf,
          'user_id': clientId,
        }),
        fromJson: addDraftResponseModelFromJson);
    return await result.call();
  }

  @override
  Future<DeleteDraftResponseModel> deletDraft(String token, int drafId) async {
    final result = GetWithTokenApi(
        uri: Uri.parse("$baseUri/api/delete/draft/contract/$drafId"),
        token: token,
        fromJson: deleteDraftResponseModelFromJson);
    return await result.callRequest();
  }

  @override
  Future<ShowContractResponseModel> getClientContract(
      String token, int filter, String clientId) async {
    final result = GetWithTokenApi(
        uri: Uri.parse(
            "$baseUri/api/show/client/contracts?filter[state]=$filter"),
        token: token,
        fromJson: showContractResponseModelFromJson);
    return await result.callRequest();
  }

  @override
  Future<ShowContractResponseModel> getContracts(
      String token, int filter) async {
    final result = GetWithTokenApi(
        uri: Uri.parse("$baseUri/api/show/contracts?filter[state]=$filter"),
        token: token,
        fromJson: showContractResponseModelFromJson);
    return await result.callRequest();
  }

  @override
  Future<ShowDraftResponseModel> getDrafts(String token, int filter) async {
    final result = GetWithTokenApi(
        uri: Uri.parse("$baseUri/api/show/drafts?filter[state]=$filter"),
        token: token,
        fromJson: showContractResponseModelFromJson);
    return await result.callRequest();
  }
}
