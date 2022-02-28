
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'listview.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Firebase Database Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _idController= TextEditingController();
  final _nameController= TextEditingController();
  final _deptController= TextEditingController();
  CollectionReference reference= FirebaseFirestore.instance.collection("student");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget> [

              Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: TextFormField(
                  controller: _idController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                    hintText: 'Enter ID',
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                    hintText: 'Enter Name',
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: TextFormField(
                  controller: _deptController,
                  decoration: const InputDecoration(
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                    hintText: 'Enter Dept',
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                  ),
                ),
              ),

              Container(
                color: Colors.white,
                width: 150,
                height: 45,
                margin: const EdgeInsets.only(top: 20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text('Submit', style: TextStyle(fontSize: 20),),
                  onPressed: (){
                    setState(() {
                      reference.add({
                        "id": _idController.text.toString(),
                        "name": _nameController.text.toString(),
                        "dept": _deptController.text.toString(),
                      });
                      _idController.clear();
                      _nameController.clear();
                      _deptController.clear();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ListDataShow()));
                    });
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}









