// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'aboutwhyus_bloc.dart';

class AboutwhyusEvent {}

// About Us Event
class ShowAboutUsEvent extends AboutwhyusEvent {}

class CreateAboutUsEvent extends AboutwhyusEvent {
  final String workTime;
  final String site;
  CreateAboutUsEvent({
    required this.workTime,
    required this.site,
  });
}
