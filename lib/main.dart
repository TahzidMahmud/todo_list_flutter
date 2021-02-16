import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_app_todo_list/static_pages/loding_spinner.dart';
import 'package:flutter_app_todo_list/static_pages/create_todo.dart';
import 'package:flutter_app_todo_list/static_pages/single_todo.dart';



import 'dart:convert';
import './todo.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context)=>TodoList(),
      '/loading':(context)=>LoadingSpinner(),
      '/create':(context)=>CreateTodoForm(),
      '/todo':(context)=>SingleTodo()

    },
    initialRoute: '/',
  ));}

  class TodoList extends StatefulWidget {
    @override
    _TodoListState createState() => _TodoListState();
  }

  class _TodoListState extends State<TodoList> {
    List todos;
    Map todo;


    @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }
   Future  getData() async{
     String url="https://jsonplaceholder.typicode.com/todos/";
    Response res = await get(url);
    List data=jsonDecode(res.body);
    setState(() {
      todos=data;
    });



// if(counter==1){ Navigator.pushNamed(context, '/');}


  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.cyan[100],
        appBar: AppBar(
          title: Text("Todo-List"),
          backgroundColor: Colors.cyan[400],
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, '/create');
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
        body:ListView(

          padding: const EdgeInsets.all(10),
          children: ( todos!=null?todos.map((todo){
           return Padding(
             padding: const EdgeInsets.fromLTRB(8,0,8, 10),
             child: GestureDetector(
               onDoubleTap: (){

                 String url="https://jsonplaceholder.typicode.com/todos?id=${todo['id']}";
                 getSingle(url);
                 Navigator.pushNamed(context, '/todo',arguments: todo);

                 // print('changed');

               },
               child: Card(
                 
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            '${todo['title']}',
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        IconButton(onPressed: (){}, icon: Icon(Icons.auto_delete)),
                      ],
                    ),
                  ),
                ),
             ),
           );

          }).toList():[
            LoadingSpinner()
          ]),
        ),
      );
    }
    Future getSingle(url)async{
      Response res = await get(url);
      List data=jsonDecode(res.body);

      setState(() {
        todo ={
          'title':data[0]['title'],
         'body':data[0]['body']
        };
      });
    }

  }

