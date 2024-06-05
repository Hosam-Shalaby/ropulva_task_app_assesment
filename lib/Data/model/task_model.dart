// ignore_for_file: constant_identifier_names

class TaskModel {
  final String id;
  final String title;
  final DateTime dueDate;
  final bool status;

  TaskModel({
    required this.id,
    required this.title,
    required this.dueDate,
    required this.status,
  });

  Map<String, dynamic> toFireBase() {
    return {
      'title': title,
      'dueDate': dueDate.toIso8601String(),
      'status': status,
    };
  }

  factory TaskModel.fromFireBase(Map<String, dynamic> map, String id) {
    return TaskModel(
      id: id,
      title: map['title'] ?? '',
      dueDate: DateTime.parse(map['dueDate']),
      status: map['status'] ?? false,
    );
  }
}

  // String getDate() {
  //   DateTime datetime = DateTime.fromMillisecondsSinceEpoch(date);
  //   String formattedDate = DateFormat('yyyy-MM-dd').format(datetime);
  //   return formattedDate;
  // }
