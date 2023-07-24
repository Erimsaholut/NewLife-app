import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:new_life/tools/styles.dart';

class Island extends StatelessWidget {
  final Color themeColor;
  final String text;
  final double size;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final bool isVisiable;

  const Island({
    Key? key,
    required this.themeColor,
    this.onPressed,
    this.onLongPressed,
    this.text = "",
    this.size = 1,
    this.isVisiable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisiable,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 100 * size,
            width: double.infinity,
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
                  style: quoteStyle(),
                ),
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
