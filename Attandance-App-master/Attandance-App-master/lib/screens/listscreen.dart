import 'package:attentance_book/db/function/db_functions.dart';
import 'package:attentance_book/db/model/data_model.dart';
import 'package:attentance_book/screens/studentdetails.dart';

import 'package:flutter/material.dart';

class Listscreen extends StatelessWidget {
  Listscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: StudentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModal> studentList, Widget? child) {
        return Container(
          padding: EdgeInsets.all(10),
          child: ListView.separated(
            itemBuilder: (ctx, index) {
              final data = studentList[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logio.webp'),
                ),
                trailing: Icon(
                  Icons.more_vert,
                ),
                title: Text(data.name),
                subtitle: Text(data.classs),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((ctx) => Studentdetails(
                          data: data,
                        )),
                  ),
                ),
              );
            },
            separatorBuilder: ((context, index) {
              return const Divider();
            }),
            itemCount: studentList.length,
          ),
        );
      },
    );
  }

// drop down Started
  var myMenuItems = <String>[
    'Edit',
    'Delete',
    'View',
  ];
  void onSelect(item) {
    switch (item) {
      case 'Edit':
        print('Edit clicked');
        break;
      case 'Deleted':
        print('Delete clicked');
        break;
      case 'View':
        print('View clicked');
        break;
    }
  }
}
