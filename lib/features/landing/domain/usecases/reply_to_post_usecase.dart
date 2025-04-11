import 'package:dartz/dartz.dart';

import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/landing/domain/repos/landing_repo.dart';

import '../../../../core/error/failures.dart';
import '../entities/reply_entity.dart';

class ReplyToPostUsecase
    extends UseCase<Future<Either<Failure, ReplyEntity>>, ReplyParam> {
  ReplyToPostUsecase(this.postRepo);
  final LandingRepo postRepo;
  @override
  Future<Either<Failure, ReplyEntity>> call(ReplyParam param) {
    return postRepo.replyToPost(
        param.fullName, param.email, param.email, param.cv, param.postId);
  }
}

class ReplyParam {
  final String fullName;
  final String email;
  final String phone;
  final String cv;
  final int postId;
  ReplyParam({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.cv,
    required this.postId,
  });
}
