import 'dart:convert';

import 'package:two_website/features/contracts/data/models/contract/contract_model.dart';

AddContractResponseModel addContractResponseModelFromJson(String str) =>
    AddContractResponseModel.fromJson(json.decode(str));

String addContractResponseModelToJson(AddContractResponseModel data) =>
    json.encode(data.toJson());

class AddContractResponseModel {
  final int status;
  final String msg;
  final ContractModel data;

  AddContractResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory AddContractResponseModel.fromJson(Map<String, dynamic> json) =>
      AddContractResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: ContractModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}
