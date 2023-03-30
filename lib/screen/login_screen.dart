import 'package:flutter/material.dart';
import 'package:task/color/color_theme.dart';
import '../widget/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginText = LoginText();
    final color = ColorPrimary();

    return Scaffold(
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
                  color: color.primary40,
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: TextFont(
                    text: loginText.loginText,
                    color: color.primary40,
                    font: 28,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InputGlobalTask(
                        icon: const Icon(Icons.person_2_outlined),
                        title: loginText.nameUser,
                        titleEnter: loginText.nameUserEnter,
                        color: color,
                        onChanged: (p0) {},
                      ),
                      InputGlobalTask(
                          icon: const Icon(Icons.lock_outline_rounded),
                          title: loginText.passwordUser,
                          titleEnter: loginText.passwordUserEnter,
                          color: color,onChanged: (p0) {
                            
                          },)
                    ]),
              ),
              Expanded(
                flex: 2,
                child: Column(children: [
                  TextFont(
                    text: loginText.noUser,
                    color: color.primary60,
                    font: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFont(
                        text: loginText.newUser,
                        color: color.primary60,
                        font: 18,
                      ),
                      InkWell(
                        child: TextFont(
                          text: " ${loginText.newUserClick}",
                          color: color.primary40,
                          font: 18,
                        ),
                        onTap: () {
                          Navigator.popAndPushNamed(context, "RegisterScreen");
                        },
                      ),
                    ],
                  ),
                ]),
              ),
              ButtonTask(
                text: loginText.buttonLogin,
                color: color.primary40,
                onPressed: () => Navigator.pushNamed(context, "HomeScreen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
