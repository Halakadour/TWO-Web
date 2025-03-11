part of 'about_us_why_us_bloc.dart';

class AboutUsWhyUsState {
  String message;
  CasualStatus createAboutUsStatus;
  CasualStatus showAboutUsStatus;
  AboutUsEntity? showAboutUsEntity;
  CasualStatus updateAboutUsStatus;
  CasualStatus createWhyUsStatus;
  CasualStatus deleteWhyUsStatus;
  CasualStatus showWhyUsStatus;
  List<WhyUsEntity?> showWhyUsList;
  CasualStatus updateWhyUsStatus;

  AboutUsWhyUsState(
      {this.message = "",
      this.createAboutUsStatus = CasualStatus.initial,
      this.showAboutUsStatus = CasualStatus.initial,
      this.showAboutUsEntity,
      this.updateAboutUsStatus = CasualStatus.initial,
      this.createWhyUsStatus = CasualStatus.initial,
      this.deleteWhyUsStatus = CasualStatus.initial,
      this.showWhyUsStatus = CasualStatus.initial,
      this.showWhyUsList = const [],
      this.updateWhyUsStatus = CasualStatus.initial});

  AboutUsWhyUsState copyWith({
    String? message,
    CasualStatus? createAboutUsStatus,
    CasualStatus? showAboutUsStatus,
    AboutUsEntity? showAboutUsEntity,
    CasualStatus? updateAboutUsStatus,
    CasualStatus? createWhyUsStatus,
    CasualStatus? deleteWhyUsStatus,
    CasualStatus? showWhyUsStatus,
    List<WhyUsEntity?>? showWhyUsList,
    CasualStatus? updateWhyUsStatus,
  }) {
    return AboutUsWhyUsState(
      message: message ?? this.message,
      createAboutUsStatus: createAboutUsStatus ?? this.createAboutUsStatus,
      showAboutUsStatus: showAboutUsStatus ?? this.showAboutUsStatus,
      showAboutUsEntity: showAboutUsEntity ?? this.showAboutUsEntity,
      updateAboutUsStatus: updateAboutUsStatus ?? this.updateAboutUsStatus,
      createWhyUsStatus: createWhyUsStatus ?? this.createWhyUsStatus,
      deleteWhyUsStatus: deleteWhyUsStatus ?? this.deleteWhyUsStatus,
      showWhyUsStatus: showWhyUsStatus ?? this.showWhyUsStatus,
      showWhyUsList: showWhyUsList ?? this.showWhyUsList,
      updateWhyUsStatus: updateWhyUsStatus ?? this.updateWhyUsStatus,
    );
  }
}
