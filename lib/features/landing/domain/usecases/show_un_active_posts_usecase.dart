import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/no_param_use_case.dart';
import 'package:two_website/features/landing/domain/entities/post_entity.dart';
import 'package:two_website/features/landing/domain/repos/landing_repo.dart';

class ShowUnActivePostsUsecase
    extends NoParamUseCase<Future<Either<Failure, List<PostEntity>>>> {
  final LandingRepo postRepo;

  ShowUnActivePostsUsecase(this.postRepo);

  @override
  Future<Either<Failure, List<PostEntity>>> call() {
    return postRepo.showUnActivePosts();
  }
}
