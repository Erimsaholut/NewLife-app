import 'package:flutter/material.dart';

class WidgetIsland extends StatelessWidget {
  final Color themeColor;
  final String text;
  final double size;
  final VoidCallback? onPressed;
  final Widget widget;
  final bool isVisible; // isVisible değişkeni eklendi

  WidgetIsland({
    Key? key,
    required this.themeColor,
    required this.widget,
    this.isVisible = false,
    this.onPressed,
    this.text = "",
    this.size = 1,
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
            child: widget,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}


