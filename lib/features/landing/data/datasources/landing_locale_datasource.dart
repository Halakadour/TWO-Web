// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_website/core/error/exceptions.dart';
import 'package:two_website/features/landing/data/models/about_us_model.dart';
import 'package:two_website/features/landing/data/models/post_model.dart';
import 'package:two_website/features/landing/data/models/service_model.dart';
import 'package:two_website/features/landing/data/models/why_us_model.dart';

abstract class LandingLocaleDatasource {
  Future<AboutUsModel> getCachedAboutUs();
  Future<Unit> cacheAboutUs(AboutUsModel aboutUs);
  Future<List<WhyUsModel>> getCachedWhyUs();
  Future<Unit> cacheWhyUs(List<WhyUsModel> whyUsList);
  Future<List<PostModel>> getCachedActivePosts();
  Future<Unit> cacheActivePosts(List<PostModel> postsList);
  Future<List<PostModel>> getCachedUnActivePosts();
  Future<Unit> cacheUnActivePosts(List<PostModel> postsList);
  Future<List<ServiceModel>> getCachedServices();
  Future<Unit> cacheServices(List<ServiceModel> servicesList);
}

const String ABOUT_US = "ABOUT_US";
const String WHY_US = "WHY_US";
const String ACTIVE_POSTS = "ACTIVE_POSTS";
const String UN_ACTIVE_POSTS = "UN_ACTIVE_POSTS";
const String SERVICES = "SERVICES";

class LandingLocaleDatasourceImpl extends LandingLocaleDatasource {
  final SharedPreferences sharedPreferences;

  LandingLocaleDatasourceImpl(this.sharedPreferences);

  @override
  Future<Unit> cacheAboutUs(AboutUsModel aboutUs) {
    Map<String, dynamic> aboutUsModelToJson = aboutUs.toJson();
    sharedPreferences.setString(
      ABOUT_US,
      json.encode(aboutUsModelToJson),
    );
    return Future.value(unit);
  }

  @override
  Future<Unit> cacheActivePosts(List<PostModel> postsList) {
    List postModelToJson =
        postsList.map<Map<String, dynamic>>((post) => post.toJson()).toList();
    sharedPreferences.setString(
      ACTIVE_POSTS,
      json.encode(postModelToJson),
    );
    return Future.value(unit);
  }

  @override
  Future<Unit> cacheServices(List<ServiceModel> servicesList) {
    List serviceModelToJson = servicesList
        .map<Map<String, dynamic>>((service) => service.toJson())
        .toList();
    sharedPreferences.setString(
      SERVICES,
      json.encode(serviceModelToJson),
    );
    return Future.value(unit);
  }

  @override
  Future<Unit> cacheUnActivePosts(List<PostModel> postsList) {
    List postModelToJson =
        postsList.map<Map<String, dynamic>>((post) => post.toJson()).toList();
    sharedPreferences.setString(
      UN_ACTIVE_POSTS,
      json.encode(postModelToJson),
    );
    return Future.value(unit);
  }

  @override
  Future<Unit> cacheWhyUs(List<WhyUsModel> whyUsList) {
    List whyUsModelToJson =
        whyUsList.map<Map<String, dynamic>>((whyUs) => whyUs.toJson()).toList();
    sharedPreferences.setString(
      WHY_US,
      json.encode(whyUsModelToJson),
    );
    return Future.value(unit);
  }

  @override
  Future<AboutUsModel> getCachedAboutUs() {
    final jsonString = sharedPreferences.getString(ABOUT_US);
    if (jsonString != null) {
      Map<String, dynamic> decodeJsonData = json.decode(jsonString);
      AboutUsModel aboutUsModel = AboutUsModel.fromJson(decodeJsonData);
      return Future.value(aboutUsModel);
    } else {
      throw EmptyCacheException(message: "Empty Cache Exception");
    }
  }

  @override
  Future<List<PostModel>> getCachedActivePosts() {
    final jsonString = sharedPreferences.getString(ACTIVE_POSTS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PostModel> jsonToPostModel = decodeJsonData
          .map<PostModel>(
            (jsonPostModel) => PostModel.fromJson(jsonPostModel),
          )
          .toList();
      return Future.value(jsonToPostModel);
    } else {
      throw EmptyCacheException(message: "Empty Cache Exception");
    }
  }

  @override
  Future<List<ServiceModel>> getCachedServices() {
    final jsonString = sharedPreferences.getString(SERVICES);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<ServiceModel> jsonToServiceModel = decodeJsonData
          .map<ServiceModel>(
            (jsonServiceModel) => ServiceModel.fromJson(jsonServiceModel),
          )
          .toList();
      return Future.value(jsonToServiceModel);
    } else {
      throw EmptyCacheException(message: "Empty Cache Exception");
    }
  }

  @override
  Future<List<PostModel>> getCachedUnActivePosts() {
    final jsonString = sharedPreferences.getString(UN_ACTIVE_POSTS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PostModel> jsonToPostModel = decodeJsonData
          .map<PostModel>(
            (jsonPostModel) => PostModel.fromJson(jsonPostModel),
          )
          .toList();
      return Future.value(jsonToPostModel);
    } else {
      throw EmptyCacheException(message: "Empty Cache Exception");
    }
  }

  @override
  Future<List<WhyUsModel>> getCachedWhyUs() {
    final jsonString = sharedPreferences.getString(WHY_US);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<WhyUsModel> jsonToWhyUsModel = decodeJsonData
          .map<WhyUsModel>(
            (jsonWhyUsModel) => WhyUsModel.fromJson(jsonWhyUsModel),
          )
          .toList();
      return Future.value(jsonToWhyUsModel);
    } else {
      throw EmptyCacheException(message: "Empty Cache Exception");
    }
  }
}
