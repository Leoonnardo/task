import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task/bloc/taskBloc/task_bloc_bloc.dart';
import 'package:task/color/color_theme.dart';
import 'package:task/data/task_data.dart';
import 'package:task/widget/widgets.dart';

import '../controller/task_db.dart';
import '../model/task_data.dart';
import '../widget/app_bar_canvas_general.dart';
import '../widget/button_task _update.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
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
  File? imageFile;
  Uint8List? imageFile2;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = ColorPrimary();
    final globalText = NewTaskText();
    final TaskData task;
    final taskBloc = BlocProvider.of<TaskBlocBloc>(context);

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

    Future getImage() async {
      final images = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (images == null) {
        print("es null");
        return;
      }
      final imageTemp = File(images.path);
      setState(() {
        imageFile = imageTemp;
      });
    }

    List<int> numerDays = List.generate(31, (index) => index + 1);
    List<int> numerMonth = List.generate(12, (index) => index + 1);

    return Scaffold(
      // extendBody: true,
      // extendBodyBehindAppBar: true,
      appBar: appBarGeneral(size, color, context),
      body: SingleChildScrollView(
        child: BlocBuilder<TaskBlocBloc, TaskBlocState>(
          builder: (context, state) {
            print(state.edit);
            print(state.editButton);
            if (state.edit) {
              print("Esta editando");
              title = titleController.text = state.title;
              description = descriptionController.text = state.description;
              day = dayController.text = state.dateInitial.substring(0, 2);
              mounth =
                  mounthController.text = state.dateInitial.substring(3, 5);
              year = yearCotroller.text = state.dateInitial.substring(6, 10);
              imageFile2 = state.image;
              taskBloc.add(EditStatus(state.idTask, false, true, state.status,
                  state.dateFinal, state.idUser));
            }
            print(imageFile);
            return SizedBox(
              height: size.height * 0.855,
              width: size.width,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        // color: Colors.amber,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: getImage,
                              child: Container(
                                height: size.height * 0.15,
                                width: size.height * 0.15,
                                decoration: BoxDecoration(
                                  border: Border.all(color: color.primary20),
                                  color: color.primary90,
                                  shape: BoxShape.circle,
                                ),
                                child: state.editButton && imageFile == null
                                    ? CircleAvatar(
                                        backgroundImage:
                                            MemoryImage(imageFile2!),
                                      )
                                    : imageFile != null
                                        ? CircleAvatar(
                                            backgroundImage:
                                                FileImage(imageFile!),
                                          )
                                        : Icon(
                                            Icons.image_outlined,
                                            size: size.height * 0.1,
                                            color: color.primary20,
                                          ),
                              ),
                            ),
                            TextFont(
                                text: globalText.imageText,
                                color: color.primary40,
                                font: 12)
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 7,
                      child: Container(
                        // color: Colors.red,
                        child: Form(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InputGlobalTask(
                              controller: state.edit ? titleController : null,
                              color: color,
                              title: globalText.nameTitle,
                              titleEnter: globalText.nameTitleInput,
                              onChanged: (p0) {
                                title = p0;
                              },
                            ),
                            InputGlobalTask(
                              controller:
                                  state.edit ? descriptionController : null,
                              color: color,
                              title: globalText.nameDescription,
                              titleEnter: globalText.nameDescriptionInput,
                              maxLine: 8,
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
                                    height: size.height * 0.07,
                                    color: color,
                                    title: globalText.dateTitle,
                                    titleEnter: globalText.dayText,
                                    textInput: TextInputType.number,
                                    onChanged: (p0) {
                                      if (p0.isNotEmpty) {
                                        if (numerDays.contains(int.parse(p0))) {
                                          day = p0;
                                        } else {
                                          dayController.text = "";
                                        }
                                      } else {
                                        day = p0;
                                      }
                                    },
                                  ),
                                  InputGlobalTask(
                                    controller: mounthController,
                                    widht: size.width * 0.26,
                                    height: size.height * 0.07,
                                    color: color,
                                    textInput: TextInputType.number,
                                    titleEnter: globalText.mounthText,
                                    onChanged: (p0) {
                                      if (p0.isNotEmpty) {
                                        if (numerMonth
                                            .contains(int.parse(p0))) {
                                          mounth = p0;
                                        } else {
                                          mounthController.text = "";
                                        }
                                      } else {
                                        day = p0;
                                      }
                                    },
                                  ),
                                  InputGlobalTask(
                                    controller: yearCotroller,
                                    widht: size.width * 0.26,
                                    height: size.height * 0.07,
                                    color: color,
                                    titleEnter: globalText.yearText,
                                    textInput: TextInputType.number,
                                    onChanged: (p0) {
                                      if (p0.length > 4) {
                                        yearCotroller.text = "";
                                        year = "";
                                      } else {
                                        year = p0;
                                      }
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                      )),
                  Expanded(
                    flex: 3,
                    child: Container(
                      // color: Colors.orange,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          state.editButton
                              ? Container(
                                  alignment: Alignment.bottomCenter,
                                  child: ButtonTaskUpdate(
                                    icon: Icon(
                                      Icons.edit_outlined,
                                      color: color.secundary40,
                                    ),
                                    text: globalText.buttonTextUpdate,
                                    color: color.secundary40,
                                    onPressed: () async {
                                      await DB.update(Task(
                                          idTask: state.idTask,
                                          title: title,
                                          description: description,
                                          status: state.status,
                                          dateInitial:
                                              "${days(int.parse(day))}/${months(int.parse(mounth))}/$year",
                                          dateFinal: state.dateFinal,
                                          image: imageFile == null
                                              ? imageFile2!
                                              : imageFile!.readAsBytesSync(),
                                          idUser: 1));
                                      clearBloc(taskBloc);

                                      clear();
                                      Navigator.popAndPushNamed(
                                          context, "HomeScreen");
                                    },
                                  ),
                                )
                              : Container(),
                          Container(
                            alignment: Alignment.bottomCenter,
                            // color: Colors.orange,
                            child: ButtonTask(
                              icon: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              text: state.editButton
                                  ? globalText.buttonTextEdit
                                  : globalText.buttonText,
                              color: color.primary40,
                              onPressed: !state.editButton
                                  ? () async {
                                      if (title != "" &&
                                          description != "" &&
                                          day != "" &&
                                          mounth != "" &&
                                          year != "" &&
                                          imageFile != null) {
                                        await DB.insert(Task(
                                            idTask: null,
                                            title: title,
                                            description: description,
                                            status: "Pendiente",
                                            dateInitial:
                                                "${days(int.parse(day))}/${months(int.parse(mounth))}/$year",
                                            dateFinal: "null",
                                            image: imageFile!.readAsBytesSync(),
                                            idUser: 1));
                                        clear();
                                        Navigator.popAndPushNamed(
                                            context, "HomeScreen");
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor: Colors.red,
                                                content: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                      Icons.error_outline,
                                                      color: Colors.white,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    imageFile == null
                                                        ? const Text(
                                                            "Selecciona una imagen")
                                                        : const Text(
                                                            "Ingrese los datos")
                                                  ],
                                                )));
                                      }
                                    }
                                  : () async {
                                      await DB.update(Task(
                                          idTask: state.idTask,
                                          title: title,
                                          description: description,
                                          status: "Terminado",
                                          dateInitial: "$day/$mounth/$year",
                                          dateFinal:
                                              "${days(DateTime.now().day)}/${months(DateTime.now().month)}/${DateTime.now().year}",
                                          image: imageFile2!,
                                          idUser: 1));
                                      clear();
                                      Navigator.popAndPushNamed(
                                          context, "HomeScreen");
                                    },
                            ),
                          ),
                        ],
                      ),
                    ),
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

String days(int day) {
  if (day < 10) {
    return "0$day";
  } else {
    return "$day";
  }
}

String months(int month) {
  if (month < 10) {
    return "0$month";
  } else {
    return "$month";
  }
}

int obtenerMesInt(String numeroDeMes) {
  List<String> mesesDelAnio = [
    "Ene",
    "Feb",
    "Mar",
    "Abr",
    "May",
    "Jun",
    "Jul",
    "Ago",
    "Sep",
    "Oct",
    "Nov",
    "Dic"
  ];
  int i = 1;
  int iTemp = 0;
  mesesDelAnio.forEach((element) {
    if (element == numeroDeMes) {
      iTemp = i;
    }
    i + 1;
  });
  return iTemp;
}
