import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:example/mainview.dart";
import "package:example/word_style_titlebar.dart";
import "package:flutter/material.dart";

const borderColor = Color(0xFF805306);

void main() {
  runApp(const MyApp());

  doWhenWindowReady(() {
    appWindow.minSize = const Size(600, 450);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WindowBorder(
          width: 1,
          color: borderColor,
          child: Material(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                backgroundBlendMode: BlendMode.multiply,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [kBackgroudStartColor, kBackgroundEndColor],
                  stops: [0.0, 1.0],
                ),
              ),
              child: Column(
                children: [
                  WordStyleTitleBar(),
                  Expanded(child: Container(color: Colors.white))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
