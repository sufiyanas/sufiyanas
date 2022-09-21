import 'package:attentance_book/db/function/db_functions.dart';
import 'package:attentance_book/db/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Addscreen extends StatefulWidget {
  Addscreen({Key? key}) : super(key: key);

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  PickedFile? _imageFile;
  final ImagePicker picker = ImagePicker();
  final _namecontroller = TextEditingController();

  final _classcontroller = TextEditingController();

  final _divissoncontroller = TextEditingController();

  final _rollnocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(children: [
        imageprofile(),
        iconbuttonfunction(context),
        sizedboxfunction(20, 0),
        textfieldfunction(_namecontroller, 'Full name'),
        sizedboxfunction(20, 0),
        textfieldfunction(_classcontroller, 'Class'),
        sizedboxfunction(20, 0),
        textfieldfunction(_divissoncontroller, 'Divission'),
        sizedboxfunction(20, 0),
        textfieldfunction(_rollnocontroller, 'Roll number'),
        sizedboxfunction(20, 0),
        ElevatedButton(
          onPressed: () {
            onAddStudentButtonClicked();
          },
          child: Text('Add'),
        )
      ]),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final _name = _namecontroller.text.trim();
    final _class = _classcontroller.text.trim();
    final _divission = _divissoncontroller.text.trim();
    final _rollno = _rollnocontroller.text.trim();

    if (_name.isEmpty ||
        _class.isEmpty ||
        _divission.isEmpty ||
        _rollno.isEmpty) {
      return;
    }

    final _student = StudentModal(
      name: _name,
      classs: _class,
      divission: _divission,
      rollno: _rollno,
    );
    addStudent(_student);
  }

// text field funcion
  Widget textfieldfunction(
    TextEditingController controller,
    String labaltext,
  ) {
    return TextField(
      controller: controller,
      style: const TextStyle(
          fontSize: 18.0, color: Color.fromARGB(255, 13, 93, 174)),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintStyle: TextStyle(color: Colors.grey[800]),
          labelText: "$labaltext",
          fillColor: Colors.black45),
    );
  }

  Widget iconbuttonfunction(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return botomsheet();
            },
          );
        },
        icon: Icon(Icons.file_upload, size: 50, color: Colors.brown));
  }

  // Take Photo
  void takePhoto(ImageSource source) async {
    final PickedFile = await picker.pickImage(source: source);
    setState(() {
      // _imageFile = PickedFile;
    });
  }
}

//bottem sheet

Widget botomsheet() {
  return Container(
    height: 100,
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Column(
      children: [
        Text(
          'Choose Profile Photo',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.camera,
                )),
            TextButton(onPressed: () {}, child: Icon(Icons.image)),
          ],
        )
      ],
    ),
  );
}

// profile image
imageprofile() {
  return CircleAvatar(
    backgroundImage: AssetImage('assets/images/profile_pic.jfif'),
    radius: 100,
  );
}

//icon button

// sized box

sizedboxfunction(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}
