part of 'service_bloc.dart';

class ServiceEvent {}

class CreateServiceEvent extends ServiceEvent {
  CreateServiceParam createServiceParam;
  CreateServiceEvent({
    required this.createServiceParam,
  });
}

class ShowServicesEvent extends ServiceEvent {}

class DeleteServiceEvent extends ServiceEvent {
  final String serviceId;
  DeleteServiceEvent({
    required this.serviceId,
  });
}

class UpdateServiceEvent extends ServiceEvent {
  final String serviceId;
  final String title;
  final String description;
  final Uint8List image;

  UpdateServiceEvent(
      {required this.serviceId,
      required this.title,
      required this.description,
      required this.image});
}
