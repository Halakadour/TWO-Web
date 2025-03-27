class DraftModel {
  final int id;
  final String contract;
  final int? state;

  DraftModel({
    required this.id,
    required this.contract,
    required this.state,
  });

  factory DraftModel.fromJson(Map<String, dynamic> json) => DraftModel(
        id: json["id"],
        contract: json["contract"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "contract": contract,
        "state": state,
      };
}
