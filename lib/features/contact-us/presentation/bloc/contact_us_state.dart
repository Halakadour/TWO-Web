// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'contact_us_bloc.dart';

class ContactUsState {
  String message;
  List<ContactUsModel> contactUsList;
  CasualStatus contactUsListStatus;
  CasualStatus createContcatStatus;
  CasualStatus seenMarkerStatus;
  CasualStatus approvedMarkerStatus;
  ContactUsState({
    this.message = "",
    this.contactUsList = const [],
    this.contactUsListStatus = CasualStatus.initial,
    this.createContcatStatus = CasualStatus.initial,
    this.seenMarkerStatus = CasualStatus.initial,
    this.approvedMarkerStatus = CasualStatus.initial,
  });

  ContactUsState copyWith({
    String? message,
    List<ContactUsModel>? contactUsList,
    CasualStatus? contactUsListStatus,
    CasualStatus? createContcatStatus,
    CasualStatus? seenMarkerStatus,
    CasualStatus? approvedMarkerStatus,
  }) {
    return ContactUsState(
      message: message ?? this.message,
      contactUsList: contactUsList ?? this.contactUsList,
      contactUsListStatus: contactUsListStatus ?? this.contactUsListStatus,
      createContcatStatus: createContcatStatus ?? this.createContcatStatus,
      seenMarkerStatus: seenMarkerStatus ?? this.seenMarkerStatus,
      approvedMarkerStatus: approvedMarkerStatus ?? this.approvedMarkerStatus,
    );
  }
}
