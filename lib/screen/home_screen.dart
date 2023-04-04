import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/color/color_theme.dart';
import 'package:task/controller/task_db.dart';
import 'package:task/model/task_data.dart';
import 'package:task/widget/app_bar_canvas_general.dart';
import 'package:task/widget/app_bar_canvas_login.dart';
import 'package:task/widget/widgets.dart';

import '../bloc/taskBloc/task_bloc_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> task = [];
  List<Task> taskIncom = [];
  List<Task> taskComp = [];
  bool statusP = true;
  bool statusT = false;

  @override
  void initState() {
    // TODO: implement initState
    cargaAnimalesPen();
    super.initState();
  }

  cargaAnimalesPen() async {
    // statusP = false;
    List<Task> taskTemp = await DB.tasks();
    setState(() {
      task = taskTemp;
      task.forEach((element) {
        if (element.status == "Pendiente") {
          taskIncom.add(element);
        } else {
          taskComp.add(element);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = ColorPrimary();

    return Scaffold(
      appBar: appBarGeneral(size, color, context),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                child: CardsOnChange(size, color),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButtonHome(size: size, color: color),
      bottomNavigationBar: BottomNavigationHome(
        color: color,
        size: size,
        status: statusP,
        onTap: (value) {
          setState(() {
            if (value == 1) {
              statusP = false;
            } else {
              statusP = true;
            }
          });
        },
      ),
    );
  }

  ListView CardsOnChange(Size size, ColorPrimary color) {
    if (statusP) {
      print("Es pendiente");
      return ListView.builder(
        itemCount: taskIncom.length,
        itemBuilder: (context, index) {
          // print(task[index].idTask);
          return CardTask(
            size: size,
            color: color,
            task: taskIncom[index],
            status: false,
          );
        },
      );
    } else {
      print("Es terminado");
      return ListView.builder(
        itemCount: taskComp.length,
        itemBuilder: (context, index) {
          // print(task[index].idTask);
          return CardTask(
            size: size,
            color: color,
            task: taskComp[index],
            status: true,
          );
        },
      );
    }
  }
}

class BottomNavigationHome extends StatelessWidget {
  const BottomNavigationHome(
      {super.key,
      required this.color,
      required this.size,
      required this.status,
      required this.onTap});

  final ColorPrimary color;
  final Size size;
  final bool status;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: color.primary90,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
              icon: status
                  ? Icon(
                      Icons.book,
                      size: size.width * 0.1,
                      color: color.primary20,
                    )
                  : Icon(
                      Icons.book_outlined,
                      size: size.width * 0.1,
                      color: color.primary20,
                    ),
              label: ""),
          // BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: ""),
          BottomNavigationBarItem(
              icon: status
                  ? Icon(
                      Icons.check,
                      size: size.width * 0.1,
                      color: color.primary20,
                    )
                  : Icon(
                      Icons.check_circle,
                      size: size.width * 0.1,
                      color: color.primary20,
                    ),
              label: ""),
        ]);
  }
}

class FloatingButtonHome extends StatelessWidget {
  const FloatingButtonHome({
    super.key,
    required this.size,
    required this.color,
  });

  final Size size;
  final ColorPrimary color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.04),
      child: SizedBox(
        height: size.height * 0.08,
        width: size.height * 0.08,
        child: FloatingActionButton(
            backgroundColor: color.secundary40,
            child: Icon(
              Icons.add,
              size: size.height * 0.06,
            ),
            onPressed: () async {
              final taskBloc = BlocProvider.of<TaskBlocBloc>(context);
              clearBloc(taskBloc);
              Navigator.pushReplacementNamed(context, "NewTask");
            }),
      ),
    );
  }
}

String getMonth(int numeroDeMes) {
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

  if (numeroDeMes >= 1 && numeroDeMes <= 12) {
    return mesesDelAnio[numeroDeMes - 1];
  } else {
    return "Mes inválido";
  }
}
