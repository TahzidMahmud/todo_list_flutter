import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class SingleTodo extends StatefulWidget {
  @override
  _SingleTodoState createState() => _SingleTodoState();
}

class _SingleTodoState extends State<SingleTodo> {
    Map data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

     setState(() {

       data=ModalRoute.of(context).settings.arguments;
     });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[400],
        title: Text("Task Number: ${data['id']}"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Title:${data['title']}",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black
              ),
            ),
          ),
          SizedBox(height: 30),
          Text("Status:${data['completed']?'Completed':'Not-Completed'}",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black45
          ),),
        ],
      ),
    );
  }
}
