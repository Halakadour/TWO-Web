import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/about-us-why-us/domain/entities/why_us_entity.dart';
import 'package:two_website/features/about-us-why-us/domain/repos/why_us_repo.dart';

class CreateWhyUsUsecase
    extends UseCase<Future<Either<Failure, WhyUsEntity>>, CreateWhyUsParam> {
  final WhyUsRepo whyUsRepo;

  CreateWhyUsUsecase(this.whyUsRepo);

  @override
  Future<Either<Failure, WhyUsEntity>> call(CreateWhyUsParam param) {
    return whyUsRepo.createWhyUs(param.token, param.whyUs);
  }
}

class CreateWhyUsParam {
  final String token;
  final String whyUs;

  CreateWhyUsParam({required this.token, required this.whyUs});
}
