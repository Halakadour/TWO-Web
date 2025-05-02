// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_website/core/error/exceptions.dart';
import 'package:two_website/features/auth/data/models/profile_model.dart';

abstract class AuthLocaleDataSource {
  Future<ProfileModel> getUserProfile();
  Future<Unit> cacheUserProfile(ProfileModel profileModel);
}

const String USER_PROFILE = "USER_PROFILE";

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
}
