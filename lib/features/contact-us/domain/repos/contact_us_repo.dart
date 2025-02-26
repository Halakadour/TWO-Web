import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/error/handling_exception_manager.dart';
import 'package:two_website/features/contact-us/data/models/contact_us_model.dart';

abstract class ContactUsRepo with HandlingExceptionManager {
  Future<Either<Failure, List<ContactUsModel>>>
      showContactUsWithSeenAndApproved(int seenFilter, int approvedFilter);
  Future<Either<Failure, ContactUsModel>> createContactUs(
      String token, String subject, String description, String phone);
  Future<Either<Failure, Unit>> markContactUsAsSeen(
      String token, int contactUsId);
  Future<Either<Failure, Unit>> markContactUsAsApproved(
      String token, int contactUsId);
}
