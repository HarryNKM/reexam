import 'dart:io';

import 'package:flutter/material.dart';

import '../../utiles/global.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "Home Screen",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'add');
          }, icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'invoice',arguments: g1.l1);
              },
              icon: const Icon(Icons.picture_as_pdf)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: g1.l1.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'detail');
              },
              child: Container(
                height: 100,
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: FileImage(
                        File("${g1.l1[index].img}"),
                      ),
                    ),

                    Text(
                      "name : ${g1.l1[index].product}\nprice : ${g1.l1[index].price}",
                    ),
                    Text(
                      "QTY : ${g1.l1[index].price}",
                    ),
                    IconButton(onPressed: () {
                      setState(() {
                        g1.l1.removeAt(index);
                      });
                    }, icon: Icon(Icons.delete),),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
