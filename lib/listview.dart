import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDataShow extends StatefulWidget {
  const ListDataShow({Key? key}) : super(key: key);

  @override
  _ListDataShowState createState() => _ListDataShowState();
}

class _ListDataShowState extends State<ListDataShow> {

  CollectionReference reference= FirebaseFirestore.instance.collection("student");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Data", style: TextStyle(fontSize: 20),),
      ),
      body: StreamBuilder(
        stream: reference.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          print("data___ $snapshot");
          return ListView(
            children: snapshot.data!.docs.map((mapData){
              return Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.amber,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: <Widget> [

                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[300],
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        "Id : ${mapData['id'].toString()}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),

                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[100],
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        "Name : ${mapData['name'].toString()}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),

                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[300],
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        "Dept : ${mapData['dept'].toString()}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),

                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
