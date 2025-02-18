import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/network/network_connection_checker.dart';
import 'package:two_website/features/roles/data/datasources/role_local_datasource.dart';
import 'package:two_website/features/roles/data/datasources/role_remote_datasource.dart';
import 'package:two_website/features/roles/data/models/role_response_model.dart';
import 'package:two_website/features/roles/domain/repos/role_repo.dart';

class RoleRepoImpl extends RoleRepo {
  final RoleLocalDatasource roleLocalDatasource;
  final RoleRemoteDatasource roleRemoteDatasource;
  final NetworkInfo networkInfo;

  RoleRepoImpl(
      this.roleLocalDatasource, this.roleRemoteDatasource, this.networkInfo);
  @override
  Future<Either<Failure, RoleResponesModel>> showRoleClient() {
    return wrapHandling(
      tryCall: () async {
        final remoteRoles = await roleRemoteDatasource.showRoleClient();
        return Right(remoteRoles);
      },
    );
  }

  @override
  Future<Either<Failure, RoleResponesModel>> showRolesWithoutClient() {
    return wrapHandling(
      tryCall: () async {
        final remoteRoles = await roleRemoteDatasource.showRolesWithoutClient();
        return Right(remoteRoles);
        // if (await networkInfo.isConnected) {
        //   final remoteRoles =
        //       await roleRemoteDatasource.showRolesWithoutClient();
        //   roleLocalDatasource.cacheRoles(remoteRoles.data);
        //   return Right(remoteRoles);
        // } else {
        //   final localReplies = await roleLocalDatasource.getCachedRoles();
        //   return Right(
        //       RoleResponesModel(status: 200, msg: "Local", data: localReplies));
        // }
      },
    );
  }
}
