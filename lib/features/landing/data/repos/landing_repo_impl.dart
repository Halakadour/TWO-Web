import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/network/network_connection_checker.dart';
import 'package:two_website/features/landing/data/datasources/landing_locale_datasource.dart';
import 'package:two_website/features/landing/data/datasources/landing_remote_datasource.dart';
import 'package:two_website/features/landing/data/models/contact_us_model.dart';
import 'package:two_website/features/landing/data/models/role_response_model.dart';
import 'package:two_website/features/landing/data/models/update_profile_response_model.dart';
import 'package:two_website/features/landing/domain/entities/about_us_entity.dart';
import 'package:two_website/features/landing/domain/entities/post_entity.dart';
import 'package:two_website/features/landing/domain/entities/reply_entity.dart';
import 'package:two_website/features/landing/domain/entities/service_entity.dart';
import 'package:two_website/features/landing/domain/entities/why_us_entity.dart';
import 'package:two_website/features/landing/domain/repos/landing_repo.dart';

class LandingRepoImpl extends LandingRepo {
  LandingRepoImpl(this.landingRemoteDatasource, this.landingLocaleDatasource,
      this.networkInfo);

  final LandingRemoteDatasource landingRemoteDatasource;
  final LandingLocaleDatasource landingLocaleDatasource;
  final NetworkInfoImpl networkInfo;

  @override
  Future<Either<Failure, ContactUsModel>> createContactUs(
      String token, String subject, String description, String phone) {
    return wrapHandling(
      tryCall: () async {
        final result = await landingRemoteDatasource.createContactUs(
            token, subject, description, phone);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, ReplyEntity>> replyToPost(
      String fullName, String email, String phone, String cv, int postId) {
    return wrapHandling(
      tryCall: () async {
        final result = await landingRemoteDatasource.replyToPost(
            fullName, email, phone, cv, postId);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, AboutUsEntity>> showAboutUs() {
    return wrapHandling(
      tryCall: () async {
        if (await networkInfo.isConnected) {
          final remoteAboutUs = await landingRemoteDatasource.showAboutUs();
          landingLocaleDatasource.cacheAboutUs(remoteAboutUs.data);
          return Right(remoteAboutUs.data);
        } else {
          final localAboutUs = await landingLocaleDatasource.getCachedAboutUs();
          return Right(localAboutUs);
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<PostEntity>>> showActivePosts() {
    return wrapHandling(
      tryCall: () async {
        if (await networkInfo.isConnected) {
          final remotePosts = await landingRemoteDatasource.showActivePosts();
          landingLocaleDatasource.cacheActivePosts(remotePosts.data);
          return Right(remotePosts.data);
        } else {
          final localPosts =
              await landingLocaleDatasource.getCachedActivePosts();
          return Right(localPosts);
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<RoleModel>>> showRoles() {
    return wrapHandling(
      tryCall: () async {
        if (await networkInfo.isConnected) {
          final remoteRoles = await landingRemoteDatasource.showRoleClient();
          landingLocaleDatasource.cacheRoles(remoteRoles.data);
          return Right(remoteRoles.data);
        } else {
          final localRoles = await landingLocaleDatasource.getCachedRoles();
          return Right(localRoles);
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<ServiceEntity>>> showService() {
    return wrapHandling(
      tryCall: () async {
        if (await networkInfo.isConnected) {
          final remoteServices = await landingRemoteDatasource.showServices();
          landingLocaleDatasource.cacheServices(remoteServices.data);
          return Right(remoteServices.data);
        } else {
          final localServices =
              await landingLocaleDatasource.getCachedServices();
          return Right(localServices);
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<WhyUsEntity>>> showWhyUs() {
    return wrapHandling(
      tryCall: () async {
        if (await networkInfo.isConnected) {
          final remoteWhys = await landingRemoteDatasource.showWhyUs();
          landingLocaleDatasource.cacheWhyUs(remoteWhys.data);
          return Right(remoteWhys.data);
        } else {
          final localWhys = await landingLocaleDatasource.getCachedWhyUs();
          return Right(localWhys);
        }
      },
    );
  }

  @override
  Future<Either<Failure, UpdateProfileResponesModel>> updateClientProfile(
      String token,
      String image,
      int roleId,
      String subject,
      String description,
      String phone) {
    return wrapHandling(
      tryCall: () async {
        final result = await landingRemoteDatasource.updateClientProfile(
            token, image, roleId, subject, description, phone);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<Failure, UpdateProfileResponesModel>> updateFreelancerProfile(
      String token, String image, int roleId) {
    return wrapHandling(
      tryCall: () async {
        final result = await landingRemoteDatasource.updateFreeLanceProfile(
            token, image, roleId);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<Failure, UpdateProfileResponesModel>> updateGuestProfile(
      String token, String image, int roleId) {
    return wrapHandling(
      tryCall: () async {
        final result = await landingRemoteDatasource.updateGuestProfile(
            token, image, roleId);
        return Right(result);
      },
    );
  }
}
