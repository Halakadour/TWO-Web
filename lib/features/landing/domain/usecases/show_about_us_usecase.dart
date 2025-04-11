import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/no_param_use_case.dart';
import 'package:two_website/features/landing/domain/entities/about_us_entity.dart';
import 'package:two_website/features/landing/domain/repos/landing_repo.dart';

class ShowAboutUsUsecase
    extends NoParamUseCase<Future<Either<Failure, AboutUsEntity>>> {
  final LandingRepo aboutUsRepo;

  ShowAboutUsUsecase(this.aboutUsRepo);

  @override
  Future<Either<Failure, AboutUsEntity>> call() {
    return aboutUsRepo.showAboutUs();
  }
}
