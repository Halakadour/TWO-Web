part of 'landing_bloc.dart';

class LandingEvent {}

class ShowAboutUsEvent extends LandingEvent {}

class ShowWhyUsEvent extends LandingEvent {}

class CreateContactUsEvent extends LandingEvent {
  String subject;
  String description;
  String phone;
  CreateContactUsEvent({
    required this.subject,
    required this.description,
    required this.phone,
  });
}

class GetActivePostsEvent extends LandingEvent {}

class ReplyToPostEvent extends LandingEvent {
  final String fullName;
  final String email;
  final String phone;
  final String cv;
  final int postId;
  ReplyToPostEvent({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.cv,
    required this.postId,
  });
}

class ShowServicesEvent extends LandingEvent {}

class CreateProjectEvent extends LandingEvent {
  final String type;
  final String description;
  final List<String> requirements;
  final String? document;
  final String cooperationType;
  final String contactTime;

  CreateProjectEvent(
      {required this.type,
      required this.description,
      required this.requirements,
      required this.document,
      required this.cooperationType,
      required this.contactTime});
}
