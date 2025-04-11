import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/no_param_use_case.dart';
import 'package:two_website/features/landing/domain/entities/why_us_entity.dart';
import 'package:two_website/features/landing/domain/repos/landing_repo.dart';

class ShowWhyUsUsecase
    extends NoParamUseCase<Future<Either<Failure, List<WhyUsEntity?>>>> {
  final LandingRepo whyUsRepo;

  ShowWhyUsUsecase(this.whyUsRepo);

  @override
  Future<Either<Failure, List<WhyUsEntity?>>> call() {
    return whyUsRepo.showWhyUs();
  }
}
