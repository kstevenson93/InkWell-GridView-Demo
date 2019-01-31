import 'package:flutter/material.dart';
import 'trail.dart';

class TrailDetails extends StatelessWidget {
  final Trail trail;

  TrailDetails({Key key, @required this.trail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trail.title),
        backgroundColor: Colors.red[400],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: trail.icon,
        ),
      ),
    );
  }
}
