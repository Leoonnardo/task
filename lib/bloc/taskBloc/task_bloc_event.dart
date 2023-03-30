part of 'task_bloc_bloc.dart';

@immutable
abstract class TaskBlocEvent {}

class ResetTask extends TaskBlocEvent {}

class AddTask extends TaskBlocEvent {
  final int idTask;
  final String title;
  final String description;
  final String status;
  final String dateInitial;
  final String dateFinal;
  final String image;
  final int idUser;
  final bool edit;

  AddTask(this.idTask, this.title, this.description, this.status, this.dateInitial,
      this.dateFinal, this.image, this.idUser, this.edit);
}

// class AddIdTask extends TaskBlocEvent {
//   final String idTask;
//   AddIdTask(this.idTask);
// }

class AddTitle extends TaskBlocEvent {
  final String title;
  AddTitle(this.title);
}

class AddDescription extends TaskBlocEvent {
  final String description;
  AddDescription(this.description);
}

class AddStatus extends TaskBlocEvent {
  final String status;
  AddStatus(this.status);
}

class AddDay extends TaskBlocEvent {
  final String day;
  AddDay(this.day);
}

class AddMounth extends TaskBlocEvent {
  final String mounth;
  AddMounth(this.mounth);
}

class AddYear extends TaskBlocEvent {
  final String year;
  AddYear(this.year);
}

class AddDateInitial extends TaskBlocEvent {
  final String dateInitial;
  AddDateInitial(this.dateInitial);
}

class AddDateFinal extends TaskBlocEvent {
  final String dateFinal;
  AddDateFinal(this.dateFinal);
}

class AddImage extends TaskBlocEvent {
  final String dateImage;
  AddImage(this.dateImage);
}

class AddIdUser extends TaskBlocEvent {
  final String idUser;
  AddIdUser(this.idUser);
}
