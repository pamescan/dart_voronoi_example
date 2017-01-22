import 'dart:math';
import 'dart:html';
import 'util.dart';
import 'draw.dart';
import 'package:voronoi/voronoi.dart';

class Layer {
  final String id;
  final int width;
  final int height;


  CanvasRenderingContext2D context;
  final CanvasElement canvas;

  int npoints = 6;

  List <Point> originalPoints;

  Voronoi voronoi;
  List <LineSegment> delaunayTriangulation;
  List <LineSegment> voronoiDiagram;


  Layer(this.id, this.canvas, this.width, this.height) {
    this.context = canvas.getContext('2d');
    originalPoints = utils.generatePoints(this.width, this.height, this.npoints);
  }


  drawPoints(List <Point> list, {color: 'black'}) {
    list.forEach((point) => draw.drawCircle(context, point.x, point.y, 1, color: color));
  }

  drawLines(List<LineSegment> list, {color: 'black'}) {
    list.forEach((segment) => draw.drawLine(context, segment.p0, segment.p1, color: color));
  }

  clear() {
    //context.clearRect(0, 0, this.width, this.height);
    context
      ..fillStyle = "white"
      ..fillRect(0, 0, canvas.width, canvas.height);
  }

  Voronoi _generateVoronoi() {

    List<int> colors = [];
    for (var i = 0; i < npoints; i++) {
      colors.add(i);
    }
    return new Voronoi(originalPoints, colors, new Rectangle(0, 0, width, height));
  }


  Point _centroid(List<Point> list) {
    var x = 0;
    var y = 0;

    for (var i = 0; i < list.length; i++) {
      x += list[i].x;
      y + list[i].y;
    }
    Point point = new Point(x / list.length, y / list.length);
    return point;
  }

  _improvePoints() {
    List <Point> temp = [];
    Voronoi voronoi = _generateVoronoi();
    //var regionsList = voronoi.edges;
    //regionsList.forEach((region) => temp.add(_centroid(region)));
    //this.originalPoints = temp;
  }


  showOriginalPoints() {
    this.clear();
    drawPoints(originalPoints);
  }

  showVoronoiDiagram() {
    this.clear();
    Voronoi voronoi = _generateVoronoi();

    drawLines(voronoi.voronoiDiagram(), color: 'green');
  }

  showDelaunayRegions() {
    this.clear();
    Voronoi voronoi = _generateVoronoi();
    List<LineSegment> delaunayTriangulation = voronoi.delaunayTriangulation();
    drawLines(delaunayTriangulation, color: 'red');
  }

  showVoronoiRelaxation() {

    _improvePoints();
    showOriginalPoints();
  }


}