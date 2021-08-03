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
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<String> _items = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedList(
        key: _listKey,
        itemBuilder: (context, index, animation) =>
            _slideItem(context, animation, _items[index]),
        initialItemCount: _items.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addItem('Item ${_items.length}'),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _slideItem(BuildContext context, Animation animation, String item) {
    final index = _items.indexOf(item);
    return SlideTransition(
      position: animation.drive(Tween(
        begin: Offset(-1, 0),
        end: Offset(0, 0),
      )),
      child: ListTile(
        title: Text(item),
        subtitle: index % 2 == 0 ? Text('subtitle') : null,
        leading: Icon(Icons.radio_button_on),
        onTap: () => _promtRemoveItem(item),
      ),
    );
  }

  void _promtRemoveItem(String item) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Do you really want to remove this item?'),
        content: Text(item),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              _removeItem(item);
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }

  void _addItem(String item) {
    _listKey.currentState?.insertItem(_items.length);
    setState(() {
      _items.add(item);
    });
  }

  void _removeItem(String item) {
    final index = _items.indexOf(item);
    _listKey.currentState?.removeItem(
        index, (context, animation) => _slideItem(context, animation, item));
    setState(() {
      _items.remove(item);
    });
  }
}
