import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/contracts/data/models/draft/draft_model.dart';
import 'package:two_website/features/contracts/domain/repos/contract_repo.dart';

class GetDraftUsecase extends UseCase<Future<Either<Failure, List<DraftModel>>>,
    GetDraftOrContractParam> {
  GetDraftUsecase(this.contractRepo);

  final ContractRepo contractRepo;

  @override
  Future<Either<Failure, List<DraftModel>>> call(
      GetDraftOrContractParam param) {
    return contractRepo.getDrafts(param.token, param.filter);
  }
}

class GetDraftOrContractParam {
  String token;
  int filter;
  GetDraftOrContractParam({required this.token, required this.filter});
}
