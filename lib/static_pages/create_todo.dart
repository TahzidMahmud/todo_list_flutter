import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import 'dart:convert';




class CreateTodoForm extends StatefulWidget {
  @override
  _CreateTodoFormState createState() => _CreateTodoFormState();
}

class _CreateTodoFormState extends State<CreateTodoForm> {
  final _formKey = GlobalKey<FormState>();
  final titleController=TextEditingController();
  final bodyController=TextEditingController();
  final url ='https://jsonplaceholder.typicode.com/posts';
  Map data;
  // var data = new Map<String, dynamic>();
  // data['title'] = titleController.text;
  Future postForm() async{
    print("requesting");
    Response res = await post(url,body:data);
    print("request end");
    data = jsonDecode(res.body);
    print(data);
    Alert(
      context: context,
      type: AlertType.success,
      title: "New Todo Added",
      desc: "title:${data['title']}",
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
    print("called");


  }


  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    titleController.dispose();
    bodyController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Todo"),
        backgroundColor: Colors.cyan[400],
        centerTitle: true,
      ),
      body: Form(
          key: _formKey,
          child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Put Title',
                      hintText: 'Wake up ...',

                    ),
                    validator: (value){
                        if(value.isEmpty){
                          return "please enter text";
                        }
                        return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: TextFormField(
                    controller: bodyController,
                    decoration: InputDecoration(
                      labelText: 'Put Body',
                      hintText: 'Wake up at 7 for mornign walk ...',

                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return "please enter text";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){
                    print("pressed");


                    if(_formKey.currentState.validate()){
                        setState(() {
                          print("state set");

                          data={
                            'title':titleController.text,
                            'body':bodyController.text,
                            'userId':'1'
                          };
                        });

                        postForm();
                      }
                  }, child: Text('Add')),
                ),
                // Add TextFormFields and ElevatedButton here.

    ]
          )
      ),
    );
  }
}
