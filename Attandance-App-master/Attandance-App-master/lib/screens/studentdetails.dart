import 'package:attentance_book/db/model/data_model.dart';
import 'package:flutter/material.dart';

class Studentdetails extends StatelessWidget {
  Studentdetails({Key? key, required this.data}) : super(key: key);
  StudentModal data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Full Name : ${data.name},',
              ),
              SizedBox(
                height: 20,
              ),
              Text('Class: ${data.classs}'),
              Text('divission :${data.divission}'),
              Text('Roll number: ${data.rollno}'),
            ],
          ),
        ),
      ),
    );
  }
}
