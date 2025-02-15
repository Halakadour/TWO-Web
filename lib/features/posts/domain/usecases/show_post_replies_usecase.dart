// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/posts/domain/entities/reply_entity.dart';
import 'package:two_website/features/posts/domain/repos/post_repo.dart';

import '../../../../core/error/failures.dart';

class ShowPostRepliesUsecase extends UseCase<
    Future<Either<Failure, List<ReplyEntity>>>, PostRepliesOrDeleteParam> {
  ShowPostRepliesUsecase(this.postRepo);

  final PostRepo postRepo;
  @override
  Future<Either<Failure, List<ReplyEntity>>> call(
      PostRepliesOrDeleteParam param) {
    return postRepo.showPostReplies(param.postId, param.tokrn);
  }
}

class PostRepliesOrDeleteParam {
  final int postId;
  final String tokrn;
  PostRepliesOrDeleteParam({
    required this.postId,
    required this.tokrn,
  });
}
