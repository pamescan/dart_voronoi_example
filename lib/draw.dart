import 'dart:html';
import 'dart:math';
import 'package:angular2/core.dart';

class draw {

  static drawLine(CanvasRenderingContext2D context, Point p0, Point p1, {color: "black"}) {
    context.beginPath();
    context.moveTo(p0.x, p0.y);
    context.lineTo(p1.x, p1.y);
    context.strokeStyle = color;
    context.stroke();
  }

  static drawCircle(CanvasRenderingContext2D context, num centerX, num centerY, num radius, {color: "black"}) {
    context.beginPath();
    context.arc(centerX, centerY, 1.5, 0, 2 * PI);
    context.fillStyle = color;
    context.fill();
  }
}