import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/param/project_param.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/landing/domain/repos/landing_repo.dart';

class CreateProjectUsecase
    extends UseCase<Future<Either<Failure, Unit>>, CreateProjectParam> {
  final LandingRepo landingRepo;

  CreateProjectUsecase(this.landingRepo);

  @override
  Future<Either<Failure, Unit>> call(CreateProjectParam param) {
    return landingRepo.createProject(param);
  }
}
