import 'dart:convert';

import 'package:two_website/features/contracts/data/models/contract/contract_model.dart';

ShowContractResponseModel showContractResponseModelFromJson(String str) =>
    ShowContractResponseModel.fromJson(json.decode(str));

String showContractResponseModelToJson(ShowContractResponseModel data) =>
    json.encode(data.toJson());

class ShowContractResponseModel {
  final int status;
  final String msg;
  final List<ContractModel> data;

  ShowContractResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowContractResponseModel.fromJson(Map<String, dynamic> json) =>
      ShowContractResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: List<ContractModel>.from(
            json["data"].map((x) => ContractModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
