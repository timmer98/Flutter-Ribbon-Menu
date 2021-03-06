import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:example/mainview.dart";
import "package:example/window_buttons.dart";
import "package:example/word_application_menu.dart";
import "package:example/word_ribbon_tab_view.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:ribbon_menu/ribbon_tab_bar.dart";
import "package:ribbon_menu/ribbon_tab_controller.dart";

class WordStyleTitleBar extends StatelessWidget {
  WordStyleTitleBar({Key? key}) : super(key: key);

  final double titleBarHeight = 156;
  final RibbonTabController controller = RibbonTabController(0);

  ThemeData _buildTheme(context) {
    return Theme.of(context).copyWith(
      textTheme: Theme.of(context)
          .textTheme
          .apply(bodyColor: Colors.white, displayColor: Colors.white),
      textButtonTheme: const TextButtonThemeData(),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        splashColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Container();
    }
    return Theme(
      data: _buildTheme(context),
      child: SizedBox(
        height: titleBarHeight,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          child: Column(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: kRibbonColor,
                  image: DecorationImage(
                    alignment: Alignment.centerRight,
                    image: Image.asset(
                      "assets/geometric-shapes-alpha.png",
                    ).image,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 32,
                      child: Row(
                        children: [
                          Center(
                            child: IconButton(
                              iconSize: 16,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.save,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Expanded(
                            child: MoveWindow(
                              child: const Center(
                                child: Text(
                                  "Document 1 - Word",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const WindowButtons()
                        ],
                      ),
                    ),
                    IntrinsicHeight(
                      child: RibbonTabBar(
                        ribbonTabController: controller,
                        applicationMenu: const WordApplicationMenu(),
                        tabTitles: const ["File", "Start", "Paste"],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: WordRibbonTabView(
                  controller: controller,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
