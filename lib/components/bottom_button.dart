import 'package:flutter/material.dart';

class BottomButtom extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onPressed;
  const BottomButtom({
    required this.icon,
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          SizedBox(
            height: 4,
          ),
          Text(text),
        ],
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        overlayColor: MaterialStateProperty.all<Color>(Colors.white12),
      ),
    );
  }
}
