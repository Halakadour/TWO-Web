import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/features/contact-us/data/datasources/contact_us_remote_datasource.dart';
import 'package:two_website/features/contact-us/data/models/contact_us_model.dart';
import 'package:two_website/features/contact-us/domain/repos/contact_us_repo.dart';

class ContactUsRepoImpl extends ContactUsRepo {
  ContactUsRepoImpl(this.contactUsRemoteDatasource);
  final ContactUsRemoteDatasource contactUsRemoteDatasource;

  @override
  Future<Either<Failure, ContactUsModel>> createContactUs(
      String token, String subject, String description, String phone) {
    return wrapHandling(
      tryCall: () async {
        final result = await contactUsRemoteDatasource.createContactUs(
            token, subject, description, phone);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> markContactUsAsApproved(
      String token, int contactUsId) async {
    return wrapHandling(
      tryCall: () async {
        await contactUsRemoteDatasource.approveContactUs(token, contactUsId);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> markContactUsAsSeen(
      String token, int contactUsId) async {
    return wrapHandling(
      tryCall: () async {
        await contactUsRemoteDatasource.seenContactUs(token, contactUsId);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, List<ContactUsModel>>>
      showContactUsWithSeenAndApproved(int seenFilter, int approvedFilter) {
    return wrapHandling(
      tryCall: () async {
        final result = await contactUsRemoteDatasource
            .showContactUsWithSeenAndApproved(seenFilter, approvedFilter);
        return Right(result.data);
      },
    );
  }
}
