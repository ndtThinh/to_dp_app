class NotificationModelPage {
  int typePage;
  int? id;

  NotificationModelPage({required this.typePage, this.id});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['typePage'] = typePage;
    data['id'] = id;
    return data;
  }
}
