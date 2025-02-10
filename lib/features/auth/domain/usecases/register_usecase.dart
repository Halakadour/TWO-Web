import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/auth/domain/entities/user_entity.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';

class RegisterUsecase extends UseCase<Future<UserEntity>, UserEntity> {
  final AuthRepo authRepo;
  RegisterUsecase(this.authRepo);

  @override
  Future<UserEntity> call(UserEntity param) async {
    return await authRepo.registNewUser(
        param.fullName, param.email, param.password, param.password);
  }
}
