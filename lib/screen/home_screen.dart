import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/color/color_theme.dart';
import 'package:task/controller/task_db.dart';
import 'package:task/model/task_data.dart';
import 'package:task/widget/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> task = [];

  @override
  void initState() {
    // TODO: implement initState
    cargaAnimales();
    super.initState();
  }

  cargaAnimales() async {
    List<Task> taskTemp = await DB.tasks();

    setState(() {
      task = taskTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = ColorPrimary();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height * 0.80,
          child: ListView.builder(
            itemCount: task.length,
            itemBuilder: (context, index) {
              // print(task[index].idTask);
              return CardTask(
                size: size,
                color: color,
                task: task[index],
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButtonHome(size: size, color: color),
      bottomNavigationBar: BottomNavigationHome(color: color, size: size),
    );
  }
}

class BottomNavigationHome extends StatelessWidget {
  const BottomNavigationHome({
    super.key,
    required this.color,
    required this.size,
  });

  final ColorPrimary color;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: color.primary90,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book_outlined,
                size: size.width * 0.1,
                color: color.primary20,
              ),
              label: ""),
          // BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.check,
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
            onPressed: () {
              Navigator.pushNamed(context, "NewTask");
            }),
      ),
    );
  }
}
