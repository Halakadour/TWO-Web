// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/contracts/domain/repos/contract_repo.dart';

class AddSignUsecase
    extends UseCase<Future<Either<Failure, Unit>>, AddSignParam> {
  final ContractRepo contractRepo;

  AddSignUsecase(this.contractRepo);

  @override
  Future<Either<Failure, Unit>> call(AddSignParam param) {
    return contractRepo.addSign(param.token, param.signatur, param.contractId);
  }
}

class AddSignParam {
  String token;
  String signatur;
  int contractId;
  AddSignParam({
    required this.token,
    required this.signatur,
    required this.contractId,
  });
}
