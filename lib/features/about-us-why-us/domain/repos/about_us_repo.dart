import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/error/handling_exception_manager.dart';
import 'package:two_website/features/about-us-why-us/domain/entities/about_us_entity.dart';

abstract class AboutUsRepo with HandlingExceptionManager {
  Future<Either<Failure, AboutUsEntity>> showAboutUs();
  Future<Either<Failure, AboutUsEntity>> createAboutUs(
      String token, String workTime, String site);
  Future<Either<Failure, Unit>> updateAboutUs(
      String token, AboutUsEntity aboutUs);
}
