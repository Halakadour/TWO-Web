import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/contact-us/domain/repos/contact_us_repo.dart';

class MarkContactUsAsSeenUsecase
    extends UseCase<Future<Either<Failure, Unit>>, MarkContactUsParam> {
  MarkContactUsAsSeenUsecase(this.contactUsRepo);
  final ContactUsRepo contactUsRepo;

  @override
  Future<Either<Failure, Unit>> call(MarkContactUsParam param) {
    return contactUsRepo.markContactUsAsSeen(param.token, param.contactUsId);
  }
}

class MarkContactUsParam {
  String token;
  int contactUsId;
  MarkContactUsParam({
    required this.token,
    required this.contactUsId,
  });
}
