import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/no_param_use_case.dart';
import 'package:two_website/features/posts/domain/entities/post_entity.dart';
import 'package:two_website/features/posts/domain/repos/post_repo.dart';

class ShowPostsUsecase
    extends NoParamUseCase<Future<Either<Failure, List<PostEntity>>>> {
  final PostRepo postRepo;

  ShowPostsUsecase(this.postRepo);
  @override
  Future<Either<Failure, List<PostEntity>>> call() {
    return postRepo.showPosts();
  }
}
