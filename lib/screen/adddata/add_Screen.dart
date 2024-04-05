import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reexam/modal/modal.dart';
import 'package:reexam/utiles/global.dart';



class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController txtname = TextEditingController();
  TextEditingController txtxQty = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  String? path="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "Add New Product",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: IconButton(
                            onPressed: () async {
                              ImagePicker picker = ImagePicker();
                              XFile? image = await picker.pickImage(
                                  source: ImageSource.camera);
                              setState(() {
                                path = image!.path;
                                g1.img = image.path;
                              });
                            },
                            icon: const Icon(
                              Icons.account_circle_outlined,
                              size: 70,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("ENTER Name "),
                        ),
                        keyboardType: TextInputType.name,
                        controller: txtname,
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "This Feild Is Required";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("ENTER Qty"),
                        ),
                        keyboardType: TextInputType.number,
                        controller: txtxQty,
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "This Feild Is Required";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("ENTER Price"),
                        ),
                        keyboardType: TextInputType.number,
                        controller: txtprice,
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "This Feild Is Required";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (path != null) {
                      Modal m1 = Modal(
                          product: txtname.text,
                          price: txtprice.text,
                          Qty: txtxQty.text,
                          img: path);
                      g1.l1.add(m1);
                      Navigator.pushNamed(context,'product');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please Choose Image"),
                        ),
                      );
                    }
                  }
                },
                child: const Text(
                  "SAVE",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
