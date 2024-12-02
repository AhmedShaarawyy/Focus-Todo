class Task {
  String name;
  bool isCompleted;

  Task({required this.name, this.isCompleted = false});

  void toggleDone() {
    isCompleted = !isCompleted;
  }
// Serialization & Deserialization (shared pref)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isCompleted': isCompleted,
    };
  }


  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      name: json['name'],
      isCompleted: json['isCompleted'],
    );
  }
}
