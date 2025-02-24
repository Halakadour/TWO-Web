import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/about-us-why-us/domain/repos/why_us_repo.dart';

class DeleteWhyUsUsecase
    extends UseCase<Future<Either<Failure, Unit>>, DeleteWhyUsParam> {
  final WhyUsRepo whyUsRepo;

  DeleteWhyUsUsecase(this.whyUsRepo);

  @override
  Future<Either<Failure, Unit>> call(DeleteWhyUsParam param) {
    return whyUsRepo.deleteWhyUs(param.token, param.whyUsId);
  }
}

class DeleteWhyUsParam {
  final String token;
  final String whyUsId;

  DeleteWhyUsParam({required this.token, required this.whyUsId});
}
