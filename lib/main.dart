import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drag and Drop Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DragDropScreen(),
    );
  }
}

class DragDropScreen extends StatefulWidget {
  @override
  _DragDropScreenState createState() => _DragDropScreenState();
}

class _DragDropScreenState extends State<DragDropScreen> {
  double _x = 0.0;
  double _y = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drag and Drop Game'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: _x,
            top: _y,
            child: Draggable(
              feedback: Container(
                width: 100,
                height: 100,
                color: Colors.blue.withOpacity(0.5),
                child: Center(child: Text('Drag Me')),
              ),
              childWhenDragging: Container(),
              onDragEnd: (details) {
                setState(() {
                  _x = details.offset.dx - 50;  // Offset by half the width of the container
                  _y = details.offset.dy - 50;  // Offset by half the height of the container
                });
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(child: Text('Drag Me')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
