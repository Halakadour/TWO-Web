// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'service_bloc.dart';

class ServiceState {
  String message;
  CasualStatus createServiceStatus;
  CasualStatus deleteServiceStatus;
  CasualStatus updateServiceStatus;
  CasualStatus serviceListStatus;
  List<ServiceEntity> serviceList;
  ServiceState({
    this.message = "",
    this.createServiceStatus = CasualStatus.initial,
    this.deleteServiceStatus = CasualStatus.initial,
    this.updateServiceStatus = CasualStatus.initial,
    this.serviceListStatus = CasualStatus.initial,
    this.serviceList = const [],
  });

  ServiceState copyWith({
    String? message,
    CasualStatus? createServiceStatus,
    CasualStatus? deleteServiceStatus,
    CasualStatus? updateServiceStatus,
    CasualStatus? serviceListStatus,
    List<ServiceEntity>? serviceList,
  }) {
    return ServiceState(
      message: message ?? this.message,
      createServiceStatus: createServiceStatus ?? this.createServiceStatus,
      deleteServiceStatus: deleteServiceStatus ?? this.deleteServiceStatus,
      updateServiceStatus: updateServiceStatus ?? this.updateServiceStatus,
      serviceListStatus: serviceListStatus ?? this.serviceListStatus,
      serviceList: serviceList ?? this.serviceList,
    );
  }
}
