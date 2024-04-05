import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utiles/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          "Home Screen",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () async{
            ImagePicker picker = ImagePicker();
            XFile? image = await picker.pickImage(
                source: ImageSource.camera);
            setState(() {
              path = image!.path;
              g1.img = image.path;
            });
          }, icon: Icon(Icons.image))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                controller: txtname,
                decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  label: const Text("Name"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: txtphone,
                decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  label: const Text("Phone"),
                ),
                validator: (value) {
                  if(value!.isEmpty)
                    {
                      return "Enter Phone Number ";
                    }
                  else if(value.length!=10) {
                    return "Enter 10 digit number";
                  }
                  else
                    return null;

                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: txtemail,
                decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  label: const Text("Email"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Email";
                  } else if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return "Enter Valid Email ";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                onPressed: () {
                 if(formkey.currentState!.validate())
                   {
                      g1.name=txtname.text;
                      g1.email=txtemail.text;
                      g1.phone=txtphone.text;
                      Navigator.pushNamed(context, 'add');
                   }
                },
                child: const Text("Save"),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
