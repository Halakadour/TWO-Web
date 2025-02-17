import 'package:two_website/core/api/get_api.dart';
import 'package:two_website/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:two_website/features/roles/data/models/role_response_model.dart';

abstract class RoleRemoteDatasource {
  Future<RoleResponesModel> showRolesWithoutClient();
  Future<RoleResponesModel> showRoleClient();
}

class RoleRemoteDatasourceImpl extends RoleRemoteDatasource {
  @override
  Future<RoleResponesModel> showRoleClient() async {
    final result = GetApi(
        uri: Uri.parse("$baseUri/api/show/roles"),
        fromJson: roleResponesModelFromJson);
    return await result.callRequest();
  }

  @override
  Future<RoleResponesModel> showRolesWithoutClient() async {
    final result = GetApi(
        uri: Uri.parse("$baseUri/api/show/role/client"),
        fromJson: roleResponesModelFromJson);
    return await result.callRequest();
  }
}
