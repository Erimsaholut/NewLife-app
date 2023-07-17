import 'package:new_life/functional_islands/chain/chain.dart';
import 'package:new_life/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../../tools/styles.dart';

class WidgetIsland extends StatefulWidget {
  final Color themeColor;
  final double size;
  final bool isVisible;
  final Function(bool) onEditChainChanged;

  const WidgetIsland({
    Key? key,
    required this.themeColor,
    this.isVisible = false,
    this.size = 1,
    required this.onEditChainChanged,
  }) : super(key: key);

  @override
  State<WidgetIsland> createState() => _WidgetIslandState();
}

class _WidgetIslandState extends State<WidgetIsland> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    getTarget();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> getTarget() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? targets = prefs.getString('MainTarget');
    print(targets);
    if (targets != null && targets.isNotEmpty) {

    }
  }

  Future<void> setTarget(String mainTarget) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('mainTarget', mainTarget);
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 100 * widget.size,
            decoration: BoxDecoration(
              color: widget.themeColor,
              borderRadius: const BorderRadius.all(Radius.circular(32.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: "Her gün düzenli olarak yapmak istediğin ana hedefini gir.",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black, // Set underline color to black
                        ),
                      ),
                    ),
                    cursorColor: Colors.black, // Set cursor color to black
                  ),
                  TextButton(
                    onPressed: () {
                      String enteredText = _textController.text.trim();
                      if (enteredText.isNotEmpty) {
                        print(enteredText);
                        setTarget(enteredText);
                        startChain();
                        widget.onEditChainChanged(false);
                      }
                    },
                    child: Text("Veriyi Al ve Yazdır",style: buttonStyle(),),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
