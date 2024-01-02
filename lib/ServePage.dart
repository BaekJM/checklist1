import 'package:checklist/PageParch1/NextPagePart.dart';
import 'package:checklist/PageParch1/PageParch1.dart';
import 'package:checklist/PageParch1/ServePageParch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///Read

class ServePage extends StatefulWidget {
  ServePage(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<ServePage> createState() => _ServePageState();
}

class _ServePageState extends State<ServePage> {
  String Title = "title";
  String day = "day";
  String content = "content";
  String Point = "Point";
  String Name = "Name";
  String Oner = "Oner";

  String date = DateTime.now().toString();

  bool _visibility = false;
  double _PageSize = 200;
  double _PageEndSize = 30;
  Icon _PageIcon = Icon(Icons.arrow_drop_down,size: 35,);



  @override
  Widget build(BuildContext context) {

    String data = widget.doc[Title];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(height: 30, child: Image.asset('poto/logo3.png')),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: () async {
                  FirebaseFirestore.instance
                      .collection("FirstPage")
                      .doc(widget.doc[Title])
                      .delete()
                      .then((value) {
                    Navigator.pop(context);
                      }).catchError((error) => print('뭔가 잘못됬어 삭제를 못하잖아 이유를 찾아봐'));
                },
              icon: Icon(Icons.delete))
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: _PageSize,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF013B5E),
                  Color(0xFF63CAFF),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('【物件名】',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13)),
                          Container(
                            width: 200,
                            height: 2,
                            color: Colors.white24,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              width: 200,
                              child: Text(
                                widget.doc[Title],
                                style:
                                    TextStyle(color: Colors.white, fontSize: 31),
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('【お客様】',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13)),
                                Container(
                                  width: 100,
                                  height: 1,
                                  color: Colors.white24,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    widget.doc[Oner],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 23),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Visibility(
                              visible: _visibility,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('【場所】',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13)),
                                  Container(
                                    width: 100,
                                    height: 1,
                                    color: Colors.white24,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      widget.doc[Point],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 23),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Visibility(
                              visible: _visibility,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('【担当者】',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13)),
                                  Container(
                                    width: 100,
                                    height: 1,
                                    color: Colors.white24,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      widget.doc[Name],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 23),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: _PageEndSize ,)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            iconSize: 30,
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 100,
                                child: Text(
                                  widget.doc[day],
                                  style: TextStyle(color: Colors.white70, fontSize: 15,),maxLines: 1,
                                ),
                              ),
                              Container(
                                width: 100,
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(onPressed: (){
                                      setState(_PageToggle);
                                  }, icon:_PageIcon,color: Colors.white70,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(widget.doc[Title])
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  return Column(
                      children: snapshot.data!.docs
                          .map((note) => ServePageParch(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NextPage(note,data)));
                              }, note))
                          .toList());
                } else {
                  return Text("페이지 없음");
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServePageWrite(data)),
                );
              },
              child: Icon(Icons.add, color: Colors.white,),
              // elevation: 5.0,
            ),
          ),
    );
  }
  void _PageToggle(){
    _visibility = !_visibility;
    if(_visibility == true ){
      setState(() {
        _PageIcon = Icon(Icons.arrow_drop_up,size: 35,);
        _PageSize = 340;
        _PageEndSize = 50;
      });
    }
    if(_visibility == false){
      setState(() {
        _PageIcon = Icon(Icons.arrow_drop_down,size: 35,);
        _PageSize = 200;
        _PageEndSize = 20;
      });
    }
  }
}
