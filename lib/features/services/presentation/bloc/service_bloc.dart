import 'package:bloc/bloc.dart';
import 'package:two_website/config/strings/text_strings.dart';

import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/features/services/domain/entities/service_entity.dart';
import 'package:two_website/features/services/domain/usecases/create_service_usecase.dart';
import 'package:two_website/features/services/domain/usecases/delete_service_usecase.dart';
import 'package:two_website/features/services/domain/usecases/show_service_usecase.dart';
import 'package:two_website/features/services/domain/usecases/update_service_usecase.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final CreateServiceUsecase createServiceUsecase;
  final DeleteServiceUsecase deleteServiceUsecase;
  final ShowServiceUsecase showServiceUsecase;
  final UpdateServiceUsecase updateServiceUsecase;
  ServiceBloc(
    this.createServiceUsecase,
    this.deleteServiceUsecase,
    this.showServiceUsecase,
    this.updateServiceUsecase,
  ) : super(ServiceState()) {
    // Create Service
    on<CreateServiceEvent>((event, emit) async {
      emit(state.copyWith(createServiceStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result =
            await createServiceUsecase.call(event.createServiceParam);
        result.fold(
          (l) => emit(state.copyWith(
              createServiceStatus: CasualStatus.failure, message: l.message)),
          (r) =>
              emit(state.copyWith(createServiceStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(
            createServiceStatus: CasualStatus.failure,
            message: TextStrings.noToken));
      }
    });
    // Delete Service
    on<DeleteServiceEvent>((event, emit) async {
      emit(state.copyWith(deleteServiceStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result =
            await deleteServiceUsecase.call(event.deleteServiceParam);
        result.fold(
          (l) => emit(state.copyWith(
              deleteServiceStatus: CasualStatus.failure, message: l.message)),
          (r) =>
              emit(state.copyWith(deleteServiceStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(
            deleteServiceStatus: CasualStatus.failure,
            message: TextStrings.noToken));
      }
    });
    // Show Service
    on<ShowServicesEvent>((event, emit) async {
      emit(state.copyWith(serviceListStatus: CasualStatus.loading));
      final result = await showServiceUsecase.call();
      result.fold(
        (l) => emit(state.copyWith(
            serviceListStatus: CasualStatus.failure, message: l.message)),
        (r) => emit(state.copyWith(
            serviceListStatus: CasualStatus.success, serviceList: r)),
      );
    });
    // update Service
    on<UpdateServiceEvent>((event, emit) async {
      emit(state.copyWith(updateServiceStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result =
            await updateServiceUsecase.call(event.updateServiceParam);
        result.fold(
          (l) => emit(state.copyWith(
              updateServiceStatus: CasualStatus.failure, message: l.message)),
          (r) =>
              emit(state.copyWith(updateServiceStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(
            updateServiceStatus: CasualStatus.failure,
            message: TextStrings.noToken));
      }
    });
  }
}
