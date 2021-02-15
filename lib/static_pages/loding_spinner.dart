import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          decoration: BoxDecoration(
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(height: 100),
              SizedBox(height: 50),
              Text('Loading...',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
                ),
              ),

              SizedBox(height: 100),


              SpinKitHourGlass(
              color: Colors.black45,
              size: 100.0,
            ),
          ])
      ),
    );
  }
}
