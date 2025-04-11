import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/landing/data/models/contact_us_model.dart';
import 'package:two_website/features/landing/domain/repos/landing_repo.dart';

class CreateContactUsUsecase extends UseCase<
    Future<Either<Failure, ContactUsModel>>, CreateContactUsParam> {
  CreateContactUsUsecase(this.contactUsRepo);
  final LandingRepo contactUsRepo;

  @override
  Future<Either<Failure, ContactUsModel>> call(CreateContactUsParam param) {
    return contactUsRepo.createContactUs(
        param.token, param.subject, param.description, param.phone);
  }
}

class CreateContactUsParam {
  String token;
  String subject;
  String description;
  String phone;
  CreateContactUsParam({
    required this.token,
    required this.subject,
    required this.description,
    required this.phone,
  });
}
