import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/no_param_use_case.dart';
import 'package:two_website/features/landing/domain/repos/landing_repo.dart';
import 'package:two_website/features/landing/data/models/role_response_model.dart';

class ShowRolesUsecase
    extends NoParamUseCase<Future<Either<Failure, List<RoleModel>>>> {
  final LandingRepo roleRepo;

  ShowRolesUsecase(this.roleRepo);

  @override
  Future<Either<Failure, List<RoleModel>>> call() {
    return roleRepo.showRoles();
  }
}
