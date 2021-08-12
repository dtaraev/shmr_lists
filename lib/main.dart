import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.extent(
        padding: EdgeInsets.all(8),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        maxCrossAxisExtent: 100,
        children: <Widget>[
          Container(
            child: Text('Item 1'),
            padding: EdgeInsets.all(8),
            color: Colors.red[50],
          ),
          Container(
            child: Text('Item 2'),
            padding: EdgeInsets.all(8),
            color: Colors.red[100],
          ),
          Container(
            child: Text('Item 3'),
            padding: EdgeInsets.all(8),
            color: Colors.red[200],
          ),
          Container(
            child: Text('Item 4'),
            padding: EdgeInsets.all(8),
            color: Colors.red[300],
          ),
          Container(
            child: Text('Item 5'),
            padding: EdgeInsets.all(8),
            color: Colors.red[400],
          ),
          Container(
            child: Text('Item 6'),
            padding: EdgeInsets.all(8),
            color: Colors.red[500],
          ),
          Container(
            child: Text('Item 7'),
            padding: EdgeInsets.all(8),
            color: Colors.red[600],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
