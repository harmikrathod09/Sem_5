class UserFirebaseModel {
  String id;
  String name;
  String email;

  UserFirebaseModel({
    required this.id,
    required this.name,
    required this.email,
  });

  // Convert Firestore document → Model
  factory UserFirebaseModel.fromMap(String id, Map<String, dynamic> data) {
    return UserFirebaseModel(
      id: id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
    );
  }

  // Convert Model → Map (for Firestore)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
