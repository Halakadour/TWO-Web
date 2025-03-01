// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'contact_us_bloc.dart';

class ContactUsEvent {}

class GetContactUsWithSeenAndApprovedEvent extends ContactUsEvent {
  int seenFilter;
  int approvedFilter;
  GetContactUsWithSeenAndApprovedEvent({
    this.seenFilter = 0,
    this.approvedFilter = 0,
  });
}

class CreateContactUsEvent extends ContactUsEvent {
  String subject;
  String description;
  String phone;
  CreateContactUsEvent({
    required this.subject,
    required this.description,
    required this.phone,
  });
}

class MarkContactUsAsSeenEvent extends ContactUsEvent {
  final int contactUsId;

  MarkContactUsAsSeenEvent({required this.contactUsId});
}

class MarkContactUsAsApprovedEvent extends ContactUsEvent {
  final int contactUsId;

  MarkContactUsAsApprovedEvent({required this.contactUsId});
}
