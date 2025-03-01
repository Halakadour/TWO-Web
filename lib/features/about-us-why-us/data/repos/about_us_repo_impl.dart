import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/features/about-us-why-us/data/datasources/about_us_remote_datasource.dart';
import 'package:two_website/features/about-us-why-us/domain/entities/about_us_entity.dart';
import 'package:two_website/features/about-us-why-us/domain/repos/about_us_repo.dart';
import 'package:two_website/features/about-us-why-us/domain/usecases/about-us-usecase/create_about_us_usecase.dart';
import 'package:two_website/features/about-us-why-us/domain/usecases/about-us-usecase/update_about_us_usecase.dart';

class AboutUsRepoImpl extends AboutUsRepo {
  final AboutUsRemoteDatasource aboutUsRemoteDatasource;

  AboutUsRepoImpl(this.aboutUsRemoteDatasource);
  @override
  Future<Either<Failure, AboutUsEntity>> createAboutUs(
      String token, String workTime, String site) {
    return wrapHandling(
      tryCall: () async {
        final result = await aboutUsRemoteDatasource.createAboutUs(
            CreateAboutUsParam(token: token, workTime: workTime, site: site));
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<AboutUsEntity>>> showAboutUs() {
    return wrapHandling(
      tryCall: () async {
        final result = await aboutUsRemoteDatasource.showAboutUs();
        return Right([result.data]);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> updateAboutUs(
      String token, AboutUsEntity aboutUs) {
    return wrapHandling(
      tryCall: () async {
        await aboutUsRemoteDatasource
            .updateAbout(UpdateAboutUsParam(token: token, aboutUs: aboutUs));
        return const Right(unit);
      },
    );
  }
}
