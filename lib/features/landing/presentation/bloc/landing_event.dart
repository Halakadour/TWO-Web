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

class GetUnActivePostsEvent extends LandingEvent {}

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
