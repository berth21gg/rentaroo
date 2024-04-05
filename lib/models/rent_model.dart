class Rent {
  int id;
  DateTime startDate;
  DateTime dueDate;
  DateTime reminderDate;
  String state;

  Rent(
      {required this.id,
      required this.startDate,
      required this.dueDate,
      required this.reminderDate,
      required this.state});

  Map<String, dynamic> toMap() {
    return {
      'id_rent': id,
      'start_date': startDate.millisecondsSinceEpoch,
      'due_date': dueDate.millisecondsSinceEpoch,
      'reminder_date': reminderDate.millisecondsSinceEpoch,
      'state': state,
    };
  }

  factory Rent.fromMap(Map<String, dynamic> map) {
    return Rent(
      id: map['id_rent'],
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate']),
      dueDate: DateTime.fromMillisecondsSinceEpoch(map['dueDate']),
      reminderDate: DateTime.fromMillisecondsSinceEpoch(map['reminderDate']),
      state: map['state'],
    );
  }
}
