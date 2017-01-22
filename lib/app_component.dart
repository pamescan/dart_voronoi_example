// Copyright (c) 2016, pablo.mestre. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';

//import 'dart:math';
//import 'package:voronoi/voronoi.dart';

//import 'util.dart';
//import 'draw.dart';
import 'layer.dart';

//import 'package:d3/d3.dart';
import 'dart:html';
//import 'dart:js';

//import 'package:quiver/iterables.dart' show max;

//import 'package:vector_math/vector_math.dart' as VM;
//import 'dart:html' as HTML;


@Component(
    selector: 'my-app',
    styleUrls: const ['app_component.css'],
    directives: const[],
    templateUrl: 'app_component.html')
class AppComponent implements OnInit {

  Layer layer;

  //CanvasRenderingContext2D context;
  //CanvasElement canvas;

  String sizeInput = "450";

  //String npointsInput = "300";
  String actualSize;


  int get size => int.parse(actualSize);

  // int get npoints => int.parse(npointsInput);

  AppComponent() {
    actualSize = sizeInput;
  }

  ngOnInit() {
    this.layer = new Layer('myCanvas', document.getElementById('myCanvas'), int.parse(actualSize), int.parse(actualSize));
    this.layer.showOriginalPoints();
    /*canvas = document.getElementById('myCanvas');
    this.context =
        canvas.getContext('2d');*/

    /*  context.moveTo(100, 150);
    context.lineTo(450, 50);
    context.stroke();*/
    //Rectangle rectangulo = new Rectangle(0, 0, 100, 100);
    //Point point = new Point(5, 5);
    //List <Point> temp= _randomPoint(200,200,100);
    //drawCircles(canvas,temp);

  }


  showOriginalPoints()=>this.layer.showOriginalPoints();
  showVoronoiRegions()=>this.layer.showVoronoiDiagram();
  showDelaunayRegions()=>this.layer.showDelaunayRegions();
  showVoronoiRelaxation()=>this.layer.showVoronoiRelaxation();
  clearCanvas()=>this.layer.clear();



}


