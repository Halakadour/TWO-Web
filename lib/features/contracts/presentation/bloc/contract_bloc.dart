import 'package:bloc/bloc.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/features/contracts/data/models/contract/contract_model.dart';
import 'package:two_website/features/contracts/data/models/draft/draft_model.dart';
import 'package:two_website/features/contracts/domain/usecases/contract-usecase/add_contract_usecase.dart';
import 'package:two_website/features/contracts/domain/usecases/contract-usecase/add_sign_usecase.dart';
import 'package:two_website/features/contracts/domain/usecases/contract-usecase/get_client_contract_usecase.dart';
import 'package:two_website/features/contracts/domain/usecases/contract-usecase/get_contracts_usecase.dart';
import 'package:two_website/features/contracts/domain/usecases/draft-usecase/create_draft_usecase.dart';
import 'package:two_website/features/contracts/domain/usecases/draft-usecase/delete_draft_usecase.dart';
import 'package:two_website/features/contracts/domain/usecases/draft-usecase/get_draft_usecase.dart';

part 'contract_event.dart';
part 'contract_state.dart';

class ContractBloc extends Bloc<ContractEvent, ContractState> {
  final AddContractUsecase addContractUsecase;
  final AddSignUsecase addSignUsecase;
  final GetClientContractUsecase getClientContractUsecase;
  final GetContractsUsecase getContractsUsecase;
  final CreateDraftUsecase createDraftUsecase;
  final DeleteDraftUsecase deleteDraftUsecase;
  final GetDraftUsecase getDraftUsecase;
  ContractBloc(
      this.addContractUsecase,
      this.addSignUsecase,
      this.getClientContractUsecase,
      this.getContractsUsecase,
      this.createDraftUsecase,
      this.deleteDraftUsecase,
      this.getDraftUsecase)
      : super(ContractState()) {
    // Contract Bloc //
    on<GetContractEvent>((event, emit) async {
      emit(state.copyWith(contrcatListStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token == null) {
        final result = await getContractsUsecase
            .call(GetDraftOrContractParam(token: token!, filter: event.filter));
        result.fold(
          (l) => emit(state.copyWith(
              contrcatListStatus: CasualStatus.failure, message: l.message)),
          (r) => emit(state.copyWith(
              contrcatListStatus: CasualStatus.success, contractList: r)),
        );
      } else {
        emit(state.copyWith(contrcatListStatus: CasualStatus.noToken));
      }
    });
    on<GetClientContractEvent>((event, emit) async {
      emit(state.copyWith(clientContrcatListStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token == null) {
        final result = await getClientContractUsecase.call(
            GetClientContractParam(
                token: token!, filter: event.filter, clientId: event.clientId));
        result.fold(
          (l) => emit(state.copyWith(
              clientContrcatListStatus: CasualStatus.failure,
              message: l.message)),
          (r) => emit(state.copyWith(
              clientContrcatListStatus: CasualStatus.success,
              clientContractList: r)),
        );
      } else {
        emit(state.copyWith(clientContrcatListStatus: CasualStatus.noToken));
      }
    });
    on<AddContractEvent>((event, emit) async {
      emit(state.copyWith(addContractStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token == null) {
        final result = await addContractUsecase.call(AddContractParam(
            token: token!,
            contract: event.contract,
            clientId: event.clientId,
            drafId: event.drafId));
        result.fold(
          (l) => emit(state.copyWith(
              addContractStatus: CasualStatus.failure, message: l.message)),
          (r) => emit(state.copyWith(
            addContractStatus: CasualStatus.success,
          )),
        );
      } else {
        emit(state.copyWith(addContractStatus: CasualStatus.noToken));
      }
    });
    // Draft Bloc
    on<GetDrafEvent>((event, emit) async {
      emit(state.copyWith(drafListStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token == null) {
        final result = await getDraftUsecase
            .call(GetDraftOrContractParam(token: token!, filter: event.filter));
        result.fold(
          (l) => emit(state.copyWith(
              drafListStatus: CasualStatus.failure, message: l.message)),
          (r) => emit(state.copyWith(
              drafListStatus: CasualStatus.success, drafList: r)),
        );
      } else {
        emit(state.copyWith(drafListStatus: CasualStatus.noToken));
      }
    });
    on<CreateDrafEvent>((event, emit) async {
      emit(state.copyWith(createDrafStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token == null) {
        final result = await createDraftUsecase.call(CreateDrafParam(
            token: token!, draf: event.draf, clientId: event.clientId));
        result.fold(
          (l) => emit(state.copyWith(
              createDrafStatus: CasualStatus.failure, message: l.message)),
          (r) => emit(state.copyWith(createDrafStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(createDrafStatus: CasualStatus.noToken));
      }
    });
    on<DeleteDrafEvent>((event, emit) async {
      emit(state.copyWith(deleteDrafStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token == null) {
        final result = await deleteDraftUsecase
            .call(DeleteDrafParam(token: token!, draftId: event.drafId));
        result.fold(
          (l) => emit(state.copyWith(
              deleteDrafStatus: CasualStatus.failure, message: l.message)),
          (r) => emit(state.copyWith(deleteDrafStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(deleteDrafStatus: CasualStatus.noToken));
      }
    });
  }
}
