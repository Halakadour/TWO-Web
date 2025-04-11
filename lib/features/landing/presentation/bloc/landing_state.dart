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
  List<PostEntity> unActivePostsList;
  CasualStatus unActivePostsListStatus;
  CasualStatus sendReplyStatus;
  CasualStatus serviceListStatus;
  List<ServiceEntity> serviceList;
  LandingState({
    this.message = '',
    this.showAboutUsStatus = CasualStatus.initial,
    this.showAboutUsEntity,
    this.showWhyUsStatus = CasualStatus.initial,
    this.showWhyUsList = const [],
    this.createContcatStatus = CasualStatus.initial,
    this.activePostsList = const [],
    this.activePostsListStatus = CasualStatus.initial,
    this.unActivePostsList = const [],
    this.unActivePostsListStatus = CasualStatus.initial,
    this.sendReplyStatus = CasualStatus.initial,
    this.serviceListStatus = CasualStatus.initial,
    this.serviceList = const [],
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
    List<PostEntity>? unActivePostsList,
    CasualStatus? unActivePostsListStatus,
    CasualStatus? sendReplyStatus,
    CasualStatus? serviceListStatus,
    List<ServiceEntity>? serviceList,
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
      unActivePostsList: unActivePostsList ?? this.unActivePostsList,
      unActivePostsListStatus:
          unActivePostsListStatus ?? this.unActivePostsListStatus,
      sendReplyStatus: sendReplyStatus ?? this.sendReplyStatus,
      serviceListStatus: serviceListStatus ?? this.serviceListStatus,
      serviceList: serviceList ?? this.serviceList,
    );
  }
}
