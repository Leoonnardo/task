import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task/bloc/taskBloc/task_bloc_bloc.dart';
import 'package:task/color/color_theme.dart';
import 'package:task/data/task_data.dart';
import 'package:task/screen/home_screen.dart';
import 'package:task/widget/widgets.dart';

import '../controller/task_db.dart';
import '../model/task_data.dart';
import '../widget/app_bar_canvas_general.dart';
import '../widget/button_task _update.dart';

class TaskComplete extends StatefulWidget {
  const TaskComplete({super.key});

  @override
  State<TaskComplete> createState() => _TaskCompleteState();
}

class _TaskCompleteState extends State<TaskComplete> {
  File? imageFile;
  Uint8List? imageFile2;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = ColorPrimary();
    final globalText = NewTaskText();
    final TaskData task;
    final taskBloc = BlocProvider.of<TaskBlocBloc>(context);

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

    return Scaffold(
      // extendBody: true,
      // extendBodyBehindAppBar: true,
      appBar: appBarGeneral(size, color, context),
      body: SingleChildScrollView(
        child: BlocBuilder<TaskBlocBloc, TaskBlocState>(
          builder: (context, state) {
            print(state.dateFinal);
            return SizedBox(
              height: size.height * 0.855,
              width: size.width,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        // color: Colors.amber,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                height: size.height * 0.15,
                                width: size.height * 0.15,
                                decoration: BoxDecoration(
                                  border: Border.all(color: color.primary20),
                                  color: color.primary90,
                                  shape: BoxShape.circle,
                                ),
                                child: CircleAvatar(
                                  backgroundImage: MemoryImage(state.image!),
                                )),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 7,
                      child: Container(
                        // padding: EdgeInsets.only(top: size.height * 0.05),
                        // color: Colors.red,
                        child: SizedBox(
                          width: size.width * 0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ContainerComplete(
                                color: color,
                                size: size,
                                height: 0.06,
                                width: 0.9,
                                title: globalText.nameTitle,
                                body: state.title,
                              ),
                              ContainerComplete(
                                color: color,
                                size: size,
                                width: 0.9,
                                height: 0.2,
                                title: globalText.nameDescription,
                                body: state.description,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ContainerComplete(
                                    color: color,
                                    size: size,
                                    width: 0.28,
                                    height: 0.06,
                                    title: globalText.dateTitle,
                                    body: state.dateInitial.substring(0, 2),
                                  ),
                                  ContainerComplete(
                                    color: color,
                                    size: size,
                                    width: 0.28,
                                    height: 0.06,
                                    body: getMonth(int.parse(
                                        state.dateInitial.substring(3, 5))),
                                  ),
                                  ContainerComplete(
                                    color: color,
                                    size: size,
                                    width: 0.28,
                                    height: 0.06,
                                    body: state.dateInitial.substring(6, 10),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ContainerComplete(
                                    color: color,
                                    size: size,
                                    width: 0.28,
                                    height: 0.06,
                                    title: globalText.dateFinalTitle,
                                    body: state.dateFinal.substring(0, 2),
                                  ),
                                  ContainerComplete(
                                    color: color,
                                    size: size,
                                    width: 0.28,
                                    height: 0.06,
                                    body: getMonth(int.parse(
                                        state.dateFinal.substring(3, 5))),
                                  ),
                                  ContainerComplete(
                                    color: color,
                                    size: size,
                                    width: 0.28,
                                    height: 0.06,
                                    body: state.dateFinal.substring(6, 10),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                          // color: Colors.blue,
                          ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ContainerComplete extends StatelessWidget {
  const ContainerComplete({
    super.key,
    required this.color,
    required this.size,
    required this.height,
    required this.width,
    this.title,
    required this.body,
  });

  final ColorPrimary color;
  final Size size;
  final height;
  final width;
  final title;
  final body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Text(
              title != null ? title : "",
              style: TextStyle(color: color.primary60, fontSize: 16),
            )),
        Container(
          height: size.height * height,
          width: size.width * width,
          decoration: BoxDecoration(
              color: color.primary90,
              border: Border.all(color: color.primary60),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              body,
              style: TextStyle(color: color.primary20, fontSize: 16),
            ),
          ),
          // child: ,
        ),
      ],
    );
  }
}
