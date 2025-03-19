import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/error/handling_exception_manager.dart';
import 'package:two_website/features/services/domain/entities/service_entity.dart';

abstract class ServiceRepo with HandlingExceptionManager {
  Future<Either<Failure, ServiceEntity>> createService(
      String token, String title, String description, String image);
  Future<Either<Failure, Unit>> deleteService(String token, String serviceId);
  Future<Either<Failure, List<ServiceEntity>>> showService();
  Future<Either<Failure, Unit>> updateService(String token, String serviceId,
      String title, String description, String image);
}
