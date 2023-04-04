import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/color/color_theme.dart';
import 'package:task/controller/task_db.dart';
import 'package:task/model/task_data.dart';
import 'package:task/widget/button_task.dart';
import 'package:task/widget/global_text.dart';
import 'package:task/widget/text_font.dart';

import '../bloc/taskBloc/task_bloc_bloc.dart';
import '../screen/home_screen.dart';

class CardTask extends StatelessWidget {
  const CardTask(
      {super.key,
      required this.size,
      required this.color,
      required this.task,
      required this.status});

  final Size size;
  final ColorPrimary color;
  final Task task;
  final bool status;

  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBlocBloc>(context);
    final globalText = AlertText();
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
                        leading: CircleAvatar(
                          maxRadius: 25,
                          backgroundImage: MemoryImage(task.image),
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
                          // text: "${task.dateInitial}",
                          text:
                              "${task.dateInitial.substring(0, 2)}/${getMonth(int.parse(task.dateInitial.substring(3, 5)))}/${task.dateInitial.substring(6, 10)}",
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
            clearBloc(taskBloc);
            taskBloc.add(AddTask(
                task.idTask,
                task.title,
                task.description,
                task.status,
                task.dateInitial,
                task.dateFinal,
                task.image,
                task.idUser,
                true,
                true));
            !status
                ? Navigator.popAndPushNamed(context, "NewTask")
                : Navigator.popAndPushNamed(context, "CompleteTask");
          },
        ),
        confirmDismiss: (direction) async {
          bool delete = false;
          if (direction == DismissDirection.endToStart) {
            await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: color.primary90,
                    title: Text(
                      globalText.title,
                      style: TextStyle(
                        color: color.primary20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    actionsAlignment: MainAxisAlignment.start,
                    actions: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              globalText.description,
                              style: TextStyle(
                                  fontSize: 16, color: color.primary40),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ButtonTask(
                                  height: 0.05,
                                  width: 0.3,
                                  text: globalText.no,
                                  colorBorder: color.secundary40,
                                  color: Colors.white,
                                  onPressed: () {
                                    delete = false;
                                    Navigator.pop(context);
                                  }),
                              ButtonTask(
                                  height: 0.05,
                                  width: 0.3,
                                  text: globalText.yes,
                                  color: color.primary40,
                                  onPressed: () async {
                                    await DB.delete(task);
                                    delete = true;
                                    Navigator.pop(context);
                                    Navigator.popAndPushNamed(
                                        context, "HomeScreen");
                                  }),
                            ],
                          )
                        ],
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
          return false;
        },
      ),
    );
  }
}

void clearBloc(taskBloc) {
  taskBloc.add(AddTask(null, "", "", "", "", "", null, null, false, false));
}
