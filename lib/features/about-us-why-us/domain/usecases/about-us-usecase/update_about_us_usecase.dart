import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/about-us-why-us/domain/entities/about_us_entity.dart';
import 'package:two_website/features/about-us-why-us/domain/repos/about_us_repo.dart';

class UpdateAboutUsUsecase
    extends UseCase<Future<Either<Failure, Unit>>, UpdateAboutUsParam> {
  final AboutUsRepo aboutUsRepol;

  UpdateAboutUsUsecase(this.aboutUsRepol);

  @override
  Future<Either<Failure, Unit>> call(UpdateAboutUsParam param) {
    return aboutUsRepol.updateAboutUs(param.token, param.aboutUs);
  }
}

class UpdateAboutUsParam {
  final String token;
  final AboutUsEntity aboutUs;

  UpdateAboutUsParam({required this.token, required this.aboutUs});
}
