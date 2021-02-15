import 'package:flutter/material.dart';

class CreateTodoForm extends StatefulWidget {
  @override
  _CreateTodoFormState createState() => _CreateTodoFormState();
}

class _CreateTodoFormState extends State<CreateTodoForm> {
  final _formKey = GlobalKey<FormState>();
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
                      if(_formKey.currentState.validate()){
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text('processing Data')));
                      }
                  }, child: Text('Add')),
                )
                // Add TextFormFields and ElevatedButton here.
              ]
          )
      ),
    );
  }
}
