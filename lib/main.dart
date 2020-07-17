import 'package:flutter/material.dart';

import './Signature..dart';

void main() => runApp(new MaterialApp(
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(200, 80, 62, 157),
        centerTitle: true,
        elevation: 0.7,
        title: Text(
          'Signature',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: new Container(
        child: new GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              RenderBox object = context.findRenderObject();
              Offset _localPosition =
                  object.globalToLocal(details.globalPosition);
              _points = new List.from(_points)..add(_localPosition);
            });
          },
          onPanEnd: (DragEndDetails details) => _points.add(null),
          child: new CustomPaint(
            painter: new Signature(points: _points),
            size: Size.infinite,
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Color.fromARGB(200, 98, 82, 167),
        child: new Icon(Icons.refresh),
        onPressed: () => _points.clear(),
      ),
    );
  }
}
