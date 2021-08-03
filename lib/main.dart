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
  List<String> _items = <String>[];

  void _addItem(String item) {
    setState(() {
      _items.add(item);
    });
  }

  void _removeItem(String item) {
    setState(() {
      _items.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_items[index]),
            subtitle: index % 2 == 0 ? Text('subtitle') : null,
            leading: Icon(Icons.radio_button_on),
            onTap: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Do you really want to remove this item?'),
                content: Text(_items[index]),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      _removeItem(_items[index]);
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: _items.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addItem('Item ${_items.length}'),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
