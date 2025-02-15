import 'package:dartz/dartz.dart';

import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/posts/domain/repos/post_repo.dart';
import 'package:two_website/features/posts/domain/usecases/show_post_replies_usecase.dart';

import '../../../../core/error/failures.dart';

class DeletePostUsecase
    extends UseCase<Future<Either<Failure, Unit>>, PostRepliesOrDeleteParam> {
  DeletePostUsecase(this.postRepo);
  final PostRepo postRepo;

  @override
  Future<Either<Failure, Unit>> call(PostRepliesOrDeleteParam param) {
    return postRepo.deletePost(param.tokrn, param.postId);
  }
}
