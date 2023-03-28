import 'package:flutter/material.dart';
import 'package:task/color/color_theme.dart';
import 'package:task/widget/text_font.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            itemCount: 3,
            itemBuilder: (context, index) {
              return CardTask(size: size, color: color);
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
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
              onPressed: () {}),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
          ]),
    );
  }
}

class CardTask extends StatelessWidget {
  const CardTask({
    super.key,
    required this.size,
    required this.color,
  });

  final Size size;
  final ColorPrimary color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: size.width * 0.04,
          left: size.width * 0.04,
          right: size.width * 0.04),
      child: Card(
        elevation: 5,
        child: Container(
          height: size.height * 0.23,
          width: size.width,
          color: color.primary90,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: ListTile(
                    leading: const CircleAvatar(
                      maxRadius: 25,
                      backgroundImage: AssetImage("assets/images/user.jpg"),
                    ),
                    title: TextFont(
                      text: "Enviar documentció",
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
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: TextFont(
                      text:
                          "Ex quis id nulla enim laboris amet occaecat est elit. Velit enim laboris sit quis elit ut voluptate anim ea. Officia pariatur fugiat exercitation laborum esse esse fugiat exercitation quis cillum ullamco. Reprehenderit fugiat irure occaecat ea tempor enim esse pariatur proident fugiat. Sunt dolore officia occaecat et reprehenderit irure laboris nisi dolor in ipsum velit.",
                      color: color.primary20,
                      font: 15),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListTile(
                    leading: TextFont(
                      text: "Pendiente",
                      color: color.primary20,
                      font: 15,
                      fontWeight: FontWeight.w700,
                    ),
                    trailing: TextFont(
                      text: "28/Feb/2023",
                      color: color.primary20,
                      font: 15,
                      fontWeight: FontWeight.w700,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
