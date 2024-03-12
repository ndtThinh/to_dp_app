class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({this.userId, this.id, this.title, this.body});

  // //dua json ve doi tuong
  // PostModel.fromJson(Map<String, dynamic> json) {
  //   userId = json['userId'];
  //   id = json['id'];
  //   title = json['title'];
  //   body = json['body'];
  // }

  // //dua doi tuong thanh json
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['userId'] = this.userId;
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['body'] = this.body;
  //   return data;
  // }
}
