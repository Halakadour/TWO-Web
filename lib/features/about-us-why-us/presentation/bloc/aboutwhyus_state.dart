// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'aboutwhyus_bloc.dart';

class AboutwhyusState {
  final CasualStatus createAboutUsStatus;
  final CasualStatus showAboutUsStatus;
  final List<AboutUsEntity> showAboutUsList;
  final CasualStatus updateAboutUsStatus;
  final CasualStatus createWhyUsStatus;
  final CasualStatus deleteWhyUsStatus;
  final CasualStatus showWhyUsStatus;
  final List<WhyUsEntity> showWhyUsList;
  final CasualStatus updateWhyUsStatus;
  AboutwhyusState({
    this.createAboutUsStatus = CasualStatus.initial,
    this.showAboutUsStatus = CasualStatus.initial,
    this.showAboutUsList = const [],
    this.updateAboutUsStatus = CasualStatus.initial,
    this.createWhyUsStatus = CasualStatus.initial,
    this.deleteWhyUsStatus = CasualStatus.initial,
    this.showWhyUsStatus = CasualStatus.initial,
    this.showWhyUsList = const [],
    this.updateWhyUsStatus = CasualStatus.initial,
  });

  AboutwhyusState copyWith({
    CasualStatus? createAboutUsStatus,
    CasualStatus? showAboutUsStatus,
    List<AboutUsEntity>? showAboutUsList,
    CasualStatus? updateAboutUsStatus,
    CasualStatus? createWhyUsStatus,
    CasualStatus? deleteWhyUsStatus,
    CasualStatus? showWhyUsStatus,
    List<WhyUsEntity>? showWhyUsList,
    CasualStatus? updateWhyUsStatus,
  }) {
    return AboutwhyusState(
      createAboutUsStatus: createAboutUsStatus ?? this.createAboutUsStatus,
      showAboutUsStatus: showAboutUsStatus ?? this.showAboutUsStatus,
      showAboutUsList: showAboutUsList ?? this.showAboutUsList,
      updateAboutUsStatus: updateAboutUsStatus ?? this.updateAboutUsStatus,
      createWhyUsStatus: createWhyUsStatus ?? this.createWhyUsStatus,
      deleteWhyUsStatus: deleteWhyUsStatus ?? this.deleteWhyUsStatus,
      showWhyUsStatus: showWhyUsStatus ?? this.showWhyUsStatus,
      showWhyUsList: showWhyUsList ?? this.showWhyUsList,
      updateWhyUsStatus: updateWhyUsStatus ?? this.updateWhyUsStatus,
    );
  }
}
