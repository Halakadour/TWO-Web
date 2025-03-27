import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/contracts/data/models/contract/contract_model.dart';
import 'package:two_website/features/contracts/domain/repos/contract_repo.dart';
import 'package:two_website/features/contracts/domain/usecases/draft-usecase/get_draft_usecase.dart';

class GetContractsUsecase extends UseCase<
    Future<Either<Failure, List<ContractModel>>>, GetDraftOrContractParam> {
  final ContractRepo contractRepo;

  GetContractsUsecase(this.contractRepo);

  @override
  Future<Either<Failure, List<ContractModel>>> call(
      GetDraftOrContractParam param) {
    return contractRepo.getContracts(param.token, param.filter);
  }
}
