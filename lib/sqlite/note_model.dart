class NoteModel {
  int? noteId;
  String noteTitle;
  String noteContent;
  String createAt;

  NoteModel(
      {this.noteId,
      required this.noteTitle,
      required this.noteContent,
      required this.createAt});

  factory NoteModel.fromMap(Map<String, dynamic> json) => NoteModel(
      noteId: json['noteId'],
      noteTitle: json['noteTitle'],
      noteContent: json['noteContent'],
      createAt: json['createAt']);

  Map<String, dynamic> toMap() => {
        'noteId': noteId,
        'noteTitle': noteTitle,
        'noteContent': noteContent,
        'createAt': createAt
      };
}
