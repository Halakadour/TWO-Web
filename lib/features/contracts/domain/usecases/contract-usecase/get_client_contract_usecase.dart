// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/contracts/data/models/contract/contract_model.dart';
import 'package:two_website/features/contracts/domain/repos/contract_repo.dart';

class GetClientContractUsecase extends UseCase<
    Future<Either<Failure, List<ContractModel>>>, GetClientContractParam> {
  final ContractRepo contractRepo;

  GetClientContractUsecase(this.contractRepo);

  @override
  Future<Either<Failure, List<ContractModel>>> call(
      GetClientContractParam param) {
    return contractRepo.getClientContract(
        param.token, param.filter, param.clientId);
  }
}

class GetClientContractParam {
  String token;
  int filter;
  String clientId;
  GetClientContractParam({
    required this.token,
    required this.filter,
    required this.clientId,
  });
}
