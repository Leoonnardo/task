part of 'task_bloc_bloc.dart';

class TaskBlocState {
  final idTask;
  final String title;
  final String description;
  final String status;
  final String day;
  final String mounth;
  final String year;
  final String dateInitial;
  final String dateFinal;
  final Uint8List? image;
  final idUser;
  final bool edit;
  final bool editButton;

  TaskBlocState(
      {this.idTask,
      this.title = "",
      this.description = "",
      this.status = "Pendiente",
      this.day = "",
      this.mounth = "",
      this.year = "",
      this.dateInitial = "",
      this.dateFinal = "",
      this.image,
      this.idUser,
      this.edit = false,
      this.editButton = false});
}
