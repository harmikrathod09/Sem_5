class TodoModel {
  final String? id;
  final String title;
  final String description;
  final bool status;

  TodoModel({
    this.id,
    required this.title,
    required this.description,
    this.status = false,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
    };
  }
}
