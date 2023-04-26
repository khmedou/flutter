import 'package:flutter/material.dart';


class MyClippingPath extends StatelessWidget {
  const MyClippingPath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClipingPathWidget();
  }
}

class ClipingPathWidget extends StatelessWidget {
  const ClipingPathWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath( 
      clipper: MainClipPath(),
      child: Container(
        color: Colors.green.shade100
        
      ),
     
    );
  }
}

class MainClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height / 2.3);
    path.cubicTo(size.width * 0.2, size.height * 0.4, size.width * 0.7,
        size.height * 1.1, size.width, size.height * 0.9);
    path.lineTo(size.width, 0);
   
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class SecondClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height / 6);
    path.quadraticBezierTo(size.width / 5, size.height / 2.5,
        2 * size.width / 3, size.height / 3.65);
    path.quadraticBezierTo(
        size.width / 5, size.height / 2.5, 0, size.height / 8);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ThirdClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(1.8 * size.width / 3, size.height / 3.2);
    path.quadraticBezierTo(
        2.5 * size.width / 3, size.height / 2.8, size.width, size.height / 3);
    path.lineTo(size.width, size.height / 8);
    path.quadraticBezierTo(2.2 * size.width / 3.5, size.height / 3.45,
        1.7 * size.width / 3, size.height / 3.2);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
