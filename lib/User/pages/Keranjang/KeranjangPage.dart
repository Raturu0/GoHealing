// import 'package:dio/io.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class KeranjangPage extends StatefulWidget {
//   const KeranjangPage({Key? key}) : super(key: key);

//   @override
//   _KeranjangPageState createState() => _KeranjangPageState();
// }

// class _KeranjangPageState extends State<KeranjangPage> {
//   bool isChecked1 = true;
//   bool isChecked2 = true;
//   bool isChecked3 = true;
//   bool isChecked4 = false;
//   bool isChecked5 = false;
//   int itemCount = 1;

//   void _incrementItemCount() {
//     setState(() {
//       itemCount++;
//     });
//   }

//   void _decrementItemCount() {
//     if (itemCount > 1) {
//       setState(() {
//         itemCount--;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Keranjang"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Container(
              
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Color(0xFFBFC4F0),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               padding:
//                   EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 25),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: isChecked1,
//                         onChanged: (value) {
//                           setState(() {
//                             isChecked1 = value!;
//                             isChecked2 = value!;
//                             isChecked3 = value!;
//                           });
//                         },
//                       ),
//                       Text(
//                         "Souvenir Official Candi Borobudur",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 16),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.07,
//                         color: Color(0xFFFFC107),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.75,
//                         padding: EdgeInsets.only(top: 10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Checkbox(
//                                   value: isChecked2,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       isChecked2 = value!;
//                                     });
//                                   },
//                                 ),
//                                 Container(
//                                   width: 230,
//                                   height: 100,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(15),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Container(
//                                         width: 90,
//                                         height: 100,
//                                         decoration: BoxDecoration(
//                                           color: Colors.teal,
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                         ),
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                           child: Image.asset(
//                                             "assets/img/tiraibambu.png",
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ),
//                                       ),
//                                       Container(
//                                         width: 140,
//                                         height: 100,
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                         ),
//                                         child: Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Expanded(
//                                                   child: Text(
//                                                     "Tirai Bambu Lukisan Candi Borobudur",
//                                                     maxLines: 2,
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         fontSize: 14),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height: 3,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               children: [
//                                                 SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 Container(
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10),
//                                                     color: Color(0xFF2839CD),
//                                                   ),
//                                                   height: 25,
//                                                   width: 25,
//                                                   child: Container(
//                                                     child: Center(
//                                                       child: IconButton(
//                                                         onPressed: () {
//                                                           _decrementItemCount();
//                                                         },
//                                                         icon: Icon(
//                                                           Icons.remove,
//                                                           color: Colors.white,
//                                                           size: 10,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.symmetric(
//                                                       horizontal: 10),
//                                                   child: Text(
//                                                     itemCount.toString(),
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.only(
//                                                       bottom: 10),
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10),
//                                                     color: Color(0xFF2839CD),
//                                                   ),
//                                                   height: 25,
//                                                   width: 25,
//                                                   child: Container(
//                                                     child: Center(
//                                                       child: IconButton(
//                                                         onPressed: () {
//                                                           _incrementItemCount();
//                                                         },
//                                                         icon: Icon(
//                                                           Icons.add,
//                                                           color: Colors.white,
//                                                           size: 10,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               width: 5,
//                                               height: 5,
//                                             ),
//                                             Row(
//                                               children: [
//                                                 SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 Text("Rp. 40.000")
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               children: [
//                                 Checkbox(
//                                   value: isChecked3,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       isChecked3 = value!;
//                                     });
//                                   },
//                                 ),
//                                 Container(
//                                   width: 230,
//                                   height: 100,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(15),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Container(
//                                         width: 90,
//                                         height: 100,
//                                         decoration: BoxDecoration(
//                                           color: Colors.teal,
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                         ),
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                           child: Image.asset(
//                                             "assets/img/miniaturcb.png",
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ),
//                                       ),
//                                       Container(
//                                         width: 140,
//                                         height: 100,
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                         ),
//                                         child: Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Expanded(
//                                                   child: Text(
//                                                     "Miniatur Candi Borobudur",
//                                                     maxLines: 2,
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         fontSize: 14),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height: 3,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               children: [
//                                                 SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 Container(
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10),
//                                                     color: Color(0xFF2839CD),
//                                                   ),
//                                                   height: 25,
//                                                   width: 25,
//                                                   child: Container(
//                                                     child: Center(
//                                                       child: IconButton(
//                                                         onPressed: () {
//                                                           _decrementItemCount();
//                                                         },
//                                                         icon: Icon(
//                                                           Icons.remove,
//                                                           color: Colors.white,
//                                                           size: 10,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.symmetric(
//                                                       horizontal: 10),
//                                                   child: Text(
//                                                     itemCount.toString(),
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.only(
//                                                       bottom: 10),
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10),
//                                                     color: Color(0xFF2839CD),
//                                                   ),
//                                                   height: 25,
//                                                   width: 25,
//                                                   child: Container(
//                                                     child: Center(
//                                                       child: IconButton(
//                                                         onPressed: () {
//                                                           _incrementItemCount();
//                                                         },
//                                                         icon: Icon(
//                                                           Icons.add,
//                                                           color: Colors.white,
//                                                           size: 10,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               width: 5,
//                                               height: 5,
//                                             ),
//                                             Row(
//                                               children: [
//                                                 SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 Text("Rp. 90.000")
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//               color: Color(0xFFBFC4F0),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               padding:
//                   EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 25),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: isChecked4,
//                         onChanged: (value) {
//                           setState(() {
//                             isChecked4 = value!;
//                             isChecked5 = value!;
//                           });
//                         },
//                       ),
//                       Text(
//                         "Souvenir Official Dieng Plateau",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 16),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.07,
//                         color: Color(0xFFFFC107),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.75,
//                         padding: EdgeInsets.only(top: 10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Checkbox(
//                                   value: isChecked5,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       isChecked5 = value!;
//                                     });
//                                   },
//                                 ),
//                                 Container(
//                                   width: 230,
//                                   height: 100,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(15),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Container(
//                                         width: 90,
//                                         height: 100,
//                                         decoration: BoxDecoration(
//                                           color: Colors.teal,
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                         ),
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                           child: Image.asset(
//                                             "assets/img/souvenirofficialdieng.png",
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ),
//                                       ),
//                                       Container(
//                                         width: 140,
//                                         height: 100,
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                         ),
//                                         child: Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Expanded(
//                                                   child: Text(
//                                                     "Miniatur Candi Borobudur",
//                                                     maxLines: 2,
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         fontSize: 14),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height: 3,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               children: [
//                                                 SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 Container(
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10),
//                                                     color: Color(0xFF2839CD),
//                                                   ),
//                                                   height: 25,
//                                                   width: 25,
//                                                   child: Container(
//                                                     child: Center(
//                                                       child: IconButton(
//                                                         onPressed: () {
//                                                           _decrementItemCount();
//                                                         },
//                                                         icon: Icon(
//                                                           Icons.remove,
//                                                           color: Colors.white,
//                                                           size: 10,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.symmetric(
//                                                       horizontal: 10),
//                                                   child: Text(
//                                                     itemCount.toString(),
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.only(
//                                                       bottom: 10),
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10),
//                                                     color: Color(0xFF2839CD),
//                                                   ),
//                                                   height: 25,
//                                                   width: 25,
//                                                   child: Container(
//                                                     child: Center(
//                                                       child: IconButton(
//                                                         onPressed: () {
//                                                           _incrementItemCount();
//                                                         },
//                                                         icon: Icon(
//                                                           Icons.add,
//                                                           color: Colors.white,
//                                                           size: 10,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               width: 5,
//                                               height: 5,
//                                             ),
//                                             Row(
//                                               children: [
//                                                 SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 Text("Rp. 30.000")
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 15,),
//               Container(
//                 child: Align(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                       color: Color(0xFFBFC4F0),
//                       ),
//                       width: double.infinity,
//                       padding: EdgeInsets.all(20),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Total Item", style: TextStyle(
//                                 fontWeight: FontWeight.bold
//                               ),),
//                               Text(isChecked1 ? "2" : "0", style: TextStyle(
//                                 fontWeight: FontWeight.bold
//                               )),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Total Pesanan", style: TextStyle(
//                                 fontWeight: FontWeight.bold
//                               )),
//                               Text(isChecked1 ? "Rp. 130.000" : "Rp. 0", style: TextStyle(
//                                 fontWeight: FontWeight.bold
//                               )),
//                             ],
//                           ),
//                           ElevatedButton(
                
//                             style: ElevatedButton.styleFrom(
//                               padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * (0.19)),
//                               backgroundColor: Color(0xFF2839CD),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10)
//                               )
//                             ),
//                               onPressed: () {
//                                 print("klik beli");
//                               },
//                               child: Text("Beli Sekarang", style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                                 fontSize: 24,
//                                 fontFamily: GoogleFonts.poppins().fontFamily
//                               ),))
//                         ],
//                       ),
//                     )),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import "package:flutter/material.dart";

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        centerTitle: true,
        title: Text("Keranjang"),
      ),
      body: Center(
        child: Text("Keranjang Anda masih kosong"),
      ),
    );
  }
}