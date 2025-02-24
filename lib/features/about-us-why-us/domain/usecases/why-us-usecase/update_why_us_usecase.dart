import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/about-us-why-us/domain/repos/why_us_repo.dart';

class UpdateWhyUsUsecase
    extends UseCase<Future<Either<Failure, Unit>>, UpdateWhyUsParam> {
  final WhyUsRepo whyUsRepo;

  UpdateWhyUsUsecase(this.whyUsRepo);

  @override
  Future<Either<Failure, Unit>> call(UpdateWhyUsParam param) {
    return whyUsRepo.updateWhyUs(param.token, param.whyUsId, param.whyUs);
  }
}

class UpdateWhyUsParam {
  final String token;
  final String whyUsId;
  final String whyUs;

  UpdateWhyUsParam(
      {required this.token, required this.whyUsId, required this.whyUs});
}
