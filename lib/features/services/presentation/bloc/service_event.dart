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
  DeleteServiceParam deleteServiceParam;
  DeleteServiceEvent({
    required this.deleteServiceParam,
  });
}

class UpdateServiceEvent extends ServiceEvent {
  UpdateServiceParam updateServiceParam;
  UpdateServiceEvent({
    required this.updateServiceParam,
  });
}
