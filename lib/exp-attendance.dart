import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:powersoft_app/clockout.dart';
import 'ListJ.dart';

class Exp extends StatefulWidget {
  final AttendanceData attendanceData;

 const Exp({required this.attendanceData, Key? key}) : super(key: key);

  @override
  State<Exp> createState() => _ExpState();
}

class _ExpState extends State<Exp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body:Stack( 
  children:[
    Positioned(
      top: 20,
      left:200,
   child: Image.asset('assets/images/attendance.png')),
  Positioned(
  top: 190,
  left: 10,
  child: 
  Text(' Date & Time: ${widget.attendanceData.attendanceDate}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
   Positioned(
  top: 70,
  left: 20,
  child: 
  Text(' Clocked In: ${widget.attendanceData.clockedIn}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
 
  Positioned(
  top: 110,
  left: 20,
  child: 
  Text(' Clocked out: ${widget.attendanceData.clockedOut}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
   Positioned(
  top: 230,
  left: 20,
  child: 
  Text(' Address: ${widget.attendanceData.geolocationAddress2}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
   Positioned(
  top: 260,
  left: 20,
  child: 
  Text(' Longitude: ${widget.attendanceData.geoLongitude}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
   Positioned(
  top: 290,
  left: 20,
  child: 
  Text(' Latitude: ${widget.attendanceData.geoLatitude}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
   Positioned(
  top: 320,
  left: 20,
  child: 
  Text(' Absent: ${widget.attendanceData.absent}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
  Positioned(
    top: 380,
    left: 115,
    child: ElevatedButton(onPressed: () {
    //showDialog(context: context, builder: (ctx) => AlertDialog(
      //title: Text('You Have Already Clocked In',style: GoogleFonts.tiltNeon(textStyle: TextStyle(fontSize: 18)
      //),
     // ),
      
   // ),
 //   );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor:Colors.grey,
    
    textStyle: TextStyle(fontSize: 23)
  
  ),
   child: Text('Clock In'))),
    Positioned(
    top: 430,
    left: 113,
    
    child: ElevatedButton(onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>clockout() ,));
  },
  style: ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: 20)
  ),
   child: Text('Clock Out')))
   
   ] ));
  }
}