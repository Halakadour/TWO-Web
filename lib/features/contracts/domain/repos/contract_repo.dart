import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/error/handling_exception_manager.dart';
import 'package:two_website/features/contracts/data/models/contract/contract_model.dart';
import 'package:two_website/features/contracts/data/models/draft/draft_model.dart';

abstract class ContractRepo with HandlingExceptionManager {
  //Contract ones
  Future<Either<Failure, ContractModel>> addContract(
      String token, String contract, int clientId, int drafId);
  Future<Either<Failure, Unit>> addSign(
      String token, String signature, int contractId);
  Future<Either<Failure, List<ContractModel>>> getContracts(
      String token, int filter);
  Future<Either<Failure, List<ContractModel>>> getClientContract(
      String token, int filter, String clientId);
  // Draf ones
  Future<Either<Failure, DraftModel>> createDraft(
      String token, String draf, int clientId);
  Future<Either<Failure, Unit>> deletDraft(String token, int drafId);
  Future<Either<Failure, List<DraftModel>>> getDrafts(String token, int filter);
}
