// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'post_bloc.dart';

// ignore: must_be_immutable
class PostState extends Equatable {
  CasualStatus createPostStatus;
  CasualStatus deletePostStatus;
  CasualStatus unActivePostStatus;
  CasualStatus sendReplyStatus;
  CasualStatus acceptReplyStatus;
  List<PostEntity> activePostsList;
  CasualStatus activePostsListStatus;
  List<PostEntity> unActivePostsList;
  CasualStatus unActivePostsListStatus;
  List<ReplyEntity> postRepliesList;
  CasualStatus postsRepliesListStatus;
  List<ReplyEntity> postAcceptedRepliesList;
  CasualStatus postsAcceptedRepliesListStatus;

  PostState({
    this.createPostStatus = CasualStatus.initial,
    this.deletePostStatus = CasualStatus.initial,
    this.unActivePostStatus = CasualStatus.initial,
    this.sendReplyStatus = CasualStatus.initial,
    this.acceptReplyStatus = CasualStatus.initial,
    this.activePostsList = const [],
    this.activePostsListStatus = CasualStatus.initial,
    this.unActivePostsList = const [],
    this.unActivePostsListStatus = CasualStatus.initial,
    this.postRepliesList = const [],
    this.postsRepliesListStatus = CasualStatus.initial,
    this.postAcceptedRepliesList = const [],
    this.postsAcceptedRepliesListStatus = CasualStatus.initial,
  });

  @override
  List<Object> get props => [
        createPostStatus,
        deletePostStatus,
        unActivePostStatus,
        sendReplyStatus,
        acceptReplyStatus,
        activePostsList,
        activePostsListStatus,
        unActivePostsList,
        unActivePostsListStatus,
        postRepliesList,
        postsRepliesListStatus,
        postAcceptedRepliesList,
        postsAcceptedRepliesListStatus,
      ];

  PostState copyWith({
    CasualStatus? createPostStatus,
    CasualStatus? deletePostStatus,
    CasualStatus? unActivePostStatus,
    CasualStatus? sendReplyStatus,
    CasualStatus? acceptReplyStatus,
    List<PostEntity>? activePostsList,
    CasualStatus? activePostsListStatus,
    List<PostEntity>? unActivePostsList,
    CasualStatus? unActivePostsListStatus,
    List<ReplyEntity>? postRepliesList,
    CasualStatus? postsRepliesListStatus,
    List<ReplyEntity>? postAcceptedRepliesList,
    CasualStatus? postsAcceptedRepliesListStatus,
  }) {
    return PostState(
      createPostStatus: createPostStatus ?? this.createPostStatus,
      deletePostStatus: deletePostStatus ?? this.deletePostStatus,
      unActivePostStatus: unActivePostStatus ?? this.unActivePostStatus,
      sendReplyStatus: sendReplyStatus ?? this.sendReplyStatus,
      acceptReplyStatus: acceptReplyStatus ?? this.acceptReplyStatus,
      activePostsList: activePostsList ?? this.activePostsList,
      activePostsListStatus:
          activePostsListStatus ?? this.activePostsListStatus,
      unActivePostsList: unActivePostsList ?? this.unActivePostsList,
      unActivePostsListStatus:
          unActivePostsListStatus ?? this.unActivePostsListStatus,
      postRepliesList: postRepliesList ?? this.postRepliesList,
      postsRepliesListStatus:
          postsRepliesListStatus ?? this.postsRepliesListStatus,
      postAcceptedRepliesList:
          postAcceptedRepliesList ?? this.postAcceptedRepliesList,
      postsAcceptedRepliesListStatus:
          postsAcceptedRepliesListStatus ?? this.postsAcceptedRepliesListStatus,
    );
  }
}
