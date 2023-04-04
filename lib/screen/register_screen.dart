import 'package:flutter/material.dart';
import 'package:task/color/color_theme.dart';
import '../widget/app_bar_canvas_login.dart';
import '../widget/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final globalText = RegisterText();
    final color = ColorPrimary();

    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        reverse: false,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                  flex: 4,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        painter:
                            PainterCanvas(canva: 3, color: color.secundary90),
                        size: Size.infinite,
                      ),
                      CustomPaint(
                        painter:
                            PainterCanvas(canva: 2, color: color.secundary60),
                        size: Size.infinite,
                      ),
                      CustomPaint(
                        painter:
                            PainterCanvas(canva: 1, color: color.secundary40),
                        size: Size.infinite,
                      ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Center(
                  child: TextFont(
                    text: globalText.registerText,
                    color: color.primary40,
                    font: 25,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InputGlobalTask(
                        icon: const Icon(Icons.person_2_outlined),
                        title: globalText.nameUser,
                        titleEnter: globalText.nameUserEnter,
                        color: color,
                        onChanged: (p0) {},
                      ),
                      InputGlobalTask(
                        icon: const Icon(Icons.lock_outline_rounded),
                        title: globalText.passwordUser,
                        titleEnter: globalText.passwordUserEnter,
                        color: color,
                        onChanged: (p0) {},
                      ),
                      InputGlobalTask(
                        icon: const Icon(Icons.lock_outline_rounded),
                        title: globalText.passwordUserCon,
                        titleEnter: globalText.passwordUserEnterCon,
                        color: color,
                        onChanged: (p0) {},
                      )
                    ]),
              ),
              Expanded(
                flex: 2,
                child: Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextFont(
                    text: globalText.noUser,
                    color: color.primary60,
                    font: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFont(
                        text: globalText.newUser,
                        color: color.primary60,
                        font: 18,
                      ),
                      InkWell(
                        child: TextFont(
                          text: " ${globalText.newUserClick}",
                          color: color.primary40,
                          font: 18,
                        ),
                        onTap: () {
                          Navigator.popAndPushNamed(context, "LoginScreen");
                        },
                      ),
                    ],
                  ),
                ]),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: ButtonTask(
                    text: globalText.buttonLogin,
                    color: color.primary40,
                    onPressed: () => Navigator.pushNamed(context, "HomeScreen"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// await DB.update(Task(
//                                           idTask: state.idTask,
//                                           title: title,
//                                           description: description,
//                                           status: "Terminado",
//                                           dateInitial:
//                                               "${days(int.parse(day))}/${obtenerMes(int.parse(mounth))}/$year",
//                                           dateFinal:
//                                               "${days(DateTime.now().day)}/${obtenerMes(DateTime.now().month).substring(0, 3)}/${DateTime.now().year}",
//                                           image: "image.png",
//                                           idUser: 1));