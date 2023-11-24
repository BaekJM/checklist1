import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ServePageParch(Function()? onTap, QueryDocumentSnapshot doc) {
  String Title = "title";
  String day = "day";
  String content = "content";
  String Aram = "Aram";
  String Name = "Name";



  return InkWell(
    onTap: onTap,
    child: Container(
      height: 80,
      width: double.infinity,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.black)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doc[Title],
                    style: TextStyle(fontSize: 24),
                  ),
                  Container(width: 200,height: 2,color: Color(0xFF013B5E)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 250,
                    child: Text(
                      doc[content],
                      style: TextStyle(fontSize: 14),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                doc[Aram],
                style: TextStyle(fontSize: 20),
              ),
              Container(
                width: 80,
                  child: Text(
                    doc[day],
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.end,
                    maxLines: 1,
                  ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

///Write

class ServePageWrite extends StatefulWidget {
  const ServePageWrite({Key? key}) : super(key: key);

  @override
  State<ServePageWrite> createState() => _ServePageWriteState();
}

class _ServePageWriteState extends State<ServePageWrite> {
  String date = DateTime.now().toString();

  ///아마 시간대 불러오는 코드인듯
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();
  TextEditingController _AramController = TextEditingController();
  TextEditingController _NameController = TextEditingController();

  String Title = "title";
  String day = "day";
  String content = "content";
  String Aram = "Aram";
  String Name = "Name";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Add New News"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('【内容名】'),
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                      hintText: "入力お願いします。"),
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 40.0,),
                Text('【重要度】'),
                TextField(
                  controller: _AramController,
                  decoration: InputDecoration(
                      hintText: "入力お願いします。"),
                  style: TextStyle(fontSize: 18
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text('【担当者】'),
                TextField(
                  controller: _NameController,
                  decoration: InputDecoration(
                      hintText: "入力お願いします。"),
                  style: TextStyle(fontSize: 18
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text('【時間】'),
                Container(width:250,
                    child: Text(date,style: TextStyle(fontSize: 18),)),
                SizedBox(
                  height: 30.0,
                ),
                Text('【内容】'),
                TextField(
                  controller: _mainController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: "入力お願いします。"),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () async {
          FirebaseFirestore.instance
              .collection("ServePage")
              .doc(_titleController.text)
              .set({
            Title: _titleController.text,
            day: date,
            Aram:_AramController.text,
            content: _mainController.text,
            Name: _NameController.text,
          }).then((value) {
            Navigator.pop(context);
          }).catchError((error) => print('뭔가 잘못됬어 찾아봐'));
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

