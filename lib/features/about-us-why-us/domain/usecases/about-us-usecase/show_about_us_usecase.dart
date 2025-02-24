import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/no_param_use_case.dart';
import 'package:two_website/features/about-us-why-us/domain/entities/about_us_entity.dart';
import 'package:two_website/features/about-us-why-us/domain/repos/about_us_repo.dart';

class ShowAboutUsUsecase
    extends NoParamUseCase<Future<Either<Failure, List<AboutUsEntity>>>> {
  final AboutUsRepo aboutUsRepo;

  ShowAboutUsUsecase(this.aboutUsRepo);

  @override
  Future<Either<Failure, List<AboutUsEntity>>> call() {
    return aboutUsRepo.showAboutUs();
  }
}
