// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// ///Read
//
// class NewsRead extends StatefulWidget {
//   NewsRead(this.doc, {Key? key}) : super(key: key);
//   QueryDocumentSnapshot doc;
//
//   @override
//   State<NewsRead> createState() => _NewsReadState();
// }
//
// class _NewsReadState extends State<NewsRead> {
//   String Title = "title";
//   String day = "day";
//   String content = "content";
//   String Point = "Point";
//   String Name = "Name";
//   String Oner = "Oner";
//
//   TextEditingController _titleController = TextEditingController();
//
//   String date = DateTime.now().toString();
//
//   ///아마 시간대 불러오는 코드인듯
//
//   bool _visibility = true;
//
//   void _show() {
//     setState(() {
//       _visibility = true;
//     });
//   }
//
//   void _hide() {
//     setState(() {
//       _visibility = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _mainController =
//     TextEditingController(text: widget.doc[content]);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Container(height:30,
//             child: Image.asset('poto/logo3.png')
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//       ),
//       body: Stack(
//         children: [
//           /// 수정 가능 한 페이지
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(widget.doc[Title]),
//               SizedBox(
//                 height: 8.0,
//               ),
//               Text(date),
//               SizedBox(
//                 height: 28.0,
//               ),
//               TextField(
//                 controller: _mainController,
//                 keyboardType: TextInputType.multiline,
//                 maxLines: null,
//                 decoration: InputDecoration(
//                     border: InputBorder.none, hintText: "News content"),
//               ),
//             ],
//           ),
//           Container(
//             width: double.infinity,
//             height: 290,
//             decoration:  BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xFF013B5E),
//                   Color(0xFF63CAFF),
//                 ],
//               ),
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(40.0),
//                 bottomRight: Radius.circular(40.0),
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('【物件名】',style: TextStyle(color: Colors.white,fontSize: 13)),
//                           Container(width: 200,height: 2,color: Colors.white70,),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 8.0),
//                             child: Text(widget.doc[Title],style: TextStyle(color: Colors.white,fontSize: 35),),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SizedBox(height: 10,),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('【お客様】',style: TextStyle(color: Colors.white,fontSize: 13)),
//                                 Container(width: 100,height: 1,color: Colors.white70,),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 8.0),
//                                   child: Text(widget.doc[Oner],style: TextStyle(color: Colors.white,fontSize: 23),),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 10,),Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('【場所】',style: TextStyle(color: Colors.white,fontSize: 13)),
//                                 Container(width: 100,height: 1,color: Colors.white70,),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 8.0),
//                                   child: Text(widget.doc[Point],style: TextStyle(color: Colors.white,fontSize: 23),),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 10,),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('【担当者】',style: TextStyle(color: Colors.white,fontSize: 13)),
//                                 Container(width: 100,height: 1,color: Colors.white70,),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 8.0),
//                                   child: Text(widget.doc[Name],style: TextStyle(color: Colors.white,fontSize: 23),),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 10,)
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         iconSize: 30,
//                         icon: const Icon(Icons.edit,color: Colors.white,),
//                         onPressed: () {
//                           setState(() {
//                             _hide();
//                           });
//                         },
//                       ),
//                       Text(widget.doc[day],style: TextStyle(color: Colors.white70,fontSize: 15),),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//
//       ///업데이트 & 삭제
//
//       floatingActionButton: Stack(
//         children: [
//           /// 업데이트
//           Visibility(
//             visible: !_visibility,
//             child: FloatingActionButton(
//               backgroundColor: Colors.cyan,
//               onPressed: () async {
//                 FirebaseFirestore.instance
//                     .collection("FirstPage")
//                     .doc(widget.doc[Title])
//                     .set({
//                   Title: widget.doc[Title],
//                   day: date,
//                   content: _mainController.text
//                 }).then((value) {
//                   Navigator.pop(context);
//                 }).catchError((error) => print('뭔가 잘못됬어 찾아봐'));
//               },
//               child: Icon(Icons.save),
//             ),
//           ),
//
//           /// 삭제
//
//           Visibility(
//             visible: _visibility,
//             child: FloatingActionButton(
//                 backgroundColor: Colors.red,
//                 onPressed: () async {
//                   FirebaseFirestore.instance
//                       .collection("FirstPage")
//                       .doc(widget.doc[Title])
//                       .delete()
//                       .then((value) {
//                     Navigator.pop(context);
//                   }).catchError((error) => print('뭔가 잘못됬어 삭제를 못하잖아 이유를 찾아봐'));
//                 },
//                 child: Icon(Icons.delete)),
//           ),
//         ],
//       ),
//     );
//   }
// }
