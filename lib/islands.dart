import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Island extends StatelessWidget {
  final Color themeColor;
  final String text;
  final double size;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;

  const Island({
    Key? key,
    required this.themeColor,
    this.onPressed,
    this.onLongPressed,
    this.text = "",
    this.size = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 100 * size,
          decoration: BoxDecoration(
            color: themeColor,
            borderRadius: const BorderRadius.all(Radius.circular(32.0)),
          ),
          child: TextButton(
            onPressed: onPressed,
            onLongPress: onLongPressed,
            child: Center(
              child: AutoSizeText(
                text,
                maxLines: 6,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
