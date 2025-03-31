import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/features/contracts/data/datasource/contract_datasource.dart';
import 'package:two_website/features/contracts/data/models/contract/contract_model.dart';
import 'package:two_website/features/contracts/data/models/draft/draft_model.dart';
import 'package:two_website/features/contracts/domain/repos/contract_repo.dart';

class ContractRepoImpl extends ContractRepo {
  final ContractDatasource contractDatasource;

  ContractRepoImpl(this.contractDatasource);
  @override
  Future<Either<Failure, ContractModel>> addContract(
      String token, String contract, int clientId, int drafId) {
    return wrapHandling(
      tryCall: () async {
        final result = await contractDatasource.addContract(
            token, contract, clientId, drafId);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> addSign(
      String token, String signature, int contractId) {
    return wrapHandling(
      tryCall: () async {
        await contractDatasource.addSign(token, signature, contractId);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, DraftModel>> createDraft(
      String token, String draf, int clientId) {
    return wrapHandling(
      tryCall: () async {
        final result =
            await contractDatasource.createDraft(token, draf, clientId);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deletDraft(String token, int drafId) {
    return wrapHandling(
      tryCall: () async {
        await contractDatasource.deletDraft(token, drafId);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, List<ContractModel>>> getClientContract(
      String token, int filter, String clientId) {
    return wrapHandling(
      tryCall: () async {
        final result =
            await contractDatasource.getClientContract(token, filter, clientId);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<ContractModel>>> getContracts(
      String token, int filter) {
    return wrapHandling(
      tryCall: () async {
        final result = await contractDatasource.getContracts(token, filter);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<DraftModel>>> getDrafts(
      String token, int filter) {
    return wrapHandling(
      tryCall: () async {
        final result = await contractDatasource.getDrafts(token, filter);
        return Right(result.data);
      },
    );
  }
}
