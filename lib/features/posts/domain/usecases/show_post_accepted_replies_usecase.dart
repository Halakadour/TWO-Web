// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/posts/domain/entities/reply_entity.dart';
import 'package:two_website/features/posts/domain/repos/post_repo.dart';
import 'package:two_website/features/posts/domain/usecases/show_post_replies_usecase.dart';

import '../../../../core/error/failures.dart';

class ShowPostAcceptedRepliesUsecase extends UseCase<
    Future<Either<Failure, List<ReplyEntity>>>,
    PostRepliesOrDeleteOrUnActiveParam> {
  ShowPostAcceptedRepliesUsecase(this.postRepo);

  final PostRepo postRepo;
  @override
  Future<Either<Failure, List<ReplyEntity>>> call(
      PostRepliesOrDeleteOrUnActiveParam param) {
    return postRepo.showPostReplies(param.postId, param.token);
  }
}
