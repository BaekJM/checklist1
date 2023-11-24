
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  NextPage(this.doc,{Key? key}) : super(key:key);
  QueryDocumentSnapshot doc;

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {

  String Title = "title";
  String day = "day";
  String content = "content";
  String Aram = "Aram";
  String Name = "Name";

  TextEditingController _titleController = TextEditingController();

  String date = DateTime.now().toString(); ///아마 시간대 불러오는 코드인듯

  bool _visibility = true;
  void _show() {
    setState(() {
      _visibility = true;
    });
  }
  void _hide() {
    setState(() {
      _visibility = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _mainController = TextEditingController(text: widget.doc[content]);
    return Scaffold(
      backgroundColor: Color(0xFF013B5E),
      appBar: AppBar(
        title: Container(height:30,
            child: Image.asset('poto/logo3.png')
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        height: 1800,
        child: ListView(
              children: [
                Text(widget.doc[Title],style: TextStyle(color: Colors.white,fontSize: 25),),
                SizedBox(height: 8.0,),
                Text(widget.doc[Name]),
                Text(date),
                SizedBox(height: 28.0,),
                Container(height:1600,color: Colors.white,
                child: Text(widget.doc[content]),)
              ],
            ),
      ),
    );
  }
}