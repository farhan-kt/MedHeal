class NotificationModel {
  String? id;
  String? recieverId;
  String? title;
  String? body;
  NotificationModel({this.id, this.recieverId, this.title, this.body});

  factory NotificationModel.fromJson(String id, Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      recieverId: json['recieverId'],
      title: json['title'],
      body: json['body'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'recieverId': recieverId,
      'title': title,
      'body': body,
    };
  }
}
