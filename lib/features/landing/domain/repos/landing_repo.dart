import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/error/handling_exception_manager.dart';
import 'package:two_website/features/landing/domain/entities/about_us_entity.dart';
import 'package:two_website/features/landing/domain/entities/why_us_entity.dart';
import 'package:two_website/features/landing/data/models/contact_us_model.dart';
import 'package:two_website/features/landing/domain/entities/post_entity.dart';
import 'package:two_website/features/landing/domain/entities/reply_entity.dart';
import 'package:two_website/features/landing/data/models/update_profile_response_model.dart';
import 'package:two_website/features/landing/data/models/role_response_model.dart';
import 'package:two_website/features/landing/domain/entities/service_entity.dart';

abstract class LandingRepo with HandlingExceptionManager {
  // Why Us About Us
  Future<Either<Failure, AboutUsEntity>> showAboutUs();
  Future<Either<Failure, List<WhyUsEntity>>> showWhyUs();
  // Contact Us
  Future<Either<Failure, ContactUsModel>> createContactUs(
      String token, String subject, String description, String phone);
  // Posts
  Future<Either<Failure, List<PostEntity>>> showActivePosts();
  Future<Either<Failure, ReplyEntity>> replyToPost(
      String fullName, String email, String phone, String cv, int postId);
  // Profile
  Future<Either<Failure, UpdateProfileResponesModel>> updateFreelancerProfile(
      String token, String image, int roleId);
  Future<Either<Failure, UpdateProfileResponesModel>> updateGuestProfile(
      String token, String image, int roleId);
  Future<Either<Failure, UpdateProfileResponesModel>> updateClientProfile(
      String token,
      String image,
      int roleId,
      String subject,
      String description,
      String phone);
  Future<Either<Failure, List<RoleModel>>> showRoles();
  // Service
  Future<Either<Failure, List<ServiceEntity>>> showService();
}
