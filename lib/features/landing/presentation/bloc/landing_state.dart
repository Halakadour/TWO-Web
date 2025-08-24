// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'landing_bloc.dart';

class LandingState {
  String message;
  CasualStatus showAboutUsStatus;
  AboutUsEntity? showAboutUsEntity;
  CasualStatus showWhyUsStatus;
  List<WhyUsEntity?> showWhyUsList;
  CasualStatus createContcatStatus;
  List<PostEntity> activePostsList;
  CasualStatus activePostsListStatus;
  CasualStatus sendReplyStatus;
  CasualStatus serviceListStatus;
  List<ServiceEntity> serviceList;
  CasualStatus createProjectStatus;
  LandingState({
    this.message = '',
    this.showAboutUsStatus = CasualStatus.initial,
    this.showAboutUsEntity,
    this.showWhyUsStatus = CasualStatus.initial,
    this.showWhyUsList = const [],
    this.createContcatStatus = CasualStatus.initial,
    this.activePostsList = const [],
    this.activePostsListStatus = CasualStatus.initial,
    this.sendReplyStatus = CasualStatus.initial,
    this.serviceListStatus = CasualStatus.initial,
    this.serviceList = const [],
    this.createProjectStatus = CasualStatus.initial,
  });

  LandingState copyWith({
    String? message,
    CasualStatus? showAboutUsStatus,
    AboutUsEntity? showAboutUsEntity,
    CasualStatus? showWhyUsStatus,
    List<WhyUsEntity?>? showWhyUsList,
    CasualStatus? createContcatStatus,
    List<PostEntity>? activePostsList,
    CasualStatus? activePostsListStatus,
    CasualStatus? sendReplyStatus,
    CasualStatus? serviceListStatus,
    List<ServiceEntity>? serviceList,
    CasualStatus? createProjectStatus,
  }) {
    return LandingState(
      message: message ?? this.message,
      showAboutUsStatus: showAboutUsStatus ?? this.showAboutUsStatus,
      showAboutUsEntity: showAboutUsEntity ?? this.showAboutUsEntity,
      showWhyUsStatus: showWhyUsStatus ?? this.showWhyUsStatus,
      showWhyUsList: showWhyUsList ?? this.showWhyUsList,
      createContcatStatus: createContcatStatus ?? this.createContcatStatus,
      activePostsList: activePostsList ?? this.activePostsList,
      activePostsListStatus:
          activePostsListStatus ?? this.activePostsListStatus,
      sendReplyStatus: sendReplyStatus ?? this.sendReplyStatus,
      serviceListStatus: serviceListStatus ?? this.serviceListStatus,
      serviceList: serviceList ?? this.serviceList,
      createProjectStatus: createProjectStatus ?? this.createProjectStatus,
    );
  }
}
