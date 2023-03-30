class TaskData {
  final title;
  final description;
  final status;
  final day;
  final mounth;
  final year;
  final image;
  final idUser;

  TaskData(
      {
      this.title,
      this.description,
      this.status,
      this.day,
      this.mounth,
      this.year,
      this.image,
      this.idUser});
      

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "status": status,
      "day": day,
      "mounth": mounth,
      "year": year,
      "image": image,
      "idUser" : idUser
    };
  }
}
