// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_website/core/error/exceptions.dart';

import 'package:two_website/features/posts/data/models/post_model.dart';
import 'package:two_website/features/posts/data/models/replay_model.dart';

abstract class PostsLocalDatasource {
  Future<List<PostModel>> getActiveCachedPosts();
  Future<Unit> cacheActivePosts(List<PostModel> postsList);
  Future<List<PostModel>> getUnActiveCachedPosts();
  Future<Unit> cacheUnActivePosts(List<PostModel> postsList);
  Future<List<ReplyModel>> getCachedPostReplies();
  Future<Unit> cachePostsReply(List<ReplyModel> repliesList);
  Future<List<ReplyModel>> getCachedAcceptedPostReplies();
  Future<Unit> cachePostsAcceptedReply(List<ReplyModel> repliesList);
}

const String ACTIVE_CACHED_POSTS = "ACTIVE-CACHED-POSTS";
const String UN_ACTIVE_CACHED_POSTS = "UN-ACTIVE-CACHED-POSTS";
const String CACHED_ACCEPTED_REPLIES = "CACHED-ACCEPTED-REPLIES";
const String CACHED_REPLIES = "CACHED-REPLIES";

class PostsLocalDatasourceImpl extends PostsLocalDatasource {
  SharedPreferences sharedPreferences;
  PostsLocalDatasourceImpl(
    this.sharedPreferences,
  );
  @override
  Future<Unit> cacheActivePosts(List<PostModel> postsList) {
    List postModelToJson = postsList
        .map<Map<String, dynamic>>(
          (post) => post.toJson(),
        )
        .toList();
    sharedPreferences.setString(
        ACTIVE_CACHED_POSTS, json.encode(postModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getActiveCachedPosts() {
    final jsonString = sharedPreferences.getString(ACTIVE_CACHED_POSTS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PostModel> jsonToPostModel = decodeJsonData
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModel);
    } else {
      throw EmptyCacheException(message: "Empty Cache Exception");
    }
  }

  @override
  Future<Unit> cachePostsAcceptedReply(List<ReplyModel> repliesList) {
    List replyModelToJson = repliesList
        .map<Map<String, dynamic>>(
          (reply) => reply.toJson(),
        )
        .toList();
    sharedPreferences.setString(
        CACHED_ACCEPTED_REPLIES, json.encode(replyModelToJson));
    return Future.value(unit);
  }

  @override
  Future<Unit> cachePostsReply(List<ReplyModel> repliesList) {
    List replyModelToJson = repliesList
        .map<Map<String, dynamic>>(
          (reply) => reply.toJson(),
        )
        .toList();
    sharedPreferences.setString(CACHED_REPLIES, json.encode(replyModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<ReplyModel>> getCachedAcceptedPostReplies() {
    final jsonString = sharedPreferences.getString(CACHED_ACCEPTED_REPLIES);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<ReplyModel> jsonToReplyModel = decodeJsonData
          .map<ReplyModel>(
              (jsonReplyModel) => ReplyModel.fromJson(jsonReplyModel))
          .toList();
      return Future.value(jsonToReplyModel);
    } else {
      throw EmptyCacheException(message: "Empty Cache Exception");
    }
  }

  @override
  Future<List<ReplyModel>> getCachedPostReplies() {
    final jsonString = sharedPreferences.getString(CACHED_ACCEPTED_REPLIES);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<ReplyModel> jsonToReplyModel = decodeJsonData
          .map<ReplyModel>(
              (jsonReplyModel) => ReplyModel.fromJson(jsonReplyModel))
          .toList();
      return Future.value(jsonToReplyModel);
    } else {
      throw EmptyCacheException(message: "Empty Cache Exception");
    }
  }

  @override
  Future<Unit> cacheUnActivePosts(List<PostModel> postsList) {
    List postModelToJson = postsList
        .map<Map<String, dynamic>>(
          (post) => post.toJson(),
        )
        .toList();
    sharedPreferences.setString(
        UN_ACTIVE_CACHED_POSTS, json.encode(postModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getUnActiveCachedPosts() {
    final jsonString = sharedPreferences.getString(UN_ACTIVE_CACHED_POSTS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PostModel> jsonToPostModel = decodeJsonData
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModel);
    } else {
      throw EmptyCacheException(message: "Empty Cache Exception");
    }
  }
}
