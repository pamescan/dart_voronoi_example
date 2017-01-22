import 'dart:math';
import 'dart:html';
import 'package:voronoi/voronoi.dart';

class utils {

  static List <Point> generatePoints(int maxX, int maxY, int npoints) {
    var rng = new Random();
    List<Point> temp = [];
    for (var i = 0; i < npoints; i++) {
      temp.add(new Point(rng.nextInt(maxX), rng.nextInt(maxY)));
    }
    return temp;
  }

  static List <Point> improvePoints(List <Point> list, int interations) {

  }
}
