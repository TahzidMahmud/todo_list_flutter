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
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Todo-List"),
          backgroundColor: Colors.cyan[400],
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red[300],
          
          child:Icons(Icons.add),
        ),
        body: Column(
          children: <Widget>[

          ],
        ),
      );
    }
  }
