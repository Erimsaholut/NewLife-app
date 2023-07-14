import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:new_life/tools/styles.dart';

class ProgramMaker extends StatefulWidget {
  final Color themeColor;
  final double size;
  final VoidCallback? onLongPressed;

  const ProgramMaker({
    Key? key,
    required this.themeColor,
    this.onLongPressed,
    this.size = 1,
  }) : super(key: key);

  @override
  _ProgramMakerState createState() => _ProgramMakerState();
}

class _ProgramMakerState extends State<ProgramMaker> {
  double programSize = 1;
  String programText = "Program oluşturmak için basınız.";
  int targetCount = 1;

  void makeBigger() {
    setState(() {
      programSize += 1;
      programText = "Lütfen $targetCount. hedefinizi yazınız:";
      targetCount += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 100 * widget.size,
          decoration: BoxDecoration(
            color: widget.themeColor,
            borderRadius: const BorderRadius.all(Radius.circular(32.0)),
          ),
          child: TextButton(
            onPressed: makeBigger,
            onLongPress: widget.onLongPressed,
            child: Center(
              child: AutoSizeText(
                programText,
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
    );
  }
}

