import 'package:flutter/material.dart';
import 'package:new_life/tools/styles.dart';

import 'chain.dart';
import 'main.dart';

class WidgetIsland extends StatelessWidget {
  final Color themeColor;
  final String text;
  final double size;
  final VoidCallback? onPressed;
  final bool isVisible;
  final Function(bool) onEditChainChanged;

  const WidgetIsland({
    Key? key,
    required this.themeColor,
    this.isVisible = false,
    this.onPressed,
    this.text = "",
    this.size = 1,
    required this.onEditChainChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 100 * size,
            decoration: BoxDecoration(
              color: themeColor,
              borderRadius: const BorderRadius.all(Radius.circular(32.0)),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      hintText:
                      "Her gün düzenli olarak yapmak istediğin ana hedefini gir.",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:
                          Colors.black, // Set underline color to black
                        ),
                      ),
                    ),
                    cursorColor: Colors.black, // Set cursor color to black
                    onChanged: (value) {
                      enteredText = value;
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      if (enteredText.isNotEmpty) {
                        startChain();
                        print(enteredText);
                        onEditChainChanged(false); // Call the callback to update the state in MyHomePage
                      }
                    },
                    child: Text("Veriyi Al ve Yazdır", style: buttonStyle()),
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


