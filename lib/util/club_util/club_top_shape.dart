import 'dart:ui' as ui;
import 'package:flutter/material.dart';


class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  // Layer 1
  
  Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_0 = Path();
    path_0.moveTo(size.width*0.0024200,size.height*0.0012800);
    path_0.lineTo(size.width*0.0024200,size.height*1.0012800);
    path_0.quadraticBezierTo(size.width*0.2251400,size.height*0.9997200,size.width*0.3001400,size.height*1.0007200);
    path_0.cubicTo(size.width*0.3813000,size.height*0.9995200,size.width*0.3570400,size.height*0.7236800,size.width*0.5010800,size.height*0.6959600);
    path_0.cubicTo(size.width*0.6418600,size.height*0.7254800,size.width*0.6227600,size.height*1.0056000,size.width*0.7044200,size.height*1.0052800);
    path_0.quadraticBezierTo(size.width*0.7789200,size.height*1.0042800,size.width*1.0024200,size.height*1.0012800);
    path_0.lineTo(size.width*1.0024200,size.height*0.0012800);

    canvas.drawPath(path_0, paint_fill_0);
  

  // Layer 1
  
  Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    
    canvas.drawPath(path_0, paint_stroke_0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }


  Path getClip(Size size) {
    // Return the path matching your custom painter's path
    Path path = Path();
    path.moveTo(size.width * 0.0024200, size.height * 0.0012800);
    path.lineTo(size.width * 0.0024200, size.height * 1.0012800);
    path.quadraticBezierTo(size.width * 0.2251400, size.height * 0.9997200, size.width * 0.3001400, size.height * 1.0007200);
    path.cubicTo(size.width * 0.3813000, size.height * 0.9995200, size.width * 0.3450200, size.height * 0.7102800, size.width * 0.5024200, size.height * 0.7120000);
    path.cubicTo(size.width * 0.6519000, size.height * 0.7092800, size.width * 0.6227600, size.height * 1.0056000, size.width * 0.7044200, size.height * 1.0052800);
    path.quadraticBezierTo(size.width * 0.7789200, size.height * 1.0042800, size.width * 1.0024200, size.height * 1.0012800);
    path.lineTo(size.width * 1.0024200, size.height * 0.0012800);
    return path;
  }
}

class CustomClippedImage extends StatelessWidget {
  Widget child;
  CustomClippedImage(
    {key,
      required this.child,
    }
  );
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CustomClipper(),
      clipBehavior: Clip.hardEdge, 
      child: child, 
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return RPSCustomPainter().getClip(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
