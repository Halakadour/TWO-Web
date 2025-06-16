// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_website/core/error/exceptions.dart';
import 'package:two_website/core/models/profile_model.dart';
import 'package:two_website/features/auth/data/models/role_response_model.dart';

abstract class AuthLocaleDataSource {
  Future<ProfileModel> getUserProfile();
  Future<Unit> cacheUserProfile(ProfileModel profileModel);
  Future<Unit> cacheRoles(List<RoleModel> roleList);
  Future<List<RoleModel>> getCachedRoles();
}

const String USER_PROFILE = "USER_PROFILE";
const String ROLES = "ROLES";

class AuthLocaleDataSourceImpl extends AuthLocaleDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocaleDataSourceImpl(this.sharedPreferences);
  @override
  Future<Unit> cacheUserProfile(ProfileModel profileModel) {
    Map<String, dynamic> userModelToJson = profileModel.toJson();
    sharedPreferences.setString(USER_PROFILE, json.encode(userModelToJson));
    return Future.value(unit);
  }

  @override
  Future<ProfileModel> getUserProfile() async {
    final jsonString = sharedPreferences.getString(USER_PROFILE);
    if (jsonString != null) {
      Map<String, dynamic> decodeJsonData = json.decode(jsonString);
      ProfileModel profileModel = ProfileModel.fromJson(decodeJsonData);
      return profileModel;
    } else {
      throw EmptyCacheException(message: "Empty Cache Exception");
    }
  }

  @override
  Future<Unit> cacheRoles(List<RoleModel> roleList) {
    List roleModelToJson =
        roleList.map<Map<String, dynamic>>((role) => role.toJson()).toList();
    sharedPreferences.setString(
      ROLES,
      json.encode(roleModelToJson),
    );
    return Future.value(unit);
  }

  @override
  Future<List<RoleModel>> getCachedRoles() {
    final jsonString = sharedPreferences.getString(ROLES);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<RoleModel> jsonToRoleModel = decodeJsonData
          .map<RoleModel>(
            (jsonRoleModel) => RoleModel.fromJson(jsonRoleModel),
          )
          .toList();
      return Future.value(jsonToRoleModel);
    } else {
      throw EmptyCacheException(message: "Empty Cache Exception");
    }
  }
}
