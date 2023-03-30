import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/color/color_theme.dart';
import 'package:task/controller/task_db.dart';
import 'package:task/model/task_data.dart';
import 'package:task/widget/text_font.dart';

import '../bloc/taskBloc/task_bloc_bloc.dart';

class CardTask extends StatelessWidget {
  const CardTask(
      {super.key, required this.size, required this.color, required this.task});

  final Size size;
  final ColorPrimary color;
  final Task task;

  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBlocBloc>(context);
    print(task.idTask);
    return Padding(
      padding: EdgeInsets.only(
          top: size.width * 0.04,
          left: size.width * 0.04,
          right: size.width * 0.04),
      child: Dismissible(
        key: ValueKey(task.idTask),
        direction: DismissDirection.endToStart,
        background: Container(),
        secondaryBackground: Container(
          alignment: Alignment.centerRight,
          color: color.secundary40,
          child: const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.delete_forever,
              size: 50,
              color: Colors.white,
            ),
          ),
        ),
        child: InkWell(
          child: Card(
            elevation: 5,
            child: Container(
              height: size.height * 0.21,
              width: size.width,
              color: color.primary90,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: ListTile(
                        leading: const CircleAvatar(
                          maxRadius: 25,
                          backgroundImage: AssetImage("assets/images/user.jpg"),
                        ),
                        title: TextFont(
                          text: task.title,
                          color: color.primary20,
                          font: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: TextFont(
                            text: task.description,
                            color: color.primary20,
                            font: 15),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ListTile(
                        leading: TextFont(
                          text: task.status,
                          color: color.primary20,
                          font: 15,
                          fontWeight: FontWeight.w700,
                        ),
                        trailing: TextFont(
                          text: "",
                          // "${task.dateInitial.substring(0, 2)}/${task.dateInitial.substring(3, 6)}/${task.dateInitial.substring(7, 11)}",
                          color: color.primary20,
                          font: 15,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ],
              ),
            ),
          ),
          onTap: () async {
            taskBloc.add(AddTask(
                task.idTask,
                task.title,
                task.description,
                task.status,
                task.dateInitial,
                task.dateFinal,
                task.image,
                task.idUser,
                true));
            Navigator.pushNamed(context, "NewTask");
          },
        ),
        confirmDismiss: (direction) async {
          bool delete = false;
          if (direction == DismissDirection.endToStart) {
            await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("¿Seguro que quieres el?"),
                    actionsAlignment: MainAxisAlignment.spaceEvenly,
                    actions: [
                      MaterialButton(
                        onPressed: () async {
                          await DB.delete(task);
                          delete = true;
                          Navigator.pop(context);
                        },
                        child: Text("Si"),
                      ),
                      MaterialButton(
                        onPressed: () {
                          delete = false;
                          Navigator.pop(context);
                        },
                        child: Text("No"),
                      )
                    ],
                  );
                });
            if (delete == false) {
              return false;
            } else {
              return true;
            }
          }
          // return false;
        },
      ),
    );
  }
}