class ContactUsModel {
  final int id;
  final String subject;
  final String description;
  final String phone;
  final Client client;
  final dynamic techApproved;
  final dynamic seen;

  ContactUsModel({
    required this.id,
    required this.subject,
    required this.description,
    required this.phone,
    required this.client,
    required this.techApproved,
    required this.seen,
  });

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
        id: json["id"],
        subject: json["subject"],
        description: json["description"],
        phone: json["phone"],
        client: Client.fromJson(json["client"]),
        techApproved: json["tech_approved"],
        seen: json["seen"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject": subject,
        "description": description,
        "phone": phone,
        "client": client.toJson(),
        "tech_approved": techApproved,
        "seen": seen,
      };
}

class Client {
  final int id;
  final String name;
  final String email;
  final String image;
  final String role;
  final dynamic cv;

  Client({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.role,
    required this.cv,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
        role: json["role"],
        cv: json["cv"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
        "role": role,
        "cv": cv,
      };
}
