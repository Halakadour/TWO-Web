// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/contracts/domain/repos/contract_repo.dart';

class DeleteDraftUsecase
    extends UseCase<Future<Either<Failure, Unit>>, DeleteDrafParam> {
  DeleteDraftUsecase(this.contractRepo);
  final ContractRepo contractRepo;

  @override
  Future<Either<Failure, Unit>> call(DeleteDrafParam param) {
    return contractRepo.deletDraft(param.token, param.draftId);
  }
}

class DeleteDrafParam {
  String token;
  int draftId;
  DeleteDrafParam({required this.token, required this.draftId});
}
