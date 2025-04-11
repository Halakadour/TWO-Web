import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
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
  LandingRepoImpl(this.landingRemoteDatasource);

  final LandingRemoteDatasource landingRemoteDatasource;

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
        final result = await landingRemoteDatasource.showAboutUs();
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<PostEntity>>> showActivePosts() {
    return wrapHandling(
      tryCall: () async {
        final result = await landingRemoteDatasource.showActivePosts();
        return Right(result.data);
        // if (await networkInfo.isConnected) {
        //   final remotePosts = await postRemoteDatasource.showActivePosts();
        //   postsLocalDatasource.cacheActivePosts(remotePosts.data);
        //   return Right(remotePosts.data);
        // } else {
        //   final localPosts = await postsLocalDatasource.getActiveCachedPosts();
        //   return Right(localPosts);
        // }
      },
    );
  }

  @override
  Future<Either<Failure, List<PostEntity>>> showUnActivePosts() {
    return wrapHandling(
      tryCall: () async {
        final result = await landingRemoteDatasource.showUnActivePosts();
        return Right(result.data);
        // if (await networkInfo.isConnected) {
        //   final remotePosts = await postRemoteDatasource.showUnActivePosts();
        //   postsLocalDatasource.cacheUnActivePosts(remotePosts.data);
        //   return Right(remotePosts.data);
        // } else {
        //   final localPosts =
        //       await postsLocalDatasource.getUnActiveCachedPosts();
        //   return Right(localPosts);
        // }
      },
    );
  }

  @override
  Future<Either<Failure, RoleResponesModel>> showRoleClient() {
    return wrapHandling(
      tryCall: () async {
        final remoteRoles = await landingRemoteDatasource.showRoleClient();
        return Right(remoteRoles);
      },
    );
  }

  @override
  Future<Either<Failure, RoleResponesModel>> showRolesWithoutClient() {
    return wrapHandling(
      tryCall: () async {
        final remoteRoles =
            await landingRemoteDatasource.showRolesWithoutClient();
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

  @override
  Future<Either<Failure, List<ServiceEntity>>> showService() {
    return wrapHandling(
      tryCall: () async {
        final result = await landingRemoteDatasource.showServices();
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<WhyUsEntity>>> showWhyUs() {
    return wrapHandling(
      tryCall: () async {
        final result = await landingRemoteDatasource.showWhyUs();
        return Right(result.data);
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
