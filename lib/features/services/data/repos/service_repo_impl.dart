import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/features/services/data/datasources/service_remote_datasource.dart';
import 'package:two_website/features/services/domain/entities/service_entity.dart';
import 'package:two_website/features/services/domain/repos/service_repo.dart';

class ServiceRepoImpl extends ServiceRepo {
  final ServiceRemoteDatasource serviceRemoteDatasource;

  ServiceRepoImpl(this.serviceRemoteDatasource);
  @override
  Future<Either<Failure, ServiceEntity>> createService(
      String token, String title, String description, Uint8List image) {
    return wrapHandling(
      tryCall: () async {
        final result = await serviceRemoteDatasource.createService(
            token, title, description, image);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteService(String token, String serviceId) {
    return wrapHandling(
      tryCall: () async {
        await serviceRemoteDatasource.deleteService(
            token, int.parse(serviceId));
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, List<ServiceEntity>>> showService() {
    return wrapHandling(
      tryCall: () async {
        final result = await serviceRemoteDatasource.showServices();
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> updateService(String token, String serviceId,
      String title, String description, Uint8List image) {
    return wrapHandling(
      tryCall: () async {
        await serviceRemoteDatasource.deleteService(
            token, int.parse(serviceId));
        return const Right(unit);
      },
    );
  }
}
