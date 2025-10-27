import 'package:flutter/material.dart';


class CalcButton extends StatelessWidget {
final String label;
final VoidCallback onTap;
final Color? background;
final Color? foreground;
final TextStyle? textStyle;


const CalcButton({
super.key,
required this.label,
required this.onTap,
this.background,
this.foreground,
this.textStyle,
});


@override
Widget build(BuildContext context) {
return Expanded(
child: SizedBox(
height: 56,
child: FilledButton(
style: FilledButton.styleFrom(
backgroundColor: background,
foregroundColor: foreground,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
),
onPressed: onTap,
child: Text(label, style: textStyle),
),
),
);
}
}