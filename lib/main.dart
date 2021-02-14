import 'package:flutter/material.dart';
import './todo.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context)=>TodoList(),
    },
    initialRoute: '/',
  ));}

  class TodoList extends StatefulWidget {
    @override
    _TodoListState createState() => _TodoListState();
  }

  class _TodoListState extends State<TodoList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Todo-List"),
          backgroundColor: Colors.cyan[400],
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: <Widget>[

          ],
        ),
      );
    }
  }
