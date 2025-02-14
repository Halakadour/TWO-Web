import 'package:dartz/dartz.dart';

import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/posts/domain/repos/post_repo.dart';

class AcceptReplyUsecase
    extends UseCase<Future<Either<Failure, Unit>>, AcceptReplyParam> {
  AcceptReplyUsecase(this.postRepo);
  final PostRepo postRepo;

  @override
  Future<Either<Failure, Unit>> call(AcceptReplyParam param) {
    return postRepo.acceptReply(param.replyId, param.token);
  }
}

class AcceptReplyParam {
  final int replyId;
  final String token;
  AcceptReplyParam({
    required this.replyId,
    required this.token,
  });
}
