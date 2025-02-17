import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:two_website/features/roles/data/models/role_response_model.dart';

import '../../../../core/error/exceptions.dart';

abstract class RoleLocalDatasource {
  Future<List<RoleModel>> getCachedRoles();
  Future<Unit> cacheRoles(List<RoleModel> roleList);
}

// ignore: constant_identifier_names
const String CACHED_ROLES = "CACHED-ROLES";

class RoleLocalDatasourceImpl extends RoleLocalDatasource {
  get sharedPreferences => null;

  @override
  Future<Unit> cacheRoles(List<RoleModel> roleList) {
    List roleModelToJson = roleList
        .map<Map<String, dynamic>>(
          (role) => role.toJson(),
        )
        .toList();
    sharedPreferences.setString(CACHED_ROLES, json.encode(roleModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<RoleModel>> getCachedRoles() {
    final jsonString = sharedPreferences.getString(CACHED_ROLES);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<RoleModel> jsonToRoleModel = decodeJsonData
          .map<RoleModel>((jsonRoleModel) => RoleModel.fromJson(jsonRoleModel))
          .toList();
      return Future.value(jsonToRoleModel);
    } else {
      throw EmptyCacheException(message: "Empty Cache Exception");
    }
  }
}
