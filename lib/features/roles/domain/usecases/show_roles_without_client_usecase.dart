import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/no_param_use_case.dart';
import 'package:two_website/features/roles/data/models/role_response_model.dart';
import 'package:two_website/features/roles/domain/repos/role_repo.dart';

class ShowRolesWithoutClientUsecase
    extends NoParamUseCase<Future<Either<Failure, RoleResponesModel>>> {
  final RoleRepo roleRepo;

  ShowRolesWithoutClientUsecase(this.roleRepo);

  @override
  Future<Either<Failure, RoleResponesModel>> call() {
    return roleRepo.showRolesWithoutClient();
  }
}
