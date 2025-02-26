import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/contact-us/domain/repos/contact_us_repo.dart';
import 'package:two_website/features/contact-us/domain/usecases/mark_contact_us_as_seen_usecase.dart';

class MarkContactUsAsApprovedUscase
    extends UseCase<Future<Either<Failure, Unit>>, MarkContactUsParam> {
  MarkContactUsAsApprovedUscase(this.contactUsRepo);
  final ContactUsRepo contactUsRepo;

  @override
  Future<Either<Failure, Unit>> call(MarkContactUsParam param) {
    return contactUsRepo.markContactUsAsApproved(
        param.token, param.contactUsId);
  }
}
