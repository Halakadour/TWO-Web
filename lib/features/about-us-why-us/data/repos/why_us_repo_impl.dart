import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/features/about-us-why-us/data/datasources/why_us_remote_datesource.dart';
import 'package:two_website/features/about-us-why-us/domain/entities/why_us_entity.dart';
import 'package:two_website/features/about-us-why-us/domain/repos/why_us_repo.dart';
import 'package:two_website/features/about-us-why-us/domain/usecases/why-us-usecase/create_why_us_usecase.dart';
import 'package:two_website/features/about-us-why-us/domain/usecases/why-us-usecase/delete_why_us_usecase.dart';
import 'package:two_website/features/about-us-why-us/domain/usecases/why-us-usecase/update_why_us_usecase.dart';

class WhyUsRepoImpl extends WhyUsRepo {
  final WhyUsRemoteDatesource whyUsRemoteDatesource;

  WhyUsRepoImpl(this.whyUsRemoteDatesource);
  @override
  Future<Either<Failure, WhyUsEntity>> createWhyUs(String token, String whyUs) {
    return wrapHandling(
      tryCall: () async {
        final result = await whyUsRemoteDatesource
            .createWhyUs(CreateWhyUsParam(token: token, whyUs: whyUs));
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteWhyUs(String token, int whyUsId) {
    return wrapHandling(
      tryCall: () async {
        await whyUsRemoteDatesource
            .deleteWhyUs(DeleteWhyUsParam(token: token, whyUsId: whyUsId));
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, List<WhyUsEntity?>>> showWhyUs() {
    return wrapHandling(
      tryCall: () async {
        final result = await whyUsRemoteDatesource.showWhyUs();
        return Right([result.data]);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> updateWhyUs(
      String token, int whyUsId, String whyUs) {
    return wrapHandling(
      tryCall: () async {
        await whyUsRemoteDatesource.updateWhyUs(
            UpdateWhyUsParam(token: token, whyUsId: whyUsId, whyUs: whyUs));
        return const Right(unit);
      },
    );
  }
}
