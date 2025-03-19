// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'post_bloc.dart';

class PostEvent {
  const PostEvent();
}

class CreatePostEvent extends PostEvent {
  final String image;
  final String body;
  const CreatePostEvent({
    required this.image,
    required this.body,
  });
}

class DeletePostEvent extends PostEvent {
  final int postId;
  const DeletePostEvent({
    required this.postId,
  });
}

class UnActivePostEvent extends PostEvent {
  final int postId;
  const UnActivePostEvent({
    required this.postId,
  });
}

class GetActivePostsEvent extends PostEvent {}

class GetUnActivePostsEvent extends PostEvent {}

class GetPostsRepliesEvent extends PostEvent {
  final int postId;
  const GetPostsRepliesEvent({
    required this.postId,
  });
}

class GetPostsAcceptedRepliesEvent extends PostEvent {
  final int postId;
  const GetPostsAcceptedRepliesEvent({
    required this.postId,
  });
}

class AcceptReplyEvent extends PostEvent {
  final int replyId;
  const AcceptReplyEvent({
    required this.replyId,
  });
}

class ReplyToPostEvent extends PostEvent {
  final String fullName;
  final String email;
  final String phone;
  final String cv;
  final int postId;
  const ReplyToPostEvent({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.cv,
    required this.postId,
  });
}
