import 'package:flutter/material.dart';
import 'package:task/color/color_theme.dart';
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
                child: Container(
                  color: color.secundary40,
                ),
              ),
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
                      InputLogin(
                          icon: Icons.person_2_outlined,
                          title: globalText.nameUser,
                          titleEnter: globalText.nameUserEnter,
                          color: color),
                      InputLogin(
                          icon: Icons.lock_outline_rounded,
                          title: globalText.passwordUser,
                          titleEnter: globalText.passwordUserEnter,
                          color: color),
                      InputLogin(
                          icon: Icons.lock_outline_rounded,
                          title: globalText.passwordUserCon,
                          titleEnter: globalText.passwordUserEnterCon,
                          color: color)
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
                child: ButtonTask(
                  text: globalText.buttonLogin,
                  color: color.primary40,
                  onPressed: () => Navigator.pushNamed(context, "HomeScreen"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
