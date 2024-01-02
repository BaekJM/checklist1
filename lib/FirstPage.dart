import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'PageParch1/PageParch1.dart';
import 'ServePage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(height:40,
            child: Image.asset('poto/logo3.png')
        ),
      ),
      body: ListView(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("FirstPage").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(snapshot.hasData) {
                  return Column(
                      children: snapshot.data!.docs.map((note) => NewsCard(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ServePage(note)));
                      }, note)).toList());
                }
                else{
                  return Text("페이지 없음");
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FittedBox(
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsWrite()),
                );
              },
              child: Icon(Icons.add, color: Colors.white,),
              // elevation: 5.0,
            ),
          ),
        ],
      ),
    );
  }
}
