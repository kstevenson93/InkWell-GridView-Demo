import 'package:flutter/material.dart';

import 'trail.dart';
import 'trail_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inkwell Gridview',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Inkwell Gridview Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Create a list of objects to display on page
  final trails = List<Trail>.generate(
    4,
    (i) => Trail(
          'Trail ${i + 1}',
          new Image.asset(
            'assets/img/125.png',
            fit: BoxFit.cover,
          ),
        ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //GridView creates a dynamic list of objects to display
      body: GridView.count(
          //number of columns
          crossAxisCount: 2,
          //space between columns
          crossAxisSpacing: 20.0,
          //how much space the children of GridView will take up inside each grid widget
          childAspectRatio: 0.8,
          shrinkWrap: true,
          controller: ScrollController(keepScrollOffset: false),
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(20.0),
          //Create a list of widgets to populate the gridview, based on the number of trails
          children: List.generate(trails.length, (index) {
            //Material widget determines the shape and color of InkWell widget
            return Material(
              color: Colors.red[400],
              shape: CircleBorder(),
              //InkWell is a custom shaped widget that can function as a button
              child: InkWell(
                highlightColor: Colors.orangeAccent.withOpacity(0.2),
                splashColor: Colors.yellow[400],
                radius: 25.0,
                borderRadius: BorderRadius.circular(180),
                onTap: () {
                  setState(() {});
                  //Pushes selected trail to trail_details.dart, based on the index of the inkwell that was pushed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrailDetails(
                            trail: trails[index],
                          ),
                    ),
                  );
                },
                //Column() holds the data at each index inside of the InkWell
                child: Stack(
                  fit: StackFit.loose,
                  overflow: Overflow.clip,
                  alignment: Alignment.center,
                  children: <Widget>[
                    trails[index].image,
                    Text(
                      trails[index].title,
                      textScaleFactor: 2.0,
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
