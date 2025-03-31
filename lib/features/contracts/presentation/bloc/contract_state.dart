// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'contract_bloc.dart';

class ContractState {
  final String message;
  final List<ContractModel> contractList;
  final List<ContractModel> clientContractList;
  final CasualStatus contrcatListStatus;
  final CasualStatus clientContrcatListStatus;
  final CasualStatus addContractStatus;
  final CasualStatus addSignStatus;
  final CasualStatus createDrafStatus;
  final CasualStatus deleteDrafStatus;
  final List<DraftModel> drafList;
  final CasualStatus drafListStatus;
  ContractState({
    this.message = "",
    this.contractList = const [],
    this.clientContractList = const [],
    this.contrcatListStatus = CasualStatus.initial,
    this.clientContrcatListStatus = CasualStatus.initial,
    this.addContractStatus = CasualStatus.initial,
    this.addSignStatus = CasualStatus.initial,
    this.createDrafStatus = CasualStatus.initial,
    this.deleteDrafStatus = CasualStatus.initial,
    this.drafList = const [],
    this.drafListStatus = CasualStatus.initial,
  });

  ContractState copyWith({
    String? message,
    List<ContractModel>? contractList,
    List<ContractModel>? clientContractList,
    CasualStatus? contrcatListStatus,
    CasualStatus? clientContrcatListStatus,
    CasualStatus? addContractStatus,
    CasualStatus? addSignStatus,
    CasualStatus? createDrafStatus,
    CasualStatus? deleteDrafStatus,
    List<DraftModel>? drafList,
    CasualStatus? drafListStatus,
  }) {
    return ContractState(
      message: message ?? this.message,
      contractList: contractList ?? this.contractList,
      clientContractList: clientContractList ?? this.clientContractList,
      contrcatListStatus: contrcatListStatus ?? this.contrcatListStatus,
      clientContrcatListStatus:
          clientContrcatListStatus ?? this.clientContrcatListStatus,
      addContractStatus: addContractStatus ?? this.addContractStatus,
      addSignStatus: addSignStatus ?? this.addSignStatus,
      createDrafStatus: createDrafStatus ?? this.createDrafStatus,
      deleteDrafStatus: deleteDrafStatus ?? this.deleteDrafStatus,
      drafList: drafList ?? this.drafList,
      drafListStatus: drafListStatus ?? this.drafListStatus,
    );
  }
}
