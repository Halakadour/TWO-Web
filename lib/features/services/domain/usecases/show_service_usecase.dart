import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/no_param_use_case.dart';
import 'package:two_website/features/services/domain/entities/service_entity.dart';
import 'package:two_website/features/services/domain/repos/service_repo.dart';

class ShowServiceUsecase
    extends NoParamUseCase<Future<Either<Failure, List<ServiceEntity>>>> {
  final ServiceRepo serviceRepo;

  ShowServiceUsecase(this.serviceRepo);

  @override
  Future<Either<Failure, List<ServiceEntity>>> call() {
    return serviceRepo.showService();
  }
}
