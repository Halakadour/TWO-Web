class ContractModel {
  final int id;
  final String contract;
  final String clientId;
  final String? clientSign;

  ContractModel({
    required this.id,
    required this.contract,
    required this.clientId,
    required this.clientSign,
  });

  factory ContractModel.fromJson(Map<String, dynamic> json) => ContractModel(
        id: json["id"],
        contract: json["contract"],
        clientId: json["client_id"],
        clientSign: json["client_sign"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "contract": contract,
        "client_id": clientId,
        "client_sign": clientSign,
      };
}
