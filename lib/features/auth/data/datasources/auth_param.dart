// AUTH //
class RegisterParams {
  final String name;
  final String email;
  final String password;
  RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });
}

class LoginParams {
  final String email;
  final String password;
  LoginParams({
    required this.email,
    required this.password,
  });
}

// PROFILE //
class UpdateClientProfileParam {
  final String token;
  final String roleId;
  final String image;
  final String fullName;
  final String companyName;
  final String workEmail;
  final String phoneNumber;
  final String projectType;
  final String projectDescription;
  final String projectCost;
  final String projectDuration;
  final String projectRequirements;
  final String documents;
  final String cooperationType;
  final String contractTime;
  final String visibilit;

  UpdateClientProfileParam(
      {required this.token,
      required this.roleId,
      required this.image,
      required this.fullName,
      required this.companyName,
      required this.workEmail,
      required this.phoneNumber,
      required this.projectType,
      required this.projectDescription,
      required this.projectCost,
      required this.projectDuration,
      required this.projectRequirements,
      required this.documents,
      required this.cooperationType,
      required this.contractTime,
      required this.visibilit});
}

class UpdateFreeLanceAndGesutProfileParam {
  final String token;
  final String roleId;
  final String image;

  UpdateFreeLanceAndGesutProfileParam(
      {required this.token, required this.image, required this.roleId});
}
