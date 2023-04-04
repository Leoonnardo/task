import 'dart:io';
import 'dart:typed_data';

class Task {
  final idTask;
  String title;
  String description;
  String status;
  String dateInitial;
  String dateFinal;
  Uint8List image;
  int idUser;

  Task({
    required this.idTask,
    required this.title,
    required this.description,
    required this.status,
    required this.dateInitial,
    required this.dateFinal,
    required this.image,
    required this.idUser,
  });

  Map<String, dynamic> toMap() {
    return {
      "idTask": idTask,
      "title": title,
      "description": description,
      "status": status,
      "dateInitial": dateInitial,
      "dateFinal": dateFinal,
      "image": image,
      "idUser": idUser,
    };
  }
}
