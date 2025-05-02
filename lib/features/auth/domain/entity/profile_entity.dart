class ProfileEntity {
  final int pId;
  final String pName;
  final String pEmail;
  final String? pImage;
  final String pRole;
  final String? pCv;

  ProfileEntity(
      {required this.pId,
      required this.pName,
      required this.pEmail,
      required this.pImage,
      required this.pRole,
      required this.pCv});
}
