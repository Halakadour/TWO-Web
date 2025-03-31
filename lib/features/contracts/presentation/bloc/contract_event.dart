// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'contract_bloc.dart';

class ContractEvent {}

// Contracts Events
class GetContractEvent extends ContractEvent {
  final int filter;

  GetContractEvent({this.filter = 0});
}

class GetClientContractEvent extends ContractEvent {
  int filter;
  String clientId;
  GetClientContractEvent({
    required this.filter,
    required this.clientId,
  });
}

class AddContractEvent extends ContractEvent {
  String contract;
  int clientId;
  int drafId;
  AddContractEvent({
    required this.contract,
    required this.clientId,
    required this.drafId,
  });
}

class AddSignEvent extends ContractEvent {
  String signature;
  int contractId;
  AddSignEvent({
    required this.signature,
    required this.contractId,
  });
}

// Drafs Events
class GetDrafEvent extends ContractEvent {
  int filter;
  GetDrafEvent({
    required this.filter,
  });
}

class CreateDrafEvent extends ContractEvent {
  String draf;
  int clientId;
  CreateDrafEvent({
    required this.draf,
    required this.clientId,
  });
}

class DeleteDrafEvent extends ContractEvent {
  int drafId;
  DeleteDrafEvent({
    required this.drafId,
  });
}
