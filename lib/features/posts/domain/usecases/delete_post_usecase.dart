import 'package:dartz/dartz.dart';

import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/posts/domain/repos/post_repo.dart';

import '../../../../core/error/failures.dart';

class DeletePostUsecase extends UseCase<Future<Either<Failure, Unit>>, int> {
  DeletePostUsecase(this.postRepo);
  final PostRepo postRepo;

  @override
  Future<Either<Failure, Unit>> call(int param) {
    return postRepo.deletePost(param);
  }
}
