class CreateProjectParam {
  final String token;
  final String type;
  final String description;
  final List<String> requirements;
  final String? document;
  final String cooperationType;
  final String contactTime;

  CreateProjectParam(
      {required this.token,
      required this.type,
      required this.description,
      required this.requirements,
      required this.document,
      required this.cooperationType,
      required this.contactTime});
}
