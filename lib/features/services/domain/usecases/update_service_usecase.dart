import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/services/domain/repos/service_repo.dart';

class UpdateServiceUsecase
    extends UseCase<Future<Either<Failure, Unit>>, UpdateServiceParam> {
  final ServiceRepo serviceRepo;

  UpdateServiceUsecase(this.serviceRepo);

  @override
  Future<Either<Failure, Unit>> call(UpdateServiceParam param) {
    return serviceRepo.updateService(param.token, param.serviceId, param.title,
        param.description, param.image);
  }
}

class UpdateServiceParam {
  final String token;
  final String serviceId;
  final String title;
  final String description;
  final String image;

  UpdateServiceParam(
      {required this.token,
      required this.serviceId,
      required this.title,
      required this.description,
      required this.image});
}
