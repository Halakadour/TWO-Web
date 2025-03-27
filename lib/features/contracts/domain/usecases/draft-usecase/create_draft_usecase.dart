import 'package:dartz/dartz.dart';

import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/contracts/data/models/draft/draft_model.dart';
import 'package:two_website/features/contracts/domain/repos/contract_repo.dart';

class CreateDraftUsecase
    extends UseCase<Future<Either<Failure, DraftModel>>, CreateDrafParam> {
  CreateDraftUsecase(this.contractRepo);
  final ContractRepo contractRepo;

  @override
  Future<Either<Failure, DraftModel>> call(CreateDrafParam param) {
    return contractRepo.createDraft(param.token, param.draf, param.clientId);
  }
}

class CreateDrafParam {
  String token;
  String draf;
  int clientId;
  CreateDrafParam({
    required this.token,
    required this.draf,
    required this.clientId,
  });
}
