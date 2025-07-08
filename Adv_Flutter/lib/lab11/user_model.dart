class User {
    String? id;
    String? name;
    String? email;
    String? phone;

    User({this.id, this.name, this.email, this.phone});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            id: json['id'],
            name: json['user_name'],
            email: json['email'],
            phone: json['phone'],
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'id': id,
            'user_name': name,
            'email': email,
            'phone': phone,
        };
    }
}
