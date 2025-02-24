import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/services/domain/repos/service_repo.dart';

class DeleteServiceUsecase
    extends UseCase<Future<Either<Failure, Unit>>, DeleteServiceParam> {
  final ServiceRepo serviceRepo;

  DeleteServiceUsecase(this.serviceRepo);

  @override
  Future<Either<Failure, Unit>> call(DeleteServiceParam param) {
    return serviceRepo.deleteService(param.token, param.serviceId);
  }
}

class DeleteServiceParam {
  final String token;
  final String serviceId;
  DeleteServiceParam({
    required this.token,
    required this.serviceId,
  });
}
