import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task/screen/new_task_screen.dart';

part 'task_bloc_event.dart';
part 'task_bloc_state.dart';

class TaskBlocBloc extends Bloc<TaskBlocEvent, TaskBlocState> {
  TaskBlocBloc() : super(TaskBlocState()) {
    on<TaskBlocEvent>((event, emit) {
      // TODO: implement event handler
      if (event is AddTask) {
        emit.call(TaskBlocState(
            idTask: event.idTask,
            title: event.title,
            description: event.description,
            status: event.status,
            dateInitial: event.dateInitial,
            dateFinal: event.dateFinal,
            image: event.image,
            idUser: event.idUser,
            edit: event.edit,
            editButton: event.editButton));
      } else if (event is EditStatus) {
        emit.call(TaskBlocState(
            idTask: event.idTask,
            edit: event.edit,
            editButton: event.editButton,
            status: event.status,
            dateFinal: event.dateFinal,
            idUser: event.idUser));
      }
    });
  }
}
