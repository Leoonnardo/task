import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/taskBloc/task_bloc_bloc.dart';
import 'package:task/color/color_theme.dart';
import 'package:task/data/task_data.dart';
import 'package:task/widget/widgets.dart';

import '../controller/task_db.dart';
import '../model/task_data.dart';

String title = "";
String description = "";
String day = "";
String mounth = "";
String year = "";
String dateInitial = "";
String dateFinal = "";
String image = "";
String idUser = "";
bool edit = false;

final titleController = TextEditingController();
final descriptionController = TextEditingController();
final dayController = TextEditingController();
final mounthController = TextEditingController();
final yearCotroller = TextEditingController();

class NewTask extends StatelessWidget {
  const NewTask({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = ColorPrimary();
    final globalText = NewTaskText();
    final TaskData task;
    final taskBloc = BlocProvider.of<TaskBlocBloc>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.07,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<TaskBlocBloc, TaskBlocState>(
          builder: (context, state) {
            if (state.edit && !edit) {
              edit = state.edit;
              print("Entro al false");
              titleController.text = state.title;
              descriptionController.text = state.description;
              dayController.text = state.dateInitial.substring(0, 2);
              mounthController.text = state.dateInitial.substring(3, 6);
              yearCotroller.text = state.dateInitial.substring(7, 11);
              edit = true;
            }
            return SizedBox(
              height: size.height * 0.90,
              width: size.width,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: size.height * 0.15,
                            width: size.height * 0.15,
                            decoration: BoxDecoration(
                                border: Border.all(color: color.primary20),
                                color: color.primary90,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.image_outlined,
                              size: size.height * 0.1,
                              color: color.primary20,
                            ),
                          ),
                          TextFont(
                              text: globalText.imageText,
                              color: color.primary40,
                              font: 12)
                        ],
                      )),
                  Expanded(
                      flex: 6,
                      child: Container(
                        // color: Colors.red,
                        child: Form(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InputGlobalTask(
                              controller: titleController,
                              color: color,
                              title: globalText.nameTitle,
                              titleEnter: globalText.nameTitleInput,
                              onChanged: (p0) {
                                title = p0;
                              },
                            ),
                            InputGlobalTask(
                              controller: descriptionController,
                              color: color,
                              title: globalText.nameDescription,
                              titleEnter: globalText.nameDescriptionInput,
                              maxLine: 10,
                              onChanged: (p0) {
                                description = p0;
                              },
                            ),
                            SizedBox(
                              width: size.width * 0.9,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InputGlobalTask(
                                    controller: dayController,
                                    widht: size.width * 0.26,
                                    color: color,
                                    title: globalText.dateTitle,
                                    titleEnter: globalText.dayText,
                                    textInput: TextInputType.number,
                                    onChanged: (p0) {
                                      day = p0;
                                    },
                                  ),
                                  InputGlobalTask(
                                    controller: mounthController,
                                    widht: size.width * 0.26,
                                    color: color,
                                    titleEnter: globalText.mounthText,
                                    onChanged: (p0) {
                                      mounth = p0;
                                    },
                                  ),
                                  InputGlobalTask(
                                    controller: yearCotroller,
                                    widht: size.width * 0.26,
                                    color: color,
                                    titleEnter: globalText.yearText,
                                    textInput: TextInputType.number,
                                    onChanged: (p0) {
                                      year = p0;
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                      )),
                  ButtonTask(
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    text: globalText.buttonText,
                    color: color.primary40,
                    onPressed: () async {
                      await DB.insert(Task(
                          idTask: null,
                          title: title,
                          description: description,
                          status: "Pendiente",
                          dateInitial: "$day/$mounth/$year",
                          dateFinal: "null",
                          image: "image.png",
                          idUser: 1));
                      clear();
                      Navigator.popAndPushNamed(context, "HomeScreen");
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

void clear() {
  title = "";
  description = "";
  day = "";
  mounth = "";
  year = "";
  dateInitial = "";
  dateFinal = "";
  image = "";
  idUser = "";
}
