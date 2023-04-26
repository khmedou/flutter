import 'package:flutter/material.dart';


class InputContainer extends StatelessWidget {
  const InputContainer({
    required Key? key,
    required this.child,
    required this.color,
  }) : super(key: key);

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * 0.8,
        height: size.height * 0.08,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: this.color),
        child: child);
  }
}
