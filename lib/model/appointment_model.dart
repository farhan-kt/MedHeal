class AppointmentModel {
  String? id;
  String? uId;
  String? docId;
  String? date;
  String? time;

  AppointmentModel({
    this.id,
    this.uId,
    this.docId,
    required this.date,
    required this.time,
  });

  factory AppointmentModel.fromJson(String id, Map<String, dynamic> json) {
    return AppointmentModel(
      id: id,
      uId: json['userId'],
      docId: json['docId'],
      date: json['date'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': uId,
      'docId': docId,
      'id': id,
      'date': date,
      'time': time,
    };
  }
}
