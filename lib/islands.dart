import 'package:flutter/material.dart';
import 'package:new_life/daily_quote.dart';

class Island extends StatelessWidget {
  final Color themeColor;
  final IconData? myIcon;

  final String text;

  final double size;

  const Island({
    Key? key,
    required this.themeColor,
    this.myIcon,
    this.text = "",
    this.size = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100 * size,
          decoration: BoxDecoration(
            color: themeColor,
            borderRadius: const BorderRadius.all(Radius.circular(32.0)),
          ),
          child: TextButton(
            onPressed: () {
              print(dailyQuote());
            },
            child: Row(
              children: [
                if (myIcon != null)
                  Expanded(
                    child: Icon(
                      myIcon,
                      color: Colors.black,
                    ),
                  ),
                Expanded(
                  flex: myIcon != null ? 3 : 4,
                  child: Center(
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
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
