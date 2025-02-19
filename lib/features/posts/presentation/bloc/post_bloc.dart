// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:two_website/core/network/enum_status.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/features/posts/domain/entities/post_entity.dart';
import 'package:two_website/features/posts/domain/entities/reply_entity.dart';
import 'package:two_website/features/posts/domain/usecases/accept_reply_usecase.dart';
import 'package:two_website/features/posts/domain/usecases/create_post_usecase.dart';
import 'package:two_website/features/posts/domain/usecases/delete_post_usecase.dart';
import 'package:two_website/features/posts/domain/usecases/reply_to_post_usecase.dart';
import 'package:two_website/features/posts/domain/usecases/show_active_posts_usecase.dart';
import 'package:two_website/features/posts/domain/usecases/show_post_accepted_replies_usecase.dart';
import 'package:two_website/features/posts/domain/usecases/show_post_replies_usecase.dart';
import 'package:two_website/features/posts/domain/usecases/show_un_active_posts_usecase.dart';
import 'package:two_website/features/posts/domain/usecases/un_active_post_usecase.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final AcceptReplyUsecase acceptReplyUsecase;
  final CreatePostUsecase createPostUsecase;
  final DeletePostUsecase deletePostUsecase;
  final ReplyToPostUsecase replyToPostUsecase;
  final ShowActivePostsUsecase showActivePostsUsecase;
  final ShowPostAcceptedRepliesUsecase showPostAcceptedRepliesUsecase;
  final ShowPostRepliesUsecase showPostRepliesUsecase;
  final ShowUnActivePostsUsecase showUnActivePostsUsecase;
  final UnActivePostUsecase unActivePostUsecase;
  PostBloc({
    required this.acceptReplyUsecase,
    required this.createPostUsecase,
    required this.deletePostUsecase,
    required this.replyToPostUsecase,
    required this.showActivePostsUsecase,
    required this.showPostAcceptedRepliesUsecase,
    required this.showPostRepliesUsecase,
    required this.showUnActivePostsUsecase,
    required this.unActivePostUsecase,
  }) : super(PostState()) {
    // CREATE POST //
    on<CreatePostEvent>((event, emit) async {
      emit(state.copyWith(createPostStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await createPostUsecase.call(
            PostParam(token: token, image: event.image, body: event.body));
        result.fold(
          (l) => emit(state.copyWith(
              createPostStatus: CasualStatus.failure, message: l.message)),
          (r) => emit(state.copyWith(createPostStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(createPostStatus: CasualStatus.noToken));
      }
    });
    // DELETE POST //
    on<DeletePostEvent>((event, emit) async {
      emit(state.copyWith(deletePostStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await deletePostUsecase.call(
            PostRepliesOrDeleteOrUnActiveParam(
                postId: event.postId, token: token));
        result.fold(
          (l) => emit(state.copyWith(
              deletePostStatus: CasualStatus.failure, message: l.message)),
          (r) => emit(state.copyWith(deletePostStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(deletePostStatus: CasualStatus.noToken));
      }
    });
    // UN ACTIVE POST //
    on<UnActivePostEvent>((event, emit) async {
      emit(state.copyWith(unActivePostStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await unActivePostUsecase.call(
            PostRepliesOrDeleteOrUnActiveParam(
                postId: event.postId, token: token));
        result.fold(
          (l) => emit(state.copyWith(
              unActivePostStatus: CasualStatus.failure, message: l.message)),
          (r) => emit(state.copyWith(unActivePostStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(unActivePostStatus: CasualStatus.noToken));
      }
    });
    // GET ACTIVE POSTS //
    on<GetActivePostsEvent>((event, emit) async {
      emit(state.copyWith(activePostsListStatus: CasualStatus.loading));
      final result = await showActivePostsUsecase.call();
      result.fold(
        (l) => emit(state.copyWith(
            activePostsListStatus: CasualStatus.failure, message: l.message)),
        (r) => emit(state.copyWith(
            activePostsListStatus: CasualStatus.success, activePostsList: r)),
      );
    });
    // GET UN ACTIVE POST //
    on<GetUnActivePostsEvent>((event, emit) async {
      emit(state.copyWith(unActivePostsListStatus: CasualStatus.loading));
      final result = await showActivePostsUsecase.call();
      result.fold(
        (l) => emit(state.copyWith(
            unActivePostsListStatus: CasualStatus.failure, message: l.message)),
        (r) => emit(state.copyWith(
            unActivePostsListStatus: CasualStatus.success,
            unActivePostsList: r)),
      );
    });
    // GET POST  REPLIES //
    on<GetPostsRepliesEvent>((event, emit) async {
      emit(state.copyWith(postsRepliesListStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showPostRepliesUsecase.call(
            PostRepliesOrDeleteOrUnActiveParam(
                postId: event.postId, token: token));
        result.fold(
          (l) => emit(state.copyWith(
              postsRepliesListStatus: CasualStatus.failure,
              message: l.message)),
          (r) => emit(state.copyWith(
              postsRepliesListStatus: CasualStatus.success,
              postRepliesList: r)),
        );
      } else {
        emit(state.copyWith(postsRepliesListStatus: CasualStatus.noToken));
      }
    });
    // GET POST  ACCEPTED REPLIES //
    on<GetPostsAcceptedRepliesEvent>((event, emit) async {
      emit(
          state.copyWith(postsAcceptedRepliesListStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showPostAcceptedRepliesUsecase.call(
            PostRepliesOrDeleteOrUnActiveParam(
                postId: event.postId, token: token));
        result.fold(
          (l) => emit(state.copyWith(
              postsAcceptedRepliesListStatus: CasualStatus.failure,
              message: l.message)),
          (r) => emit(state.copyWith(
              postsAcceptedRepliesListStatus: CasualStatus.success,
              postAcceptedRepliesList: r)),
        );
      } else {
        emit(state.copyWith(
            postsAcceptedRepliesListStatus: CasualStatus.noToken));
      }
    });
    // ACCEPT A REPLY //
    on<AcceptReplyEvent>((event, emit) async {
      emit(state.copyWith(acceptReplyStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await acceptReplyUsecase
            .call(AcceptReplyParam(replyId: event.replyId, token: token));
        result.fold(
          (l) => emit(state.copyWith(
              acceptReplyStatus: CasualStatus.failure, message: l.message)),
          (r) => emit(state.copyWith(
            acceptReplyStatus: CasualStatus.success,
          )),
        );
      } else {
        emit(state.copyWith(acceptReplyStatus: CasualStatus.noToken));
      }
    });
    // REPLY TO POST //
    on<ReplyToPostEvent>((event, emit) async {
      emit(state.copyWith(sendReplyStatus: CasualStatus.loading));
      final result = await replyToPostUsecase.call(ReplyParam(
          fullName: event.fullName,
          email: event.email,
          phone: event.phone,
          cv: event.cv,
          postId: event.postId));
      result.fold(
        (l) => emit(state.copyWith(
            sendReplyStatus: CasualStatus.failure, message: l.message)),
        (r) => emit(state.copyWith(
          sendReplyStatus: CasualStatus.success,
        )),
      );
    });
  }
}
