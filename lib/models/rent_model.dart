class Rent {
  int? id;
  String title;
  DateTime startDate;
  DateTime dueDate;
  DateTime reminderDate;
  String state;

  Rent(
      {this.id,
      required this.title,
      required this.startDate,
      required this.dueDate,
      required this.reminderDate,
      required this.state});

  Map<String, dynamic> toMap() {
    return {
      'id_rent': id,
      'title': title,
      'start_date': startDate.millisecondsSinceEpoch,
      'due_date': dueDate.millisecondsSinceEpoch,
      'reminder_date': reminderDate.millisecondsSinceEpoch,
      'state': state,
    };
  }

  factory Rent.fromMap(Map<String, dynamic> map) {
    return Rent(
      id: map['id_rent'],
      title: map['title'],
      startDate: DateTime.fromMillisecondsSinceEpoch(map['start_date']),
      dueDate: DateTime.fromMillisecondsSinceEpoch(map['due_date']),
      reminderDate: DateTime.fromMillisecondsSinceEpoch(map['reminder_date']),
      state: map['state'],
    );
  }
}
